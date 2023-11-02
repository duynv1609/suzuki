<?php
    
    namespace App\Http\Controllers;
    
    use App\Http\Requests\PasswordChangeRequest;
    use App\Models\Dealer;
    use App\Models\Order;
    use App\Models\PointHistory;
    use App\Models\Vehicle;
    use App\Models\VehicleColor;
    use App\Models\VehicleModel;
    use App\Models\Voucher;
    use App\Models\VoucherCode;
    use Illuminate\Http\Request;
    use Illuminate\Support\Facades\Auth;
    use Illuminate\Support\Facades\DB;
    use Illuminate\Support\Facades\Hash;
    use Illuminate\Support\Facades\View;
    use Illuminate\Validation\Rule;
    
    class DashboardController extends Controller
    {
        
        protected $customer;
        
        public function __construct()
        {
            $this->middleware(function ($request, $next) {
                $this->user     = Auth::user();
                $this->customer = $this->user->customer;
                if ($this->customer->membership()->exists()) {
                    $this->customer->load('membership');
                }
//            $customer->load('district', 'province');
                if ( ! $this->customer) {
                    $this->customer = [];
                }
                View::share(['customer' => $this->customer]);
                
                return $next($request);
            });
        }
        
        public function index()
        {
            $viewData = [];
            /** if vehicle_type at customer table has value is 3
             * At this time comparing with vehicle_types at vouchers table
             * to show both voucher types (2W, 4W)
             */
            $customerVehicleTypes = $this->customer->vehicle_type == 3 ? [1,2,3] : [$this->customer->vehicle_type];
            $latestVouchers = Voucher::whereIn('vehicle_types', $customerVehicleTypes)
                                          ->orderByDesc('created_at')
                                          ->whereIsActive(1)
                                          ->limit(5)
                                          ->get();
            $viewData['latestVouchers'] = $latestVouchers;
            
            $latestPointHistory = PointHistory::where('customer_id', $this->customer->id)
                                              ->limit(5)
                                              ->orderByDesc('created_at')
                                              ->get();
            if ( ! $latestPointHistory->isEmpty()) {
                $viewData['pointHistory'] = $latestPointHistory;
            }
            
            $vehicles = Vehicle::with('color', 'model')
                               ->where('customer_id', $this->customer->id)
                               ->get();
            if ($vehicles) {
                $viewData['vehicles'] = $vehicles;
            }
            
            return view('dashboard.index', $viewData);
        }
        
        public function info(Request $request)
        {
            $provinces = $this->customer->province->getAllForSelection();
            $districts = $this->customer->district->allInProvince->keyBy('id')->pluck('name', 'id')->toArray();
            
            if ($request->method() == 'POST') {
                $validated = $request->validate([
                    'address'     => 'required',
                    'district_id' => 'required|numeric',
                ]);
                
                $this->customer->refresh();
                $this->customer->address     = $request->address;
                $this->customer->district_id = $request->district_id;
                if ($this->customer->saveQuietly()) {
                    $request->session()->flash('info_saved', __('dashboard.info_saved'));
                }
                
            }
            
            return view('dashboard.info', [
                'provinces' => $provinces,
                'districts' => $districts
            ]);
        }
        
        public function password(PasswordChangeRequest $request)
        {
            if ($request->method() === 'POST') {
                $validated      = $request->validated();
                $user           = Auth::getUser();
                $user->password = Hash::make($request->new_password);
                $user->saveQuietly();
                $request->session()->flash('password_changed', __('dashboard.password_changed'));
            }
            
            return view('dashboard.password');
        }
        
        public function vouchers()
        {
            $user     = Auth::getUser();
            $customer = $user->customer;
            
            $voucherCodes = VoucherCode::with('voucher')->where('customer_id',
                $customer->id)->orderByDesc('purchased_at')->paginate(5);
            
            return view('dashboard.vouchers', [
                'voucherCodes' => $voucherCodes
            ]);
        }
        
        public function history()
        {
            $user     = Auth::getUser();
            $customer = $user->customer;

//        $pointHistory = PointHistory::where('customer_id', $customer->id)->orderByDesc('created_at')->paginate(10);
//        $voucherCodes = VoucherCode::find($pointHistory->pluck('voucher_code_id'));
//        $vouchers = Voucher::find($voucherCodes->pluck('voucher_id'));
//        $voucherList = [];
//        foreach ($voucherCodes as $voucherCode) {
//            $voucherList[$voucherCode->id] = $vouchers->find($voucherCode->voucher_id);
//        }
            $pointHistory = PointHistory::where('point_histories.customer_id', $customer->id)
                                        ->leftJoin('voucher_codes', 'voucher_codes.id', '=', 'voucher_code_id')
                                        ->leftJoin('vouchers', 'voucher_codes.voucher_id', '=', 'vouchers.id')
                                        ->select(DB::raw('point_histories.*, vouchers.id as voucher_id, vouchers.name as voucher_name'))
                                        ->orderByDesc('point_histories.created_at')
                                        ->paginate(10);
            
            return view('dashboard.history', [
                'pointHistory' => $pointHistory,
            ]);
        }
        
        public function voucherCode(Request $request)
        {
            $voucherCode = VoucherCode::where(['code' => $request->id])->firstOrFail();
            $voucherCode->load('voucher')->load('dealer');
            
            return view('dashboard.voucher_code', [
                'voucherCode' => $voucherCode
            ]);
        }
        
        public function vehicles(Request $request)
        {
            $customer = Auth::getUser()->customer;
            if ($customer->vehicles->isNotEmpty()) {
                foreach ($customer->vehicles as $vehicle) {
                    $vehicle->load(['model', 'color']);
                }
            }
            
            return view('dashboard.vehicles', [
                'vehicles' => $customer->vehicles
            ]);
        }
        
        public function addVehicle(Request $request)
        {
//            $colors = VehicleColor::query()->whereName('Khác')->get();
//            VehicleColor::query()->whereName('Khác')->delete();
//            dd($colors);
//            $getIdModels = VehicleModel::with('colors')->take(12)->get();
//            dd($getIdModels->pluck('name'));
//            foreach($getIdModels as $vehicle){
//                $color = [
//                  'name' => 'Khác',
//                  'code' => 'OTHER',
//                  'vehicle_model_id' => $vehicle->id,
//                ];
//                $vehicle->colors()->create($color);
//            }
            if ($request->isMethod('get')) {
                $types   = VehicleModel::all([
                    '2w4w',
                    'slug',
                    'id',
                    'prefix_code_frame',
                    'name AS text',
                ])->groupBy('2w4w');
                $models  = VehicleModel::all([
                    'id',
                    'name AS text',
                    'slug',
                    'prefix_code_frame',
                    '2w4w',
                ])->groupBy('slug');
                $colors  = VehicleColor::all([
                    'id',
                    'name AS text',
                    'vehicle_model_id'
                ])->groupBy('vehicle_model_id');
                $dealers = Dealer::orderBy(
                    'name', 'asc'
                )->get();
                
                return view('dashboard.vechicles-add', [
                    'types'   => $types,
                    'models'  => $models,
                    'colors'  => $colors,
                    'dealers' => $dealers
                ]);
            }
            if ($request->isMethod('post')) {
                $validated = $request->validate([
                    'model'        => [
                        'required',
                        Rule::in(array_keys(config('constants.vehicle_model.slug')))
                    ],
                    'variant'      => 'required|exists:vehicle_models,id',
                    'color'        => 'required|exists:vehicle_colors,id',
                    'year'         => 'required|integer|numeric|max:' . now()->year,
                    'plate_number' => 'nullable|regex:/\d[11-99]-?\D\w?-\d{4,5}/|unique:App\Models\Vehicle',
                    'frame_number' => 'unique:App\Models\Vehicle',
                    'dealer'       => 'required|exists:dealers,id',
                    'confirmation' => 'accepted',
                    'purchased_at' => 'required|before:today'
                ]);
                $vehicle   = new Vehicle;
                
                $getSlug = VehicleModel::where([
                    'slug' => $request->model,
                ])->first();
                
                if ( ! $getSlug) {
                    return back()
                        ->withInput()
                        ->withErrors(['Dòng xe không hợp lệ']);
                }
                
                $myString = $getSlug->prefix_code_frame;
                $contains = \Str::contains($request->frame_number, $myString);
                
                if ($contains == false) {
                    return back()
                        ->withInput()
                        ->withErrors(['Số khung không hợp lệ vui lòng nhập đúng theo chỉ dẫn!']);
                }
                $vehicle->frame_number = $request->frame_number;
                
                if ($request->plate_number) {
                    $vehicle->plate_number = $request->plate_number;
                }
                $vehicle->customer_id      = $this->customer->id;
                $vehicle->vehicle_color_id = $request->color;
                $vehicle->dealer_id        = $request->dealer;
                $vehicle->purchased_at     = $request->purchase_at;
                $vehicle->save();
                if ($vehicle->customer->vehicle_type == 0 || $vehicle->customer->vehicle_type == $request->type) {
                    //$type = $request->type;
                    $type = [
                        'vehicle_type' => $request->type,
                    ];
                } else {
                    //$type = 3;
                    $type = [
                        'vehicle_type' => 3,
                    ];
                }
                $vehicle->customer->update($type);
                
                return redirect(route('dashboard-vehicles'))->with('addSuccesfully',
                    'Bạn đã thêm xe mới thành công. Hãy thực hiện dịch vụ lần đầu tại Đại lý để kích hoạt Membership cho xe này.');

//            if ($vehicle->save()) {
//                $typeVehicle = DB::table('vehicles')->where('customer_id', $vehicle->customer_id)->get();
//
//                $data = DB::table('customers')
//                    ->where('vehicle_type');
//                if (isEmpty($typeVehicle)){
//                    $data['vehicle_type'] = $request->type;
//                }
//                else{
//                    dd('ok');
//                }
//                $typeVehicle->update($data);
//
//                return redirect(route('dashboard-vehicles'))->with('addSuccesfully',
//                    'Bạn đã thêm xe mới thành công. Hãy thực hiện dịch vụ lần đầu tại Đại lý để kích hoạt Membership cho xe này.');
//            } else {
//                return redirect()->back()->with('errors', 'Lỗi không xác định. Vui lòng thử lại sau.');
//            }
            }
        }
        
        public
        function serviceHistory(
            Request $request
        ) {
            $customer = Auth::getUser()->customer;
            $orders   = Order::where('customer_id', $customer->id)->orderByDesc('ordered_at')->paginate(10);
            if ($orders->isNotEmpty()) {
                $orders->load('dealer', 'vehicle');
            }
            
            return view('dashboard.services', [
                'orders' => $orders
            ]);
        }
        
        public
        function serviceHistoryDetail(
            Request $request
        ) {
            $orderId = $request->id;
            $order   = Order::where([
                'customer_id' => $this->customer->id,
                'id'          => $orderId
            ])->firstOrFail();
//        dd($order);
            $order->load('dealer', 'items', 'vehicle');
            
            $orderValue = $order->original_value;
            
            if ($order->voucher_code_id) {
                $order->load('voucher', 'voucherCode');
                $discountType   = $order->voucher->discount_type;
                $discountNumber = $order->voucher->discount_amount;
                if ($discountType == config('constants.voucher.discount_type_percent')) {
                    $valueAfterDiscount = round($orderValue - ($discountNumber / 100 * $orderValue));
                } elseif ($discountType == config('constants.voucher.discount_type_fixed')) {
                    $valueAfterDiscount = round($orderValue - $discountNumber);
                } else {
                    $valueAfterDiscount = $orderValue;
                }
            } else {
                $discountNumber     = 0;
                $valueAfterDiscount = $orderValue;
            }
            
            $tax   = $valueAfterDiscount * 0.1;
            $total = $valueAfterDiscount + $tax;
            
            return view('dashboard.service-detail', [
                'order'    => $order,
                'customer' => $this->customer
            ])->with(compact('orderValue', 'valueAfterDiscount', 'tax', 'total', 'discountNumber'));
            
        }
    }
