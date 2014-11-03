<?php
set_include_path(dirname(__FILE__));

require_once 'config.php';

require_once 'view/viewHelpers.php';

function __autoload($class_name) {
	require_once 'model/'.$class_name.'.class.php';
}