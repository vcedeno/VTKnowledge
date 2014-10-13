<?php

require_once '../global.php';

$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$username = $_POST['username'];
$password = $_POST['pass'];
$gender = $_POST['gender'];

$existingUser = User::loadByUsername($username);

// if username exists already, user can't register
if($existingUser == null) {
    
    // instantiate new User object
    $user = new User();
    $user->set('firstName', $firstName);
    $user->set('lastName', $lastName);
    $user->set('user', $username);
    $user->set('password', $password);
    $user->set('gender', $gender);

    $user->save(); // save the object to the database

    header('Location: '.SERVER_PATH);
    exit();
} else {
    $_SESSION['error'] = "Email address already registered. Please enter another email address.";
    header('Location: '.SERVER_PATH.'register');
    exit();
}
