<?php

require_once '../global.php';

// GET variables
$username = $_GET['u'];


// POST variables
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];

// get user object
$user = User::loadByUsername($username);
if($user == null) {
    $_SESSION['error'] = "This user doesn't exist.";
    header('Location: '.SERVER_PATH);
}

// first name
if($user->get('firstName') != $firstName) {
    $oldFirstName = $user->get('firstName'); // save the old name
    $user->set('firstName', $firstName); // change the name
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_first_name');
    $e->set('event_type_id',$et);
    $e->set('user_id1', $user->get('id'));
    $e->set('data_1', $oldFirstName);
    $e->set('data_2', $firstName);
    $e->save();
} 
    
// last name
if($user->get('lastName') != $lastName) {
    $oldLastName = $user->get('lastName'); // save the old name
    $user->set('lastName', $lastName); // change the name
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_last_name');
    $e->set('event_type_id',$et);
    $e->set('user_id1', $user->get('id'));
    $e->set('data_1', $oldLastName);
    $e->set('data_2', $lastName);
    $e->save();
}

$user->save(); // save any changes to the user


// redirect
header('Location: '.SERVER_PATH.'/profile/'.$username);
