<?php

session_start();

require __DIR__ . '/../vendor/autoload.php';

$dbConfig = [
    'driver' => 'mysql',
    'host' => 'localhost',
    'database' => 'social',
    'username' => 'root',
    'password' => '',
    'charset' => 'utf8',
    'collation' => 'utf8_unicode_ci'
];

$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true,
        'db' => $dbConfig
    ]
]);

$container = $app->getContainer();

$capsule = new \Illuminate\Database\Capsule\Manager;
$capsule->addConnection($container['settings']['db']);
$capsule->setAsGlobal();
$capsule->bootEloquent();

$container['db'] = function ($container) use ($capsule) {
    return $capsule;
};

$container['view'] = function ($container) {
    $view = new \Slim\Views\Twig(
        __DIR__ . '/../resources/views',
        ['cache' => false]
    );

    $router = $container->get('router');
    $uri = \Slim\Http\Uri::createFromEnvironment(new \Slim\Http\Environment($_SERVER));
    $view->addExtension(new \Slim\Views\TwigExtension($router, $uri));

    return $view;
};

$container['HomeController'] = function ($container) {
    return new \Social\Controllers\HomeController($container);
};

$container['PersonController'] = function ($container) {
    return new \Social\Controllers\PersonController($container);
};

require __DIR__ . '/../app/routes.php';