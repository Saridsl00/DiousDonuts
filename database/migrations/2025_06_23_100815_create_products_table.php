<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->unsignedBigInteger('cat_id')->nullable();
            $table->float('price');
            $table->float('discount')->nullabale();
            $table->integer('stock')->default(1);
            $table->text('summary');
            $table->boolean('is_featured')->deault(false);
            $table->text('photo');
            $table->enum('status',['active','inactive'])->default('inactive');
            $table->foreign('cat_id')->references('id')->on('categories')->onDelete('SET NULL');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
