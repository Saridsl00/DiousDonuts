<?php

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Settings;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $user=array(
            array(
                'name'=>'Admin',
                'email'=>'admin@gmail.com',
                'password'=>Hash::make('1111'),
                'role'=>'admin',
                'status'=>'active'
            ),
            array(
                'name'=>'User',
                'email'=>'user@gmail.com',
                'password'=>Hash::make('1111'),
                'role'=>'user',
                'status'=>'active'
            ),
        );

        DB::table('users')->insert($user);

        $setting=array(
            'description'=>"Dious Donuts is a donut shop dedicated to delivering sweet flavors and memorable culinary experiences through high-quality products. 
                            Founded by a passionate and experienced team of bakers, we believe that every bite of a donut should bring joy. 
                            With a variety of unique flavors and eye-catching designs, 
                            Dious Donuts offers more than just desserts — we create special moments to be shared with your loved ones. 
                            We use only the finest ingredients and carefully crafted recipes to ensure a soft texture and unforgettable taste. 
                            Dious Donuts — where sweet moments begin!",
            'photo'=>"/storage/photos/1/oke.png",
            'logo'=>'/storage/photos/1/oke.png',
            'address'=>"Kemanggisan, Jakarta Barat",
            'email'=>"DiousDonuts@gmail.com",
            'phone'=>"+621234567890",
        );
        DB::table('settings')->insert($setting);

    }
}