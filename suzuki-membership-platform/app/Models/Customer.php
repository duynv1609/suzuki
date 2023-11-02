<?php
    
    namespace App\Models;
    
    //use Illuminate\Database\Eloquent\Factories\HasFactory;
//use Illuminate\Database\Eloquent\Model;
    
    use Backpack\CRUD\app\Models\Traits\CrudTrait;
    use Carbon\Carbon;
    use Illuminate\Database\Eloquent\Collection;
    use Illuminate\Database\Eloquent\Model;
    use Illuminate\Database\Eloquent\SoftDeletes;
    use Illuminate\Support\Facades\DB;
    use Znck\Eloquent\Traits\BelongsToThrough;
    
    class Customer extends BaseModel
    {
        use CrudTrait;
        use BelongsToThrough;
        use SoftDeletes;
        
        protected $fillable = [
            'is_corporate',
            'vehicle_type',
            'name',
            'birthday',
            'gender',
            'mobile',
            'email',
            'district_id',
            'province_id',
            'address',
            'id_number',
            'id_issue_date',
            'id_issue_province',
            'dealer_id',
            'point_balance',
            'point_expires_at'
        ];
        
        protected $dates = [
            'id_issue_date',
            'point_expires_at'
        ];
        
        protected $identifiableAttribute = 'admin_display_name';
        
        public static function findByEmail($email)
        {
            // TODO: Cache users results with province and district
            return self::where('email', $email)->first();
        }
        
        protected static function booted()
        {
            static::created(function ($customer) {

//            $voucherCode = VoucherCode::firstOrCreate([
//                'customer_id' => $customer->id,
//                'type'        => config('constants.point_history_type.first_topup'),
//                'amount'      => config('constants.customer.init_balance')
//            ]);
            
            });
            
            static::updated(function ($customer) {
                $changes = $customer->getChanges();
                if ( ! empty($changes)) {
                    // Update login email or mobile at the same time
                    if ( ! empty($changes['email']) || ! empty($changes['mobile'])) {
                        $user = User::find($customer->user_id);
                        if ( ! empty($changes['email'])) {
                            $user->email = $changes['email'];
                        }
                        if ( ! empty($changes['mobile'])) {
                            $user->mobile = $changes['mobile'];
                        }
                        $user->save();
                    }
                }
            });
            
            static::deleted(function ($customer) {
                $user = User::firstWhere('email', $customer->email);
                $user->delete();
            });
            
        }
        
        public function district()
        {
            return $this->belongsTo('App\Models\District');
        }
        
        public function province()
        {
            return $this->belongsToThrough('App\Models\Province', 'App\Models\District');
        }
        
        public function province_of_id()
        {
            return $this->belongsTo('App\Models\Province', 'id_issue_province');
        }
        
        public function dealer()
        {
            return $this->belongsTo('App\Models\Dealer');
        }
        
        public function getFullAddressAttribute()
        {
            return $this->address . ', ' . $this->location()['district_name'] . ', ' . $this->location()['province_name'];
        }
        
        public function location()
        {
            $data = District::where('districts.id', $this->district_id)
                            ->join('provinces', 'provinces.id', '=', 'province_id')
                            ->select(DB::raw("districts.name AS district_name, provinces.name AS province_name"))->first();
            
            return [
                'district_name' => $data->district_name,
                'province_name' => $data->province_name,
            ];
        }
        
        public function voucherCodes()
        {
            return $this->hasMany('App\Models\VoucherCode');
        }
        
        public function user()
        {
            return $this->hasOne('App\Models\User');
        }
        
        public function vehicles()
        {
            return $this->hasMany('App\Models\Vehicle');
        }
        
        /*public function memberships()
        {
            return $this->hasManyThrough('App\Models\Membership', 'App\Models\Vehicle')->orderByDesc('ended_at');
        }*/
        
        public function vehicleModel()
        {
            return $this->hasManyThrough('App\Models\VehicleModel', 'App\Models\Vehicle');
        }

//    public function getMembershipAttribute()
//    {
//        $membership = $this->memberships->first();
//        return $membership;
//    }
        
        public function membership()
        {
            return $this->hasOne('App\Models\Membership');
        }
        
        public function orders()
        {
            return $this->hasMany('App\Models\Order');
        }
        
        public function getLoginUsernameAttribute()
        {
            return $this->mobile;
        }
        
        public function getAdminDisplayNameAttribute()
        {
            return $this->name . ' - ' . $this->mobile . ' - ' . $this->email;
        }
        
        public function getHasMembershipAttribute()
        {
            if ($this->membershipStatus() != config('constants.membership.none')) {
                return true;
            }
            
            return false;
        }
        
        public function membershipStatus()
        {
            if ( ! $this->membership) {
                return config('constants.membership.none');
            }
            // TODO: Check if expired membership condition is correct
            if ($this->membership->ended_at->lt(now())) {
                return config('constants.membership.expired');
            }
            
            return config('constants.membership.active');
        }
        
        /**
         * Check if customer can buy a voucher.
         *
         * @param  int|Model  $voucher  Voucher ID or an instance of Voucher model
         * @param  null|Collection  $voucherCodes  List of this voucher's codes bought by customer, used for counting
         *
         * @return boolean|array True or a list of error messages
         */
        public function canBuyVoucher($voucher, $voucherCodes = null)
        {
            if (is_numeric($voucher)) {
                $voucher = Voucher::findOrFail($voucher);
            }
            
            if ( ! $voucherCodes) {
                $voucherCodes = VoucherCode::where([
                    'customer_id' => $this->id,
                    'voucher_id'  => is_numeric($voucher) ? $voucher : $voucher->id
                ])->orderBy('purchased_at')->get();
            }
            
            if ($this->point_balance == 0) {
                $errorMessages[] = 'Bạn chưa có điểm nào.';
            } else {
                if ($this->point_balance < $voucher->price) {
                    $errorMessages[] = 'Không đủ điểm. Bạn đang có ' . number_format($this->point_balance, 0, ',',
                            '.') . ' điểm.';
                }
            }
            
            if ( ! empty($voucher->limit_mode) && intval($voucher->max_per_customer) > 0) {
                if ($voucher->limit_mode == config('constants.voucher.limit_mode.lifetime')) {
                    if ($voucherCodes->count() >= $voucher->max_per_customer) {
                        $errorMessages[] = 'Bạn đã hết lượt mua voucher này.';
                    }
                }
                
                if ($voucher->limit_mode == config('constants.voucher.limit_mode.day')) {
                    // Luot gioi han tinh theo ngay
                    if ($voucher->limit_times > 0) {
                        $voucherCodeBought = $voucherCodes->whereBetween('purchased_at',
                            [now()->subDays($voucher->limit_times)->startOfDay(), now()])->count();
                        $waitingDays       = $voucher->limit_times - (now()->diffInDays($voucherCodes->first()->purchased_at));
                        if ($voucherCodeBought >= $voucher->max_per_customer) {
                            $errorMessages[] = 'Bạn cần chờ thêm ' . $waitingDays . ' ngày nữa để mua lại.';
                        }
                    }
                } else {
                    switch ($voucher->limit_mode) {
                        case config('constants.voucher.limit_mode.monthly') :
                            $duration = [now()->startOfMonth(), now()->endOfMonth()];
                            $text     = 'tháng';
                            break;
                        case config('constants.voucher.limit_mode.quarterly') :
                            $duration = [now()->startOfQuarter(), now()->endOfQuarter()];
                            $text     = 'quý';
                            break;
                        case config('constants.voucher.limit_mode.yearly') :
                            $duration = [now()->startOfYear(), now()->endOfYear()];
                            $text     = 'năm';
                            break;
                    }
                    if (intval($voucher->max_per_customer) > 0 && $voucher->limit_mode !== config('constants.voucher.limit_mode.lifetime')) {
                        $boughtCount = $voucherCodes->whereBetween('purchased_at', $duration)->count();
                        if ($boughtCount >= $voucher->max_per_customer) {
                            $errorMessages[] = 'Bạn đã hết lượt mua voucher trong ' . $text . ' này.';
                        }
                    }
                }
                
                
            }
            
            
            if ($voucher->remain === 0) {
                $errorMessages[] = 'Voucher này đã hết.';
            }
            
            if ($this->membershipStatus() != config('constants.membership.active')) {
                $errorMessages[] = 'Gói Hội viên Suzuki chưa kích hoạt hoặc đã hết hạn.';
            }
            
            if ($voucher->buyable_next_month) {
                $milestone = $this->pointHistory()->where('sufficiency_reached', '>=', $voucher->price)->first();
                if ($milestone &&
                    $milestone->created_at->format('Y') === now()->format('Y') &&
                    $milestone->created_at->format('n') === now()->format('n')) { // Same month, same year
                    $errorMessages[] = 'Voucher này không thể mua trong tháng bạn vừa tích lũy đủ điểm.';
                }
            }
            
            if ( ! empty($errorMessages)) {
                return $errorMessages;
            } else {
                return true;
            }
        }
        
        public function pointHistory()
        {
            return $this->hasMany('App\Models\PointHistory')->orderByDesc('created_at');
        }
        
        public function updatePointBalance($pointHistory = null)
        {
            $this->point_balance = $this->pointHistory()->whereNull('deleted_at')->sum('amount');
            
            if ($pointHistory && $pointHistory->amount > 0) {
                $deadline               = $this->pointHistory()->where('amount', '>', 0)->max('created_at');
                $this->point_expires_at = Carbon::parse($deadline)->addMonths(6)->endofDay();
            }
            $this->save();
        }
        
        
    }
