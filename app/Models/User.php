<?php

namespace Social\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public function getFullName()
    {
        return $this->first_name . ' ' . $this->surname;
    }

    public function directFriends()
    {
        return $this->belongsToMany(User::class, 'friends_users', 'user_id', 'friend_id');
    }
}
