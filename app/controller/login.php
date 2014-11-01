<!-- Login page -->
<?php
require_once '../global.php';

session_destroy(); // log us out

$pageName = 'Log in';

require_once '../view/login.tpl';
