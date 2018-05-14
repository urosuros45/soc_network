<?php

namespace Social\Service;

use Social\Models\User;

class Friendship
{
    /**
     * @var User
     */
    protected $person;

    /**
     * @var integer
     */
    private $commonFriends = 2;

    /**
     * @param User $person
     */
    public function __construct(User $person)
    {
        $this->person = $person;
    }

    public function friendsOfFriends()
    {
        $data = [];

        if ($this->person->directFriends->count()) {
            $modelKeys = $this->person->directFriends->modelKeys();
            $friends = User::whereIn('id', $modelKeys)
                ->getModels();

            foreach ($friends as $friend) {
                $data[$friend->id] = $friend->directFriends;
            }
        }

        return $data;
    }

    /**
     * @param  User $person
     * @return array
     */
    public function suggested()
    {
        $suggested = [];

        if ($this->person->directFriends->count() >= $this->commonFriends) {
            $modelKeys = $this->person->directFriends->modelKeys();
            $notFriends = User::where('id', '!=', $this->person->id);
            $notFriends->whereNotIn('id', $modelKeys);

            foreach ($notFriends->getModels() as $notFriend) {
                $friendKeys = $notFriend->directFriends->modelKeys();

                if (count($friendKeys) >= $this->commonFriends &&
                    count(array_intersect($modelKeys, $friendKeys)) >= $this->commonFriends
                ) {
                    $suggested[] = $notFriend;
                }
            }
        }

        return $suggested;
    }
}