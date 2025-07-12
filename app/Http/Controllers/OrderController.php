<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\User;
use Notification;
use Helper;
use Midtrans\Snap;
use Midtrans\Config;
use Illuminate\Support\Str;
use App\Notifications\StatusNotification;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Order::orderBy('id', 'DESC')->paginate(10);
        return view('backend.order.index', compact('orders'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'string|required',
            'last_name' => 'string|required',
            'address' => 'string|required',
            'phone' => 'numeric|required',
            'email' => 'required|email',
            'payment_method' => 'required|in:cod,midtrans'
        ]);

        $userId = auth()->user()->id;

        if (Cart::where('user_id', $userId)->whereNull('order_id')->count() == 0) {
            return back()->with('error', 'Cart is empty!');
        }

        $order = new Order();

        $order_data = $request->only([
            'first_name', 'last_name', 'email', 'phone', 'address'
        ]);
        $order_data['order_number'] = 'ORD-' . strtoupper(Str::random(10));
        $order_data['user_id'] = $userId;
        $order_data['shipping_id'] = $request->shipping;
        $shipping = Shipping::find($order_data['shipping_id']);
        $order_data['sub_total'] = Helper::totalCartPrice();
        $order_data['quantity'] = Helper::cartCount();
        $order_data['total_amount'] = $order_data['sub_total'] + ($shipping->price ?? 0);
        $order_data['status'] = 'new';
        $order_data['payment_method'] = $request->payment_method;
        $order_data['payment_status'] = 'unpaid';

        if ($request->payment_method === 'midtrans') {
            Config::$serverKey = config('midtrans.server_key');
            Config::$isProduction = config('midtrans.is_production');
            Config::$isSanitized = true;
            Config::$is3ds = true;

            $params = [
                'transaction_details' => [
                    'order_id' => $order_data['order_number'],
                    'gross_amount' => (int) $order_data['total_amount'],
                ],
                'customer_details' => [
                    'first_name' => $order_data['first_name'],
                    'last_name' => $order_data['last_name'],
                    'email' => $order_data['email'],
                    'phone' => $order_data['phone'],
                ],
            ];

            try {
                $snapToken = Snap::getSnapToken($params);
                $order_data['snap_token'] = $snapToken;
            } catch (\Exception $e) {
                return back()->with('error', 'Gagal mendapatkan Snap Token: ' . $e->getMessage());
            }
        }

        $order->fill($order_data);
        $order->save();

        // Update cart
        Cart::where('user_id', $userId)->whereNull('order_id')->update(['order_id' => $order->id]);

        // Kirim notifikasi ke admin
        $admin = User::where('role', 'admin')->first();
        $details = [
            'title' => 'New order created',
            'actionURL' => route('order.show', $order->id),
            'fas' => 'fa-file-alt'
        ];
        Notification::send($admin, new StatusNotification($details));

        // Jika Midtrans, tampilkan view pembayaran
        if ($request->payment_method === 'midtrans') {
            return view('frontend.pages.checkout-midtrans', [
                'order' => $order,
                'snapToken' => $order->snap_token
            ]);
        }

        session()->forget('cart');
        return redirect()->route('home')->with('success', 'Your order has been placed successfully.');
    }

    public function show($id)
    {
        $order = Order::findOrFail($id);
        return view('backend.order.show', compact('order'));
    }

    public function edit($id)
    {
        $order = Order::findOrFail($id);
        return view('backend.order.edit', compact('order'));
    }

    public function update(Request $request, $id)
    {
        $order = Order::findOrFail($id);

        $this->validate($request, [
            'status' => 'required|in:new,process,delivered,cancel'
        ]);

        if ($request->status === 'delivered') {
            foreach ($order->carts as $cart) {
                $product = $cart->product;
                $product->stock -= $cart->quantity;
                $product->save();
            }
        }

        $order->status = $request->status;
        $order->save();

        return redirect()->route('order.index')->with('success', 'Order status updated.');
    }

    public function destroy($id)
    {
        $order = Order::findOrFail($id);
        $order->delete();

        return redirect()->route('order.index')->with('success', 'Order deleted successfully.');
    }

    public function orderTrack()
    {
        return view('frontend.pages.order-track');
    }

    public function productTrackOrder(Request $request)
    {
        $order = Order::where('user_id', auth()->id())
            ->where('order_number', $request->order_number)
            ->first();

        if (!$order) {
            return back()->with('error', 'Invalid order number, please try again.');
        }

        switch ($order->status) {
            case 'new':
                return redirect()->route('home')->with('success', 'Your order has been placed. Please wait.');
            case 'process':
                return redirect()->route('home')->with('success', 'Your order is being processed.');
            case 'delivered':
                return redirect()->route('home')->with('success', 'Your order has been delivered.');
            default:
                return redirect()->route('home')->with('error', 'Your order was canceled.');
        }
    }


    public function incomeChart(Request $request)
    {
        $year = now()->year;

        $items = Order::with('carts')
            ->whereYear('created_at', $year)
            ->where('status', 'delivered')
            ->get()
            ->groupBy(function ($d) {
                return $d->created_at->format('m');
            });

        $result = [];

        foreach ($items as $month => $orders) {
            foreach ($orders as $order) {
                $amount = $order->carts->sum('amount');
                $result[(int)$month] = ($result[(int)$month] ?? 0) + $amount;
            }
        }

        $data = [];
        for ($i = 1; $i <= 12; $i++) {
            $monthName = date('F', mktime(0, 0, 0, $i, 1));
            $data[$monthName] = number_format($result[$i] ?? 0, 2, '.', '');
        }

        return $data;
    }

    public function midtransCheckout($orderId)
    {
        $order = Order::findOrFail($orderId);
        return view('frontend.pages.checkout-midtrans', [
            'order' => $order,
            'snapToken' => $order->snap_token
        ]);
    }
}
