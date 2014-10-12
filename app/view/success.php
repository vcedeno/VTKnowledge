<?php
require_once '../global.php';

	print "success! <br><br>";
	$userList = User::loadUsers();

     // Showing error
    if(isset($_SESSION['user'])) {
        print("Current logged in user: ".$_SESSION['user'].", with ID: ".$_SESSION['id']."<br><br>"); 
    }

    if ($userList != null) {
		foreach ($userList as $user) {
			print 'ID '. $user->get('id') . '  |  ';
			print 'First Name: '. $user->get('firstName') . '  |  ';
			print 'Last Name: '. $user->get('lastName') . '  |  ';
			print 'Description: '. $user->get('description') . '  |  ';
			print 'Username: '. $user->get('user') . '  |  ';
			print 'Password: '. $user->get('password') . '  |  ';
			print 'Image: '. $user->get('image') . '  |  ';
			print 'Gender: '. $user->get('gender') . '  |  ';
			print 'Topic 1: '. $user->get('topic_id') . '  |  ';
			print 'Topic 2: '. $user->get('topic_id') . ' <br><br> ';
		}
	} else {
		print "But empty list! <br>";
	}
?>