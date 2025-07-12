<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Cart;
use App\Models\Shipping;
use App\Models\User;

class Order extends Model
{
    protected $fillable = [
        'user_id',
        'order_number',
        'sub_total',
        'quantity',
        'delivery_charge', // Pastikan ada di migration
        'status',
        'total_amount',
        'first_name',
        'last_name',
        'address',
        'phone',
        'email',
        'payment_method',
        'payment_status',
        'shipping_id',
        'snap_token'
    ];

    public function carts()
    {
        return $this->hasMany(Cart::class, 'order_id', 'id');
    }

    public function shipping()
    {
        return $this->belongsTo(Shipping::class, 'shipping_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public static function getAllOrder($id)
    {
        return self::with('carts')->find($id);
    }

    public static function countActiveOrder()
    {
        return self::count();
    }


    public function products()
    {
        return $this->hasManyThrough(Product::class, Cart::class, 'order_id', 'id', 'id', 'product_id');
    }

    
}
