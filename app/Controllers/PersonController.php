<?php

namespace Social\Controllers;

use Social\Models\User;
use Social\Service\Friendship;

class PersonController extends BaseController
{
    public function show($request, $response, $args)
    {
        $personId = (int) $args['id'];
        $person = User::find($personId);
        $service = new Friendship($person);

        $twoSteps = $service->friendsOfFriends();
        $suggested = $service->suggested();

        return $this->view->render(
            $response,
            'person.twig',
            compact('person', 'twoSteps', 'suggested')
        );
    }
}
