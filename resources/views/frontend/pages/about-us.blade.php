@extends('frontend.layouts.master')

@section('title', 'DIOUS DONUTS || About Us')

@section('main-content')

<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li><a href="{{ route('home') }}">Home<i class="ti-arrow-right"></i></a></li>
                        <li class="active"><a href="javascript:void(0)">About Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- About Us -->
<section class="about-us section">
    <div class="container">
        <div class="row">
            @php
                $setting = DB::table('settings')->first();
            @endphp

            <div class="col-lg-6 col-12">
                <div class="about-content">
                    <h3>Welcome To <span>Dious Donuts</span></h3>
                    @if($setting && $setting->description)
                        <p>{!! $setting->description !!}</p>
                    @else
                        <p>We are passionate about delivering delicious donuts and sweet experiences to our customers.</p>
                    @endif
                    <div class="button">
                        <a href="{{ route('contact') }}" class="btn primary">Contact Us</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-12">
                <div class="about-img overlay">
                    @if($setting && $setting->photo)
                        <img src="{{ asset($setting->photo) }}" alt="About Us Image">
                    @else
                        <img src="{{ asset('frontend/img/default-about.jpg') }}" alt="Default About Image">
                    @endif
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End About Us -->

@endsection
