<?php

session_start();

// get correct login link for navigation menu
if(isset($_SESSION['user'])) {
    $loggedInUser = $_SESSION['user'];
    $loginUrl = SERVER_PATH.'profile/'.$loggedInUser;
    $loginLabel = "Logged in as ".$loggedInUser;
} else {
    $loginUrl = SERVER_PATH.'login';
    $loginLabel = "Log in";
}


// return session errors, if any

$errorMessage = '';
if(isset($_SESSION['error'])) {
    $errorMessage = $_SESSION['error'];
    unset($_SESSION['error']);
}
