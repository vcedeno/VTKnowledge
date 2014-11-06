<?php

require_once '../global.php';

// GET variables
$username = $_GET['u'];


// POST variables
$new_password = $_POST['new_password'];


// get user object
$user = User::loadByUsername($username);
if($user == null) {
    $_SESSION['error'] = "This user doesn't exist.";
    header('Location: '.SERVER_PATH);
}

$user->set('password', $new_password); // change the pw
$user->save(); // save any changes to the user


// redirect
header('Location: '.SERVER_PATH.'/profile/'.$username);
