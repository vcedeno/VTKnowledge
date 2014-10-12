<?php
require_once '../global.php';

//require_once '../model/question.class.php';
//require_once '../model/topic.class.php';

$pageName = 'New Question';

require_once '../view/header.tpl';

//require_once '../view/new_question.tpl';

require_once '../view/footer.tpl';



class QuestionController {
     
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
        
        $op = isset($_GET['op'])?$_GET['op']:NULL;
        try {
            if ( !$op  ) {
                $this->saveQuestion();
                
            } elseif ( $op == 'delete' ) {
                //$this->deleteTopic();
            } elseif ( $op == 'show' ) {
                $this->showQuestion();
            } else {
                $this->showError("Page not found", "Page for operation ".$op." was not found!");
            }
        } catch ( Exception $e ) {
            // some unknown Exception got through here, use application error page to display it
            $this->showError("Application error", $e->getMessage());
        }
        

			
    }
     
 	public function listQuestions() {
        $orderby = isset($_GET['orderby'])?$_GET['orderby']:"date";
        $questions = $this->contactsService->getAllQuestions($orderby);
        //include '../view/new_topic.tpl';
    }
    
    
    public function saveQuestion() {
        

        $title = 'Add new Question';
        
        $text = '';
        //!!!!
        $user1 = '';
		$user2 = '';
		$topic1 = '';
		$topic2 = '';
		
        $errors = array();
        
        if ( isset($_POST['form-submitted']) && isset($_SESSION['user'])) {
            
            $text = isset($_POST["q-text"]) ?   $_POST["q-text"]  :NULL;
            $user1 = isset($_SESSION['id']) ?   $_SESSION['id']  :NULL;
            $user2 = isset($_POST["q-user2"])?   $_POST["q-user2"] :NULL;
            $topic1 = isset($_POST["q-topic1"]) ?   $_POST["q-topic1"]  :NULL;
            $topic2 = isset($_POST["q-topic2"])?   $_POST["q-topic2"] :NULL;
            
            try {
                $this->contactsService->createNewQuestion($text, $user1,$user2,$topic1,$topic2);
                require_once '../controller/home.php';
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
        }
        $userList = User::loadUsers();
        $topics = $this->contactsService2->getAllTopics("name");
        require_once '../view/new_question.tpl';
    }
    
    public function showQuestion() {
        $id = isset($_GET['id'])?$_GET['id']:NULL;
        if ( !$id ) {
            throw new Exception('Internal error.');
        }
        
        if ( isset($_POST['form-submitted']) ){

        	$text = isset($_POST["answer-text"]) ?   $_POST["answer-text"]  :NULL;
            //$user = isset($_SESSION['id']) ?   isset($_SESSION['id']) :NULL;
        	$question = $id;
			$user =$_SESSION['id'];
        	try {
                $this->contactsService3->createNewAnswer($text,$user, $question);
                include '../controller/home.php';
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
            
        }
        $answers = $this->contactsService3->getAllAnswers($id);
        $question=$this->contactsService->getQuestion("$id");
        $userList = User::loadUsers();
        $topics = $this->contactsService2->getAllTopics("name");
        
        include '../view/answer.tpl';
        
    }
     /*
    public function deleteTopic() {
        $id = isset($_GET['id'])?$_GET['id']:NULL;
        if ( !$id ) {
            throw new Exception('Internal error.');
        }
        $this->contactsService->deleteTopic($id);

        $this->listTopics();
    }
    
     
   
       public function editTopic($id,$name,$desc) {
         
    		
            try {
                $this->contactsService->editTopic($id,$name, $desc);
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
        include '../view/new_topic.tpl';
    }
    
    public function showError($title, $message) {
        include '../view/error.tpl';
    }*/
     
}


$controller2 = new QuestionController();
 
$controller2->handleRequest();
?>