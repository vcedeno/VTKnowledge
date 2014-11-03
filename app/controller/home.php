<!--Home page -->
<?php
require_once '../global.php';

$pageName = 'Home';

/*Verify if the user has a session to show login or homepage*/
if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

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
 
 				//load all the questions
                $questions=$this->contactsService->getAllQuestions("date");
                //load all the users
                $userList = User::loadUsers();
                //load all the topics
        		$topics = $this->contactsService2->getAllTopics("name");
        		
				require_once '../view/home.tpl';
	}
	}
	$controller3 = new HomeController();
 
	$controller3->handleRequest();
}
else
{
	require_once '../view/login.tpl';
}
     


?>