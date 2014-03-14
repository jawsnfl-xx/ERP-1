<?php

/**
 */
$routes = array(
    array(
        "pattern" => "login",
        "controller" => "users",
        "action" => "login"
    ),
    array(
        "pattern" => "index",
        "controller" => "users",
        "action" => "index"
    ),
    array(
        "pattern" => "logout",
        "controller" => "users",
        "action" => "logout"
    ),
    array(
        "pattern" => "signup",
        "controller" => "users",
        "action" => "signup"
    ),
    array(
        "pattern" => "home/index",
        "controller" => "home",
        "action" => "index"
    ),
    array(
        "pattern" => "settings",
        "controller" => "home",
        "action" => "settings"
    ),
    array(
        "pattern" => "quality_management",
        "controller" => "module",
        "action" => "quality_management"
    ),
    array(
        "pattern" => "product_technology",
        "controller" => "module",
        "action" => "product_technology"
    )
);

/**
 */
foreach ($routes as $route) {
    $router->addRoute(new Framework\Router\Route\Regex($route));
}
unset($routes);
