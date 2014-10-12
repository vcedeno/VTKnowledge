<?php
require_once '../global.php';

$pageName = 'Home';

if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

	//require_once '../view/home.tpl';

	require_once '../view/footer.tpl';


	class HomeController {
     
    private $contactsService = NULL;
    private $contactsService2 = NULL;
     
    public function __construct() {
        $this->contactsService = new Question();
        $this->contactsService2 = new Topic();
        $this->contactsService3 = new Answer();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
 
                $questions=$this->contactsService->getAllQuestions("date");
                $userList = User::loadUsers();
        		$topics = $this->contactsService2->getAllTopics("name");
        		
				require_once '../view/home.tpl';
	}
	}
}
else
{
	require_once '../view/login.tpl';
}
     
$controller3 = new HomeController();
 
$controller3->handleRequest();

?>