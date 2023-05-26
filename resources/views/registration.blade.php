@extends('layout')
@section('title', 'Registration')

@section('content')
    <div style="height: 100px;"></div>
    <div class="mt-5">
        @if ($errors->any())
            <div class="col-12">
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger my-4" style="max-width: 750px; margin: 0 auto;">{{ $error }}</div>
                @endforeach
            </div>
        @endif

        @if (Session()->has('error'))
            <div class="alert alert-danger my-4" style="max-width: 750px; margin: 0 auto;">{{ Session('error') }}</div>
        @endif

        @if (Session()->has('success'))
            <div class="alert alert-success my-4" style="max-width: 750px; margin: 0 auto;">{{ Session('success') }}</div>
        @endif
    </div>


    <form action="{{ route('registration.post') }}" method="POST" class="ms-auto me-auto mt-5" style="width: 500px">
        @csrf
        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" class="form-control" name="name">

        </div>

        <div class="mb-3">
            <label class="form-label">Email address</label>
            <input type="email" class="form-control" name="email">

        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password">
        </div>


        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
@endsection
