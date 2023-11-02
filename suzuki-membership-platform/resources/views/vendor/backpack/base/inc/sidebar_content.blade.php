<!-- This file is used to store sidebar items, starting with Backpack\Base 0.9.0 -->
<li class="nav-item font-weight-bold">
    <a class="nav-link" href="{{ backpack_url('dashboard') }}"><i class="la la-home nav-icon"></i> Dashboard</a></li>
<li class='nav-item nav-dropdown'>
    <a class='nav-link nav-dropdown-toggle' href='#'><i class='nav-icon la la-users'></i> Customers</a>
    <ul class="nav-dropdown-items">

        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.customers')) }}"><i class="nav-icon la la-angle-right"></i> Customer List</a>
        </li>
        @can('Create Customer')
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.customers') . '/create') }}"><i class="nav-icon la la-angle-right"></i> Add New Customer</a>
            </li>
        @endcan
    </ul>
</li>

@role('Admin')
<li class='nav-item nav-dropdown'>
    <a class='nav-link' href='{{ backpack_url(config('constants.adminRoutes.vehicles')) }}'><i class='nav-icon la la-car'></i> Vehicles</a>
    <ul class="nav-dropdown-items">
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.vehicles')) }}"><i class="nav-icon la la-angle-right"></i> Vehicle List</a>
        </li>
    </ul>
</li>@endrole

@role('Admin')
<li class='nav-item'>
    <a class='nav-link' href='{{ backpack_url('vouchers') }}'><i class='nav-icon la la-money-check'></i> Vouchers</a>
</li>
<li class='nav-item nav-dropdown'>
    <a class='nav-link nav-dropdown-toggle' href='#'><i class='nav-icon la la-barcode'></i> Voucher Codes</a>
    <ul class="nav-dropdown-items">
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.voucher_codes')) }}"><i class="nav-icon la la-angle-right"></i> All Codes</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.voucher_codes') . '/create') }}"><i class="nav-icon la la-angle-right"></i> Create New Code</a>
        </li>
    </ul>
</li>@endrole

@role('Admin')
<li class='nav-item'>
    <a class='nav-link' href='{{ backpack_url(config('constants.adminRoutes.membership')) }}'><i class='nav-icon la la-certificate'></i> Memberships</a>
</li>@endrole

<li class='nav-item nav-dropdown'>
    <a class='nav-link nav-dropdown-toggle' href='{{ backpack_url(config('constants.adminRoutes.orders')) }}'><i class='nav-icon la la-file-invoice-dollar'></i> Orders</a>
    <ul class="nav-dropdown-items">
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.orders')) }}"><i class="nav-icon la la-angle-right"></i> All Orders</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.orders') . '/create') }}"><i class="nav-icon la la-angle-right"></i> Add new Order</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.orders') . '/import') }}"><i class="nav-icon la la-angle-right"></i> Import Orders</a>
        </li>
    </ul>
</li>

@role('Admin')
<li class='nav-item'>
    <a class='nav-link' href='{{ backpack_url('point_histories') }}'><i class='nav-icon la la-history'></i> Point Histories</a>
</li>@endrole

@role('Admin')
<li class="nav-item">
    <hr style="background: #869AB8"/>
</li>
<li class='nav-item'>
    <a class='nav-link' href='{{ backpack_url('report') }}'><i class='nav-icon la la-signal'></i> Reports</a>
</li>@endrole

@if(Auth::getUser()->hasRole('Admin'))
    <li class="nav-item">
        <hr style="background: #869AB8"/>
    </li>
    <li class="nav-item nav-dropdown">
        <a class="nav-link nav-dropdown-toggle" href="#"><i class="nav-icon la la-users"></i> Privileges</a>
        <ul class="nav-dropdown-items">
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.users')) }}"><i class="nav-icon la la-user"></i>
                    <span>Users</span></a></li>
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url('role') }}"><i class="nav-icon la la-id-badge"></i>
                    <span>Roles</span></a></li>
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url('permission') }}"><i class="nav-icon la la-key"></i>
                    <span>Permissions</span></a></li>
        </ul>
    </li>
@endif

@if(Auth::getUser()->hasRole('Admin'))
    <li class='nav-item nav-dropdown'>
        <a class='nav-link nav-dropdown-toggle' href='#'><i class='nav-icon la la-gear'></i> System Settings</a>
        <ul class="nav-dropdown-items">
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url('vehicle_models') }}"><i class="nav-icon la la-car"></i> Vehicle Models</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ backpack_url(config('constants.adminRoutes.colors')) }}"><i class="nav-icon la la-palette"></i> Vehicle Colors</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' href='{{ backpack_url('provinces') }}'><i class='nav-icon la la-map'></i> Provinces</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' href='{{ backpack_url('districts') }}'><i class='nav-icon la la-map-marked-alt'></i> Districts</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' href='{{ backpack_url('dealers') }}'><i class='nav-icon la la-warehouse'></i> Dealers</a>
            </li>
            <li class='nav-item'>
                <a class='nav-link' href='{{ backpack_url(config('constants.adminRoutes.vendors')) }}'><i class='nav-icon la la-receipt'></i> Vendors</a>
            </li>
            {{--<li class='nav-item'>
                <a class='nav-link' href='{{ backpack_url(config('constants.adminRoutes.items')) }}'><i class='nav-icon la la-question'></i> Items</a>
            </li>--}}
        </ul>
    </li>
@endif