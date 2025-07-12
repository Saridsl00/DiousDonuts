@extends('frontend.layouts.master')

@section('title','Checkout page')

@section('main-content')
<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{route('home')}}">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0)">Checkout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Checkout -->
<section class="shop checkout section">
    <div class="container">
        <form class="form" method="POST" id="checkout-form" action="{{route('cart.order')}}">
            @csrf
            <div class="row">
                <div class="col-lg-8 col-12">
                    <div class="checkout-form">
                        <h2>Make Your Checkout Here</h2>
                        <p>Please register in order to checkout more quickly</p>
                        <!-- Form -->
                        <div class="row">
                            <!-- First Name -->
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>First Name<span>*</span></label>
                                    <input type="text" name="first_name" value="{{old('first_name')}}">
                                    @error('first_name') <span class='text-danger'>{{$message}}</span> @enderror
                                </div>
                            </div>
                            <!-- Last Name -->
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Last Name<span>*</span></label>
                                    <input type="text" name="last_name" value="{{old('last_name')}}">
                                    @error('last_name') <span class='text-danger'>{{$message}}</span> @enderror
                                </div>
                            </div>
                            <!-- Email -->
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Email Address<span>*</span></label>
                                    <input type="email" name="email" value="{{old('email')}}">
                                    @error('email') <span class='text-danger'>{{$message}}</span> @enderror
                                </div>
                            </div>
                            <!-- Phone -->
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Phone Number<span>*</span></label>
                                    <input type="number" name="phone" value="{{old('phone')}}">
                                    @error('phone') <span class='text-danger'>{{$message}}</span> @enderror
                                </div>
                            </div>
                            <!-- Address -->
                            <div class="col-lg-6 col-md-6 col-12">
                                <div class="form-group">
                                    <label>Address Line<span>*</span></label>
                                    <input type="text" name="address" value="{{old('address')}}">
                                    @error('address') <span class='text-danger'>{{$message}}</span> @enderror
                                </div>
                            </div>
                        </div>
                        <!--/ End Form -->
                    </div>
                </div>

                <div class="col-lg-4 col-12">
                    <div class="order-details">
                        <!-- Order Summary -->
                        <div class="single-widget">
                            <h2>CART TOTALS</h2>
                            <div class="content">
                                <ul>
                                    <li class="order_subtotal" data-price="{{Helper::totalCartPrice()}}">
                                        Cart Subtotal<span>Rp. {{number_format(Helper::totalCartPrice(),2)}}</span>
                                    </li>
                                    <li class="shipping">
                                        Shipping Cost
                                        @if(count(Helper::shipping())>0 && Helper::cartCount()>0)
                                            <select name="shipping" class="nice-select">
                                                <option value="">Select your Shipping</option>
                                                @foreach(Helper::shipping() as $shipping)
                                                    <option value="{{$shipping->id}}" data-price="{{$shipping->price}}">
                                                        {{$shipping->type}}: Rp. {{$shipping->price}}
                                                    </option>
                                                @endforeach
                                            </select>
                                        @else
                                            <span>Free</span>
                                        @endif
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Payment Options -->
                        <div class="single-widget">
                            <h2>Payments</h2>
                            <div class="content">
                                <div class="checkbox">
                                    <input type="radio" name="payment_method" value="cod" checked> <label>Cash On Delivery</label><br>
                                    <input type="radio" name="payment_method" value="midtrans"> <label>Midtrans</label>
                                </div>
                            </div>
                        </div>

                        <!-- Checkout Button -->
                        <div class="single-widget get-button">
                            <div class="content">
                                <div class="button">
                                    <button type="submit" id="submit-button" class="btn">Proceed to Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!--/ End Checkout -->
@endsection

@push('styles')
<style>
    li.shipping {
        display: inline-flex;
        width: 100%;
        font-size: 14px;
    }
</style>
@endpush

@push('scripts')
<script src="{{asset('frontend/js/nice-select/js/jquery.nice-select.min.js')}}"></script>

<script>
$(document).ready(function () {
    $('select.nice-select').niceSelect();

    let form = document.getElementById('checkout-form');
    
    form.addEventListener('submit', function (e) {
        let selectedPayment = document.querySelector('input[name="payment_method"]:checked').value;
        
        // Jika bukan Midtrans, submit form normal
        if (selectedPayment !== 'midtrans') {
            return; // Biarkan form submit normal
        }
        
        // Untuk Midtrans, submit form dulu untuk generate token
        // Token akan dihasilkan di server dan halaman akan redirect ke checkout-midtrans
    });
});
</script>

<!-- Midtrans Snap.js -->
<script src="https://app.sandbox.midtrans.com/snap/snap.js" 
        data-client-key="{{ config('midtrans.client_key') }}"></script>
@endpush