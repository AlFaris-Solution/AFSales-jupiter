<!doctype html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSRF Token -->
<meta name="csrf-token" content="{{ csrf_token() }}">

<title>{{ config('app.name', 'Jupiter Bike App') }} | Login</title>

<link rel="icon" href="{{ asset('favicon.png') }}" type="image/png">

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="{{ asset('bower_components/gentelella/build/css/gentelella.min.css') }}">
<style>
    body {
        background: #F4F6F9 !important;
        margin: 0;
        font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-weight: 400;
        line-height: 1.5;
        color: #212529;
        text-align: left;
    }
</style>
</head>
  <body class="login">
    <div>
        <a class="hiddenanchor" id="signup"></a>
        <a class="hiddenanchor" id="signin"></a>
        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    
                    <form class="form-horizontal" method="POST" action="{{ url('/login') }}">
                        {{ csrf_field() }}
                        <h1><p class="login-box-msg">
                            <img src="{{url('/images/logo')}}/logo.png" width="120"  class="img-square" >
                        </p></h1>
                        
                        <div>
                            <input name="username" type="text" class="form-control" placeholder="Username" required="" value="{{ old('username') }}" autofocus />
                        </div>
                        <div>
                            <input name="password" type="password" class="form-control" placeholder="Password" required="" value="{{ old('password') }}" />
                        </div>
                        
                        <div>
                            <button type="submit" class="btn btn-default submit"> Log in</button>
                            <button type="reset" class="btn btn-default submit"> Reset</button>
                            <!-- <a class="reset_pass" href="#">Lost your password?</a> -->
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <p class="change_link">Belum punya akses ?
                                <!--<a href="{{ url('/register') }}" class="to_register"> Buat Akun </a>-->
                                Silahkan hubungi Admin
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <p>©2021 All Rights Reserved. Jupiter Bike App</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <div id="register" class="animate form registration_form">
                <section class="login_content">
                    <form>
                        <h1>Create Account</h1>
                        <div>
                            <input type="text" class="form-control" placeholder="Username" required="" />
                        </div>
                        <div>
                            <input type="email" class="form-control" placeholder="Email" required="" />
                        </div>
                        <div>
                            <input type="password" class="form-control" placeholder="Password" required="" />
                        </div>
                        <div>
                            <a class="btn btn-default submit" href="index.html">Submit</a>
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">
                            <p class="change_link">Already a member ?
                                <a href="#signin" class="to_register"> Log in </a>
                            </p>
                            <div class="clearfix"></div>
                            <br />
                            <div>
                                <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
                                <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
  </body>
</html>
