<?php

$app->get('/', 'HomeController:index')->setName('home');
$app->get('/person/{id}', 'PersonController:show')->setName('person');