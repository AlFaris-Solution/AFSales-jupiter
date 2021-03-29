<!doctype html>
<html lang="en">
<head>
    @include('partials.head')
</head>
<body class="@if(auth()->user()->hasRole('Kasir')) nav-sm @else nav-md @endif"> 
    <div class="container body">
        <div class="main_container">
            
            @include('partials.sidebar')
            @include('partials.topbar')
            
            <div class="right_col" role="main" style="background: #F4F6F9;">
                <section class="content" style="padding-bottom: 1.5em;">
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    @if ($message = Session::get('warning'))
                        <div class="alert alert-warning">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    @if ($message = Session::get('danger'))
                        <div class="alert alert-danger">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    @yield('content')
                </section>
            </div>
            @include('partials.footer')
        </div>
    </div>
    
    @include('partials.javascripts')
    @stack('ext_js')
</body>
</html>