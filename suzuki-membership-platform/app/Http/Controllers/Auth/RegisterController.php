<?php
	
	namespace App\Http\Controllers\Auth;
	
	use App\Http\Controllers\Controller;
	use App\Models\District;
	use App\Models\Province;
	use App\Models\User;
	use Illuminate\Foundation\Auth\RegistersUsers;
	use Illuminate\Http\Request;
	use Illuminate\Support\Facades\Auth;
	use Illuminate\Support\Facades\Hash;
	use Illuminate\Support\Facades\Route;
	use Illuminate\Support\Facades\Validator;
	
	class RegisterController extends Controller
	{
		/*
		|--------------------------------------------------------------------------
		| Register Controller
		|--------------------------------------------------------------------------
		|
		| This controller handles the registration of new users as well as their
		| validation and creation. By default this controller uses a trait to
		| provide this functionality without requiring any additional code.
		|
		*/
		
		use RegistersUsers;
		
		/**
		 * Where to redirect users after registration.
		 *
		 * @var string
		 */
//    protected $redirectTo = RouteServiceProvider::HOME;		/**
		/* Create a new controller instance.
		*
		* @return void
		*/
		public function __construct(Request $request)
		{
			if (Route::currentRouteName() != 'register-welcome') {
				$this->middleware('guest');
			}
		}
		
		public function showRegistrationForm(Request $request)
		{
			if (Auth::check()) {
				return redirect()->to($this->redirectTo);
			}
			$provinces = Province::orderBy('name')->pluck('name', 'id')->toArray();
			if ($oldProvince = $request->old('province')) {
				$oldDistricts = District::where('province_id', $oldProvince)
					->orderBy('name')
					->pluck('name', 'id')
					->toArray();
			}
			
			return view('auth.register', [
				'provinces' => $provinces,
				'oldDistricts' => $oldProvince ? $oldDistricts : false
			]);
		}
		
		public function registrationWelcome(Request $request)
		{
			$customer = Auth::getUser()->customer;
			if ($customer->vehicles->isNotEmpty()) {
				return redirect(route('dashboard-home'));
			} else {
				return view('auth.register-welcome', [
					'customer' => $customer
				]);
			}
			
			
		}
		
		
		protected function redirectTo()
		{
			return route('register-welcome');
		}
		
		/**
		 * Get a validator for an incoming registration request.
		 *
		 * @param array $data
		 * @return \Illuminate\Contracts\Validation\Validator
		 */
		
		protected function validator(array $data)
		{
			$rules = [
				'name'              => ['required', 'string', 'max:255'],
				'email'             => ['required', 'string', 'email', 'max:255', 'unique:users'],
				'mobile'            => ['required', 'unique:users', 'regex:/0(?:8|9|3|7|5)\d{8}/'],
				'password'          => ['required', 'string', 'min:8', 'confirmed'],
				'district'          => ['required', 'exists:districts,id'],
				'province'          => ['required', 'exists:provinces,id'],
				'id_issue_province' => ['required', 'exists:provinces,id'],
				'agree'             => ['accepted']
			];
			if (\request()->is_corporate == 0){
				$rules['id_number'] = ['required', 'min:9', 'max:12', 'unique:customers,id_number'];
			}
			else{
				$rules['id_number'] = ['required', 'min:10', 'max:13', 'unique:customers,id_number'];
			}
			return Validator::make($data, $rules);
		}
		
		
//	[
//	'id_number' => ['required', 'min:9', 'max:12', 'unique:customers', 'id_number']
//	]

//    public function updateInfo(Request $request)
//    {
//        if ($request->getMethod() == 'GET') {
//            $user = Auth::getUser();
//            $customer = $user->customer;
//            $provinces = Province::orderBy('name')->pluck('name', 'id')->toArray();
//            return view('auth.register-info', [
//                'customer'  => $customer,
//                'provinces' => $provinces
//            ]);
//        }
//        if ($request->getMethod() == 'POST') {
//
//        }
//    }
		
		/**
		 * Create a new user instance after a valid registration.
		 *
		 * @param array $data
		 * @return bool|\App\Models\User
		 */
		protected function create(array $data)
		{
			$user = User::create([
				'email' => $data['email'],
				'password' => Hash::make($data['password']),
				'mobile' => $data['mobile'],
				'status' => config('constants.user.status_approved')
			]);
			if ($user) {
				$user->assignRole('Customer');
				$customer = $user->customer()->create([
					'is_corporate' => $data['is_corporate'],
					'name' => $data['name'],
					'mobile' => $data['mobile'],
					'email' => $data['email'],
					'gender' => $data['gender'],
					'district_id' => $data['district'],
					'dealer_id' => config('constants.dealer.direct_shop_id'),
					// TODO: Remove Direct Shop as default customer's Dealer
					'id_number' => $data['id_number'],
					'id_issue_date' => $data['id_issue_date'],
					'id_issue_province' => $data['id_issue_province'],
					'birthday' => $data['birthday'],
					'address' => $data['address'],
					'point_balance' => 0
				
				]);
				if ($customer) {
					return $user;
				}
			}
			return false;
		}
	}
