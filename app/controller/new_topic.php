<?php
require_once '../global.php';

//include '../model/topic.class.php';
//require '../model/view.class.php';

require_once '../model/topic.class.php';

$pageName = 'New Topic';


require_once '../view/header.tpl';

require_once '../view/new_topic.tpl';

require_once '../view/footer.tpl';



if (!isset($_POST["save"]) || $_POST["save"] != "topic") {
	
    exit;
}

        $t = $_POST["topic-name"];
		$d = $_POST["topic-desc"];
    
    echo $t;
    echo $d;
 
class TopicController {
     
    private $contactsService = NULL;
     
    public function __construct() {
        $this->contactsService = new Topic();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
        
                $this->saveTopic();
          
    }
     

    public function saveTopic() {
        
        $title = 'Add new topic';
         
        $name = '';
        $desc = '';

        
        $errors = array();
       
        if ( isset($_POST['save'])){
             
            $name       = isset($_POST['topic-name']) ?   $_POST['topic-name']  :NULL;
            $desc       = isset($_POST['topic-desc'])?   $_POST['topic-desc'] :NULL;
       		
       	
             
            try {
                $this->contactsService->createNewTopic($name, $desc);
                $this->redirect('../view/home.php');
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
        }
         
        include '../view/new_topic.tpl';
    }
     
   
    public function showError($title, $message) {
        include '../view/error.tpl';
    }
     
}

$controller = new TopicController();
 
$controller->handleRequest();

?>