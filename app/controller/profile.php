<?php
require_once '../global.php';

$pageName = 'Profile';


	class TController {

    private $contactsService = NULL;
     
    public function __construct() {

        $this->contactsService = new Topic();

    }
     
    public function handleRequest() {
 
        		$topics = $this->contactsService->getAllTopics("name");
        		
        		$username = $_GET['u'];
				//$username = 'mauri90@vt.edu';

				//$username .= "@vt.edu";
				$user = User::loadByUsername($username);

				//$user = User::loadById($username);


				// All events related to a particular user (with his id)
				$events = Event::loadByUserId($user->get('id'));
	
				// ALL events in event table
				$allEvents = Event::loadEvents();

        		require_once '../view/header.tpl';
				require_once '../view/profile.tpl';
				require_once '../view/footer.tpl';

	}
	}
	$controller4 = new TController();
 
	$controller4->handleRequest();
	




