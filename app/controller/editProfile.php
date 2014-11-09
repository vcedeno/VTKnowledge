<?php

require_once '../global.php';

// GET variables
$username = $_GET['u'];


// POST variables
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$description = $_POST['description'];
$topic1 = $_POST['topic1'];
$topic2 = $_POST['topic2'];

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

// description
$user->set('description', $description); 

// topic 1
if($user->get('topic_id') != $topic1) {
	
	if($topic1=="NULL")
	{
		$topic1=NULL;
	}
    $oldTopic1 = $user->get('topic_id'); // save the old topic1
    $user->set('topic_id', $topic1); // change the topic
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_topic');
    $e->set('event_type_id',$et);
    $e->set('user_id1', $user->get('id'));
    $e->set('data_1', $oldTopic1);
    $e->set('data_2', $topic1);
    $e->save();
}

// topic 2
if($user->get('topic_id1') != $topic2) {
	if($topic2=="NULL")
	{
		$topic2=NULL;
	}
    $oldTopic2 = $user->get('topic_id1'); // save the old topic1
    $user->set('topic_id1', $topic2); // change the topic
    // log the event
    $e = new Event();
    $et = EventType::getIdFromName('edit_topic');
    $e->set('event_type_id',$et);
    $e->set('user_id1', $user->get('id'));
    $e->set('data_1', $oldTopic2);
    $e->set('data_2', $topic2);
    $e->save();
}
$user->save(); // save any changes to the user


// redirect
header('Location: '.SERVER_PATH.'/profile/'.$username);
