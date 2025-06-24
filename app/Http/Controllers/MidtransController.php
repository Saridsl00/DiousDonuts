<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use Midtrans\Notification;

class MidtransController extends Controller
{
    public function callback(Request $request)
    {
        $notif = new Notification();

        $order = Order::where('order_number', $notif->order_id)->first();
        if (!$order) return response()->json(['status' => 'order not found'], 404);

        if ($notif->transaction_status == 'settlement' || $notif->transaction_status == 'capture') {
            $order->payment_status = 'paid';
            $order->status = 'process';
        } elseif ($notif->transaction_status == 'pending') {
            $order->payment_status = 'pending';
        } elseif ($notif->transaction_status == 'expire' || $notif->transaction_status == 'cancel') {
            $order->payment_status = 'cancel';
        }

        $order->save();
        return response()->json(['status' => 'success']);
    }
}

