<?php
error_reporting ( 0 );
ini_set ( 'display_errors', 0 );

require_once ('libray/Smarty-3.1.14/libs/Smarty.class.php');
require_once ('controller.class.php');
require_once ('actionsbase.class.php');

$controller = new Controller ();
$controller->dispatch ();
