<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>@yield('title')</title>
	
	<link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
	<!-- Custom stlylesheet -->
	<style>
		* {
		  -webkit-box-sizing: border-box;
		          box-sizing: border-box;
		}

		body {
		  padding: 0;
		  margin: 0;
		  overflow-y: hidden;
		  background-color: #f8f9fa;
		}

		#notfound {
		  position: relative;
		  height: 100vh;
		}

		#notfound .notfound {
		  position: absolute;
		  left: 50%;
		  top: 50%;
		  -webkit-transform: translate(-50%, -50%);
		      -ms-transform: translate(-50%, -50%);
		          transform: translate(-50%, -50%);
		}

		.notfound {
		  max-width: 80%;
		  width: 100%;
		  text-align: center;
		}

		.notfound .notfound-404 {
		  height: 280px;
		  position: relative;
		  z-index: -1;
		}

		.notfound .notfound-404 h1 {
		  font-family: 'Nunito', sans-serif;
		  font-size: 230px;
		  margin: 0px;
		  font-weight: 900;
		  position: absolute;
		  left: 50%;
		  -webkit-transform: translateX(-50%);
		      -ms-transform: translateX(-50%);
		          transform: translateX(-50%);
		  background: url('{{ asset('images/error.jpg') }}') no-repeat;
		  -webkit-background-clip: text;
		  -webkit-text-fill-color: transparent;
		  background-size: cover;
		  background-position: center;
		}


		.notfound h2 {
		  font-family: 'Nunito', sans-serif;
		  color: #000;
		  font-size: 24px;
		  font-weight: 700;
		  text-transform: uppercase;
		  margin-top: 0;
		}

		.notfound p {
		  font-family: 'Nunito', sans-serif;
		  color: #000;
		  font-size: 14px;
		  font-weight: 400;
		  margin-bottom: 20px;
		  margin-top: 0px;
		}

		.notfound a {
		  font-family: 'Nunito', sans-serif;
		  font-size: 14px;
		  text-decoration: none;
		  text-transform: uppercase;
		  background: #0046d5;
		  display: inline-block;
		  padding: 15px 30px;
		  border-radius: 40px;
		  color: #fff;
		  font-weight: 700;
		  -webkit-box-shadow: 0px 4px 15px -5px #0046d5;
		          box-shadow: 0px 4px 15px -5px #0046d5;
		}


		@media only screen and (max-width: 767px) {
		    .notfound .notfound-404 {
		      height: 142px;
		    }
		    .notfound .notfound-404 h1 {
		      font-size: 112px;
		    }
		}

	</style>
</head>
<body>

	<div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
				<h1>@yield('code', __('Woops'))</h1>
			</div>
			<h2>@yield('message')</h2>
	
			<a href="{{ url('/') }}">
				Go To Homepage
			</a>
		</div>
	</div>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
