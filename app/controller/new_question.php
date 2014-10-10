<?php
require_once '../global.php';

require_once '../model/question.class.php';
require_once '../model/topic.class.php';

$pageName = 'New Question';

require_once '../view/header.tpl';

//require_once '../view/new_question.tpl';

require_once '../view/footer.tpl';

class QuestionController {
     
    private $contactsService = NULL;
     
    public function __construct() {
        $this->contactsService = new Question();
        $this->contactsService2 = new Topic();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
        
        $op = isset($_GET['op'])?$_GET['op']:NULL;
        try {
            if ( !$op || $op == 'list' ) {
                $this->saveQuestion();
                
            }  elseif ( $op == 'new'   ) {
                //$this->saveQuestion();
            } elseif ( $op == 'delete' ) {
                //$this->deleteTopic();
            } elseif ( $op == 'show' ) {
                //$this->showTopic();
            } else {
                $this->showError("Page not found", "Page for operation ".$op." was not found!");
            }
        } catch ( Exception $e ) {
            // some unknown Exception got through here, use application error page to display it
            $this->showError("Application error", $e->getMessage());
        }
        

			
    }
     
 	/*public function listTopics() {
        $orderby = isset($_GET['orderby'])?$_GET['orderby']:"date";
        $topics = $this->contactsService->getAllTopics($orderby);
        include '../view/new_topic.tpl';
    }
    */
    
    public function saveQuestion() {
        

        $title = 'Add new Question';
        
        $text = '';
        //!!!!
        $user1 = '4';
		$user2 = '';
		$topic1 = '';
		$topic2 = '';
		
        $errors = array();
        
        if ( isset($_POST['form-submitted']) ) {
            
            $text = isset($_POST["q-text"]) ?   $_POST["q-text"]  :NULL;
            $user2 = isset($_POST["q-user2"])?   $_POST["q-user2"] :NULL;
            $topic1 = isset($_POST["q-topic1"]) ?   $_POST["q-topic1"]  :NULL;
            $topic2 = isset($_POST["q-topic2"])?   $_POST["q-topic2"] :NULL;
            
            try {
                $this->contactsService->createNewQuestion($text, $user1,$user2,$topic1,$topic2);
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
        }
        
        $topics = $this->contactsService2->getAllTopics("name");
        require_once '../view/new_question.tpl';
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
    
     public function showTopic() {
        $id = isset($_GET['id'])?$_GET['id']:NULL;
        if ( !$id ) {
            throw new Exception('Internal error.');
        }
        
        if ( isset($_POST['form-edit']) ){

        	$id = isset($_POST["editTopicID"]) ?   $_POST["editTopicID"]  :NULL;
            $name = isset($_POST["editTopicName"]) ?   $_POST["editTopicName"]  :NULL;
        	$desc = isset($_POST["editTopicDesc"])?   $_POST["editTopicDesc"] :NULL;
         
        	try {
                $this->contactsService->editTopic($id,$name, $desc);
                $this->listTopics();
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
            
        }
        $topic = $this->contactsService->getTopic($id);
        
        include '../controller/view_topic.php';
        
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