<?php

require_once '../global.php';

if(!isset($_SESSION['user'])) {
    $_SESSION['error'] = 'You must log in to post a message.';
    header('Location: '.SERVER_PATH.'/login');
    exit();
} elseif(trim($_POST['message']) == '') {
    $_SESSION['error'] = "You can't post an empty message.";
    header('Location: '.SERVER_PATH); 
    exit();
}

$message = $_POST['message'];
$username = $_SESSION['user'];
$user = AppUser::loadByUsername($username);

// instantiate new Message object
$msg = new Message();
$msg->set('content', $message);
$msg->set('creator_id', $user->get('id'));
$msg->save(); // save the object to the database

// redirect us
header('Location: '.SERVER_PATH);
exit();