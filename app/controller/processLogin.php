<?php

require_once '../global.php';

$username = $_POST['username'];
$password = $_POST['pass']; 

// get user with this username from database
$user = User::loadByUsername($username);

// if user exists, username is valid
if($user == null) {
    $_SESSION['error'] = "Invalid username or password.";
    header('Location: '.SERVER_PATH.'login');
    exit();
} else {
    // does inputted password match password in db?
    if($user->get('password') != $password) {
        $_SESSION['error'] = "Invalid username or password.";
        header('Location: '.SERVER_PATH.'login'); 
        exit();
    } else {
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
    }
}