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
    $user->set('role_id', 1);

    $user->save(); // save the object to the database

    //$_SESSION['success'] = "Account successfully registered!";

    $_SESSION['user'] = $username;

    $_SESSION['id'] = $user->get('id');
    $_SESSION['firstName'] = $user->get('firstName');
    $_SESSION['lastName'] = $user->get('lastName');
    $_SESSION['description'] = $user->get('description');
    $_SESSION['password'] = $user->get('password');
    $_SESSION['image'] = $user->get('image');
    $_SESSION['gender'] = $user->get('gender');
    $_SESSION['topic_id'] = $user->get('topic_id');
    $_SESSION['topic_id1'] = $user->get('topic_id1');

    // role_id = 1 -> registered
    // role_id = 2 -> moderator
    // role_id = 3 -> admin
    $_SESSION['role_id'] = $user->get('role_id');

    header('Location: '.SERVER_PATH);

    exit();
} else {
    $_SESSION['error'] = "Email address already registered. Please enter another email address.";
    header('Location: '.SERVER_PATH.'register');
    exit();
}
