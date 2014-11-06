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

// return success message, if any

// $successMessage = '';
// if(isset($_SESSION['success'])) {
//     $successMessage = $_SESSION['success'];
//     unset($_SESSION['success']);
// }

function renderEvent($event=null) {
    if($event == null)
        echo '';
    
    $eventTypeID = $event->get('event_type_id');
    switch($eventTypeID) {
        // first name
        case EventType::getIdFromName('edit_first_name'):
            $user = User::loadById($event->get('user_id1'));
            echo '<li>';
            echo 'Changed their first name from '.$event->get('data_1').' to '.$event->get('data_2').'. ';
            echo '<span class="byline">'.date("M j, g:i a", strtotime($event->get('when_happened'))).'</span>';
            echo '</li>';
            break;
        
        // last name
        case EventType::getIdFromName('edit_last_name'):
            $user = User::loadById($event->get('user_id1'));
            echo '<li>';
            echo 'Changed their last name from '.$event->get('data_1').' to '.$event->get('data_2').'. ';
            echo '<span class="byline">'.date("M j, g:i a", strtotime($event->get('when_happened'))).'</span>';
            echo '</li>';
            break;
    }
}
