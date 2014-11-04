<!--Topic Page-->
<?php
require_once '../global.php';

require_once '../model/topic.class.php';

$pageName = 'New Topic';

//we will allow a user to CRUD a topic only when he is log in
if(isset($_SESSION['user'])) {

require_once '../view/header.tpl';

require_once '../view/footer.tpl';


class TopicController {
     
    private $contactsService = NULL;
     
    public function __construct() {
        $this->contactsService = new Topic();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
        
        
        if ( isset($_POST['form-new'])&& !isset($_POST['form-submitted']) ) {
       
       		$this->saveTopic();
        	
        }
        elseif ( isset($_POST['form-delete']) ) {
        
       	 	$this->deleteTopic();
        }

        elseif ( isset($_POST['form-submitted']) ) {
        
       	 	$this->saveTopic();
        }
        else{
        
        $op = isset($_GET['op'])?$_GET['op']:NULL;
        try {
            //if ( !$op && !isset($_POST['form-submitted']) && !isset($_POST['form-delete'])  ) {
                //$this->listTopics();
            
            //} else
             if ( !$op)
             {
             $this->listTopics();
             }
             elseif( $op == 'show' ) {
                $this->showTopic();
            } else {
                $this->showError("Page not found", "Page for operation ".$op." was not found!");
            }
        } catch ( Exception $e ) {
            // some unknown Exception got through here, use application error page to display it
            $this->showError("Application error", $e->getMessage());
        }
        
       }

			
    }
     //Show all the topics
 	public function listTopics() {
        $orderby = isset($_GET['orderby'])?$_GET['orderby']:"date";
        $topics = $this->contactsService->getAllTopics($orderby);
        include '../view/new_topic.tpl';
    }
    
    //Creates a new topic
    public function saveTopic() {
        

        $title = 'Add new Topic';
        
        $name = '';
        $desc = '';

        $errors = array();
        
        if ( isset($_POST['form-submitted']) ) {
            
            $name = isset($_POST["topic-name"]) ?   $_POST["topic-name"]  :NULL;
            $desc = isset($_POST["topic-desc"])?   $_POST["topic-desc"] :NULL;
           
            try {
                $this->contactsService->createNewTopic($name, $desc);
                $this->listTopics();
                return;
            } catch (ValidationException $e) {
                $errors = $e->getErrors();
            }
            
       
        }
         
        include '../controller/topic_form.php';
    }
     //Deletes a topic
    public function deleteTopic() {
        
         $id = '';
        
        if ( isset($_POST['form-delete']) ) {
         $id = isset($_POST["myid"]) ?   $_POST["myid"]  :NULL;
         
        try {
        
        $this->contactsService->deleteTopic($id);
        $this->listTopics();
        return;
        } catch (ValidationException $e) {
                $errors = $e->getErrors();
        }
        }
    }
    //Show details an specific Topic
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
   //Edits a topic
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
    }
     
}


$controller = new TopicController();
 
$controller->handleRequest();

}
else
{
	include '../controller/home.php';
}

?>