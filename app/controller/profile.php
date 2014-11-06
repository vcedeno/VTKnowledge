<?php
require_once '../global.php';

$pageName = 'Profile';

$username = $_GET['u'];
//$username = 'mauri90@vt.edu';

//$username .= "@vt.edu";
$user = User::loadByUsername($username);

//$user = User::loadById($username);

$events = Event::loadByUserId($user->get('id'));

require_once '../view/header.tpl';
require_once '../view/profile.tpl';
require_once '../view/footer.tpl';