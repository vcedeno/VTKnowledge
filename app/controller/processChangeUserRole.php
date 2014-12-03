<?php

require_once '../global.php';

$user_id = $_POST['user_id'];
$user_role = $_POST['user_role'];

// get user with this id from database
$user = User::loadById($user_id);

$user->set('role_id', $user_role);
$user->save(); // save the object to the database

header('Location: '.SERVER_PATH.'users');
exit();
