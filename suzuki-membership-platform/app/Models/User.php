<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Auth;
use Spatie\Permission\Traits\HasRoles;


class User extends Authenticatable
{
    use CrudTrait;
    use HasFactory, Notifiable;
    use HasRoles;
    use CanResetPassword;

//    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'mobile',
        'creator',
        'dealer_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function customer()
    {
        return $this->hasOne('App\Models\Customer');
    }

    public function dealer()
    {
        return $this->belongsTo('App\Models\Dealer');
    }

    protected static function booted()
    {
        static::creating(function ($user) {
            if (Auth::id()) {
                $user->creator = Auth::id();
            }
        });
    }

    public function isCustomer()
    {
        if ($this->hasRole('Customer')) {
            return true;
        }
        return false;
    }

    public function isAdmin()
    {
        return $this->hasRole('Admin');
    }

    public function isBackendUser()
    {
        if ($this->hasAnyRole(['Admin', 'Dealer', 'Staff'])) {
            return true;
        }
        return false;
    }

    public function isDealer()
    {
        $roles = $this->getRoleNames();
        if ($roles->count() == 1 && $roles[0] == 'Dealer') {
            return true;
        }
        return false;
    }

}
