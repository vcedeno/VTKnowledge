<!--Home page -->
<?php
require_once '../global.php';

$pageName = 'Word Cloud';

/*Verify if the user has a session to show login or homepage*/
if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

	require_once '../view/footer.tpl';


	class CloudController {
     
    private $contactsService = NULL;

    public function __construct() {
        $this->contactsService = new Question();

    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
 
 				//load all the words
             $words=$this->contactsService->getWords();
             $response = array();
			 $posts = array();
        		
             foreach ($words as $word)
             {
             	$wordS=$word->word; 
				$countS=(int)($word->count); 
				$posts[] = array('text'=> $wordS, 'size'=> $countS);
             }
             //$response['posts'] = $posts;

			 $fp = fopen('words.json', 'w');
			 fwrite($fp, json_encode($posts));
			 fclose($fp);
             
				require_once '../view/cloud.tpl';
	}
	}
	$controller3 = new CloudController();
 
	$controller3->handleRequest();
}
else
{
	require_once '../view/login.tpl';
}
     


?>