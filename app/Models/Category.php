<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = [
        'title',
        'slug',
        'summary',
        'photo',
        'status',
        'added_by'
    ];

    // Ambil semua kategori dengan pagination
    public static function getAllCategory()
    {
        return Category::orderBy('id', 'DESC')->paginate(10);
    }

    // Hitung total kategori aktif
    public static function countActiveCategory()
    {
        $data = Category::where('status', 'active')->count();
        return $data ?? 0;
    }

    // Relasi ke produk utama (kategori)
    public function products()
    {
        return $this->hasMany('App\Models\Product', 'cat_id', 'id')->where('status', 'active');
    }

    // Ambil produk berdasarkan slug kategori
    public static function getProductByCat($slug)
    {
        return Category::with('products')->where('slug', $slug)->first();
    }
}
