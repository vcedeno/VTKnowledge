<?php

require_once '../global.php';

// GET variables
$username = $_GET['u'];

// POST variables
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];

// get user object
$user = AppUser::loadByUsername($username);
if($user == null) {
    $_SESSION['error'] = "This user doesn't exist.";
    header('Location: '.SERVER_PATH);
}

// first name
if($user->get('first_name') != $firstName) {
    $oldFirstName = $user->get('first_name'); // save the old name
    $user->set('first_name', $firstName); // change the name
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_first_name');
    $e->set('event_type_id',$et);
    $e->set('user_1_id', $user->get('id'));
    $e->set('data_1', $oldFirstName);
    $e->set('data_2', $firstName);
    $e->save();
}
    
// last name
if($user->get('last_name') != $lastName) {
    $oldLastName = $user->get('last_name'); // save the old name
    $user->set('last_name', $lastName); // change the name
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_last_name');
    $e->set('event_type_id',$et);
    $e->set('user_1_id', $user->get('id'));
    $e->set('data_1', $oldLastName);
    $e->set('data_2', $lastName);
    $e->save();
}

$user->save(); // save any changes to the user


// redirect
header('Location: '.SERVER_PATH.'/profile/'.$username);
