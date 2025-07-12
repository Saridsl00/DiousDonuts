<?php
use App\Models\Message;
use App\Models\Category;
use App\Models\Order;
use App\Models\Wishlist;
use App\Models\Shipping;
use App\Models\Cart;
use Midtrans\Config;
use Midtrans\Snap;

class Helper {

    public static function messageList() {
        return Message::whereNull('read_at')->orderBy('created_at', 'desc')->get();
    }

    public static function getAllCategory() {
        return Category::orderBy('title', 'ASC')->get();
    }

    public static function getHeaderCategory() {
        $menu = Category::orderBy('title', 'ASC')->get();

        if ($menu) {
            ?>
            <li>
                <a href="javascript:void(0);">Category<i class="ti-angle-down"></i></a>
                <ul class="dropdown border-0 shadow">
                    <?php foreach ($menu as $cat_info): ?>
                        <li><a href="<?php echo route('product-cat', $cat_info->slug); ?>"><?php echo $cat_info->title; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </li>
            <?php
        }
    }

    public static function productCategoryList($option = 'all') {
        if ($option == 'all') {
            return Category::orderBy('id', 'DESC')->get();
        }
        return Category::has('products')->orderBy('id', 'DESC')->get();
    }

    

    public static function cartCount($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Cart::where('user_id', $user_id)->where('order_id', null)->sum('quantity');
        }
        return 0;
    }

    public static function getAllProductFromCart($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Cart::with('product')->where('user_id', $user_id)->where('order_id', null)->get();
        }
        return 0;
    }

    public static function totalCartPrice($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Cart::where('user_id', $user_id)->where('order_id', null)->sum('amount');
        }
        return 0;
    }

    public static function wishlistCount($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Wishlist::where('user_id', $user_id)->where('cart_id', null)->sum('quantity');
        }
        return 0;
    }

    public static function getAllProductFromWishlist($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Wishlist::with('product')->where('user_id', $user_id)->where('cart_id', null)->get();
        }
        return 0;
    }

    public static function totalWishlistPrice($user_id = '') {
        if (Auth::check()) {
            if ($user_id == "") $user_id = auth()->user()->id;
            return Wishlist::where('user_id', $user_id)->where('cart_id', null)->sum('amount');
        }
        return 0;
    }

    public static function grandPrice($id, $user_id) {
        $order = Order::find($id);
        if ($order) {
            $shipping_price = (float)$order->shipping->price;
            $order_price = self::orderPrice($id, $user_id);
            return number_format((float)($order_price + $shipping_price), 2, '.', '');
        }
        return 0;
    }

    public static function earningPerMonth() {
        $month_data = Order::where('status', 'delivered')->get();
        $price = 0;
        foreach ($month_data as $data) {
            $price += $data->cart_info->sum('price');
        }
        return number_format((float)$price, 2, '.', '');
    }

    public static function shipping() {
        return Shipping::orderBy('id', 'DESC')->get();
    }

    public static function createMidtransSnapToken($order_id, $user_id = null)
{
    if ($user_id === null && Auth::check()) {
        $user_id = auth()->user()->id;
    }

    $user = auth()->user();
    $cart_items = self::getAllProductFromCart($user_id);

    if ($cart_items->isEmpty()) return null;

    $items = [];
    foreach ($cart_items as $item) {
        $items[] = [
            'id' => $item->product_id,
            'price' => (int)$item->price,
            'quantity' => $item->quantity,
            'name' => $item->product->title,
        ];
    }

    $gross_amount = self::totalCartPrice($user_id);

    self::initMidtrans();

    $transaction_details = [
        'order_id' => $order_id,
        'gross_amount' => (int)$gross_amount,
    ];

    $customer_details = [
        'first_name' => $user->first_name,
        'last_name' => $user->last_name,
        'email' => $user->email,
        'phone' => $user->phone,
    ];

    $payload = [
        'transaction_details' => $transaction_details,
        'item_details' => $items,
        'customer_details' => $customer_details,
    ];

    return Snap::getSnapToken($payload);
}

public static function initMidtrans()
{
    Config::$serverKey = env('MIDTRANS_SERVER_KEY');
    Config::$isProduction = env('MIDTRANS_IS_PRODUCTION', false);
    Config::$isSanitized = true;
    Config::$is3ds = true;
}
}
