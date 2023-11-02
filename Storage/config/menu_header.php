<?php
// Header menu
return [

    'items' => [
        [],
        [
            'title'   => 'Trang chủ',
            'root'    => true,
            'page'    => '/',
            'new-tab' => false,
        ],
        [
            'title'  => 'Vouchers',
            'root'   => true,
            'toggle' => 'click',
            'page'   => 'vouchers'
        ],
        [
            'title'  => 'Thông tin chương trình',
            'root'   => true,
            'toggle' => 'click',
            'page'   => 'about',
        ],
        [
            'title'  => 'Liên hệ',
            'root'   => true,
            'toggle' => 'click',
        ],
        [
            'title'  => 'Việt Nam Suzuki',
            'root'   => true,
            'toggle' => 'click',
        ]
    ]

];
