@extends('frontend.layouts.master')

@section('title','Midtrans Payment')

@section('main-content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4>Complete Your Payment</h4>
                </div>
                <div class="card-body">
                    <div class="order-summary mb-4">
                        <h5>Order Summary</h5>
                        <p><strong>Order Number:</strong> {{ $order->order_number }}</p>
                        <p><strong>Total Amount:</strong> Rp. {{ number_format($order->total_amount, 2) }}</p>
                    </div>
                    
                    <div class="text-center">
                        <button id="pay-button" class="btn btn-primary btn-lg">
                            Pay Now with Midtrans
                        </button>
                    </div>
                    
                    <div class="mt-3 text-center">
                        <a href="{{ route('home') }}" class="btn btn-secondary">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://app.sandbox.midtrans.com/snap/snap.js" 
        data-client-key="{{ config('midtrans.client_key') }}"></script>

<script type="text/javascript">
document.getElementById('pay-button').onclick = function(){
    @if(isset($snapToken))
        snap.pay('{{ $snapToken }}', {
            onSuccess: function(result){
                console.log('Payment success:', result);
                
                // Redirect ke halaman sukses atau home
                window.location.href = '{{ route("home") }}?payment=success';
            },
            onPending: function(result){
                console.log('Payment pending:', result);
                alert('Payment is pending. Please complete your payment.');
            },
            onError: function(result){
                console.log('Payment error:', result);
                alert('Payment failed. Please try again.');
            },
            onClose: function(){
                console.log('Payment popup closed');
                alert('You closed the payment popup without completing the payment.');
            }
        });
    @else
        alert('Payment token is not available. Please try again.');
    @endif
};
</script>
@endsection