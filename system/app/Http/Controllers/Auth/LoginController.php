<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

use Socialite;
use Auth;
use App\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login / registration.
     *
     * @var string
     */
    protected $redirectTo = '/admin/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }
    
    public function login(Request $request)
{
    $this->validate($request, [
        'username' => 'required|string',
        'password' => 'required|string',
    ]);


    $loginType = filter_var($request->username, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';

    $login = [
        $loginType => $request->username,
        'password' => $request->password
    ];
  

    if (auth()->attempt($login)) {

        return redirect('/');
    }

    return redirect()->route('auth.login')->with(['error' => 'Email/Password salah!']);
}

        public function username()
    {
        $login = request()->input('identity');

        $field = filter_var($login, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$field => $login]);

        return $field;
    }
    
}
