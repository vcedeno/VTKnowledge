<!--Home page -->
<?php
require_once '../global.php';

$pageName = 'Feed';

/*Verify if the user has a session to show login or homepage*/
if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

	require_once '../view/footer.tpl';


	class FeedController {
     
    private $contactsService = NULL;
    
    public function __construct() {
        $this->contactsService = new Answer();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
 
 				//load all the events
        		$events=$this->contactsService->allEvents($_SESSION['id']);
    
                //load all the users
                $userList = User::loadUsers();
                
				require_once '../view/feed.tpl';
	}
	}
	$controller4 = new FeedController();
 
	$controller4->handleRequest();
}
else
{
	require_once '../view/login.tpl';
}
     


?>