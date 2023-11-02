<?php
	/*
	 * This file is a part of Suzuki Membership Platform which is privately-owned by Vietnam Suzuki Corporation and for internal use only.
	 * @package Suzuki Membership Platform
	 * @copyright 2020. Vietnam Suzuki Corporation (VISUCO)
	 * @author Nguyen Tran Duy Phuong <phuongntd@vietnamsuzuki.com.vn>
	 * @link https://suzuki.com.vn
	 */
	
	return [
		'customer'           => [
			'init_balance'  => 5000,
			'mobile_regex'  => '/0(?:8|9|3|7|5)\d{8}/',
			'vehicle_type'  => [
				'none' => 0,
				'2w'   => 1,
				'4w'   => 2,
				'2w4w' => 3
			],
			'type'          => [
				'individual' => 0,
				'corporate'  => 1
			],
			'gender'        => [
				'male'   => 1,
				'female' => 2
			],
			'register_type' => [
				1 => 'Doanh Nghiệp',
				0 => 'Cá nhân',
			
			]
		],
		'voucher_code'       => [
			'status_new'      => 1, // Voucher code is bought but hasn't been redeemed
			'status_used'     => 2, // Voucher code is fully redeemed at a point of sales
			'status_expired'  => 3, // Voucher code expired after last day of vailidity
			'status_imported' => 4, // Voucher code is imported from external vendor and hasn't been bought.
			'status_disabled' => 5, // Voucher code is disabled and can neither be bought nor used.
		],
		'point'              => [
			'exchange_rate' => 100000, // 1 point = 100,000 VND,
			'milestones'    => [ 30, 45 ]
		],
		'order'              => [
			'type_earn_point'  => 1, // Order in which customer earns points from payment
			'type_spend_point' => 2, // Order in which customer spends points to get discount
		],
		'point_history_type' => [
			'buy_voucher'     => 1, // Customer buys voucher
			'first_topup'     => 2, // Add to balance when first create account
			'earn_from_order' => 3, // Convert from billing amount to point
		],
		'voucher'            => [
			'storage_path'          => 'storage/app/public/vouchers',
			'type_internal'         => 1, // Voucher is issued by VISUCO
			'type_external'         => 2, // Voucher is issued by an external vendor
			'apply_all'             => 1, // Voucher can be applied at all authorized dealers
			'apply_dealer'          => 2, // Voucher can only be applied at dealer at which customers buy it
			'apply_external'        => 3, // Voucher can only be applied at external vendor,
			'discount_type_none'    => 0,
			'discount_type_percent' => 1,
			'discount_type_fixed'   => 2,
			'default_code_length'   => 10,
		],
		'limit_mode'         => [
			'lifetime'  => 1,
			'monthly'   => 2,
			'quarterly' => 3,
			'yearly'    => 4,
		],
		
		
		'vehicle_model' => [
			'storage_path'  => 'storage/app/public/vehicle_model',
			'slug'          => [
				'satria'    => 'SATRIA',
				'burgman'   => 'BURGMAN',
				'gsf150'    => 'GSF150',
				'impulse'   => 'IMPULSE',
				'gsx-s1000' => 'GSX-S1000',
				'gsx-s150'  => 'GSX-S150',
				'gd110'     => 'GD110',
				'address'   => 'ADDRESS',
				'gsx-r150'  => 'GSX-R150',
				'v-strom'   => 'V-STROM',
				'raider'    => 'RAIDER',
				'ciaz'      => 'Ciaz',
				'xl7'       => 'XL7',
				'ertiga'    => 'Ertiga',
				'swift'     => 'Swift',
				'carry_pro' => 'Carry Pro',
				'carry'     => 'Carry Truck',
				'blind_van' => 'Blind Van',
				'celerio'   => 'Celerio',
				'vitara'    => 'Vitara',
			],
			'2w4w'          => [
				'4w' => 1,
				'2w' => 2,
			],
			'vehicle_types' => [
				1 => 'Xe 4 bánh',
				2 => 'Xe 2 bánh'
			]
		],
		'membership'    => [
			'none'                      => 0,
			'active'                    => 1,
			'expired'                   => 2,
			'discount'                  => [
				1 => 5,     // Level 1: Discount 5%
				2 => 7,     // Level 2: Discount 7%
				3 => 10,    // Level 3: Discount 10%
			],
			'minimum_order_to_maintain' => 2,
			'minimum_order_value'       => 500000,
			'annual_quota'              => 5000000,
		],
		'user'          => [
			'status_pending'  => 0, // Customer has just registered and is waiting for approval from VISUCO
			'status_approved' => 1, // Customer account is approved and can be used normally
			'status_denied'   => 2, // Customer account is not approved and need to provide correct information again
			'status_locked'   => 3, // Customer account is blocked from platform and cannot login.
		],
		'vendor'        => [
			'visuco_id' => 11
		],
		'dealer'        => [
			'direct_shop_id' => 8,
		],
		'adminRoutes'   => [
			'customers'     => 'customers',
			'vouchers'      => 'vouchers',
			'models'        => 'models',
			'colors'        => 'colors',
			'history'       => 'histories',
			'vehicles'      => 'vehicles',
			'dealers'       => 'dealers',
			'vendors'       => 'vendors',
			'districts'     => 'districts',
			'voucher_codes' => 'voucher-codes',
			'provinces'     => 'provinces',
			'users'         => 'users',
			'membership'    => 'memberships',
			'items'         => 'items',
			'orders'        => 'orders',
		]
	];

