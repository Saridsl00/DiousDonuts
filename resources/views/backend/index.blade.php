@extends('backend.layouts.master')
@section('title','DIOUS DONUTS|| DASHBOARD')
@section('main-content')
<div class="container-fluid">
    @include('backend.layouts.notification')

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>

    <!-- Welcome Alert -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card shadow">
                <div class="card-body border-top">
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Welcome to Admin, Dious Donat!</h4>
                        <p>Donut Shop Website with the Access Permissions Granted.</p>
                        <hr>
                        <p class="mb-0">Keep striving to improve sales!!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Dashboard Cards -->
    <div class="row gx-4"> {{-- gx-4 untuk jarak horizontal antara kolom --}}
        <!-- Category -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Category</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Category::countActiveCategory()}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-sitemap fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Products -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Products</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Product::countActiveProduct()}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-cubes fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Order -->
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Order</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">{{\App\Models\Order::countActiveOrder()}}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection

@push('scripts')
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

@endpush