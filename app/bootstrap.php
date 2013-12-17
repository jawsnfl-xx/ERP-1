<?php

/**
 * Bootstrap
 * @version 0.2
 * @author Marcin Pyrka
 */

/**
 */
// $router = new Framework\Router();
// $router->addRoute(
// new Framework\Router\Route\Simple(
// array(
// "pattern" => ":name/profile",
// "controller" => "home",
// "action" => "index"
// )));
// $router = new Framework\Router(
// // array(
// // // "url" => "home/index",
// // "url" => isset($_GET["url"]) ? $_GET["url"] : "home/index",
// // "extension" => isset($_GET["url"]) ? $_GET["url"] : "html"
// // ));

// array(
// // "url" => "home/index",
// "url" => $_GET["url"],
// "extension" => $_GET["url"]
// ));

// var_dump($_GET);
// $router->addRoute = new Framework\Router(
// array(
// "url" => isset($_GET["url"]) ? $_GET["url"] : "home/index",
// "extension" => isset($_GET["url"]) ? $_GET["url"] : "html"
// ));
/**
 * Wywołanie Kontrolera dla Application\Controller
 */
$controller = new Application\Controller();

// var_dump($router);
// var_dump($controller);