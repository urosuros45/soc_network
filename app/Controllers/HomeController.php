<?php

namespace Social\Controllers;

use Social\Models\User;

class HomeController extends BaseController
{
    public function index($request, $response)
    {
        $users = User::all();

        return $this->view->render($response, 'home.twig', compact('users'));
    }
}
