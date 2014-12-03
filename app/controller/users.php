<!-- List of Users page -->
<?php
require_once '../global.php';

$pageName = 'Users';

// choose template depending on whether admin or not
if(isset($_SESSION['user'])) {

	require_once '../view/header.tpl';
	$userList = User::loadUsers();
	$roleList = Role::loadRoles();

	// If role_id is 3 (i.e., admin), display the 'users' template. Otherwise, redirect to 'home'
    if($_SESSION['role_id'] == 3) {
		require_once '../view/users.tpl';
	} else {
		//require_once '../view/home.tpl';
		header('Location: '.SERVER_PATH);
	}

	require_once '../view/footer.tpl';
} else {
    require_once '../view/login.tpl';
}

