<!--Home page -->
<?php
require_once '../global.php';

$pageName = 'User Statistics';

/*Verify if the user has a session to show login or homepage*/
if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

	require_once '../view/footer.tpl';


	class StatsController {
     
    private $contactsService = NULL;
     
    public function __construct() {
        $this->contactsService = new Stats();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
    
	
    

		$posts = array();
 		for ($x = 6; $x >= 0; $x--) {
  
  			 $day='P'.(string)$x.'D';
             $stats=$this->contactsService->getPostedQ($_SESSION['id'],$x);    		
             foreach ($stats as $stat)
             {
             $posted_q=$stat->result; 
             } 
             $stats=$this->contactsService->getPostedA($_SESSION['id'],$x);    		
             foreach ($stats as $stat)
             {
             $posted_a=$stat->result; 
             } 
             $stats=$this->contactsService->getReceivedQ($_SESSION['id'],$x);    		
             foreach ($stats as $stat)
             {
             $received_q=$stat->result; 
             } 
             $stats=$this->contactsService->getReceivedA($_SESSION['id'],$x);    		
             foreach ($stats as $stat)
             {
             $received_a=$stat->result; 
             } 
             $date = new DateTime();
             
			 $date->sub(new DateInterval($day));
			 $dayofWeek= (string)($date->format('M j'));
			
			 $posts[] = array('day'=> (string)($dayofWeek),'posted_q'=> $posted_q, 'posted_a'=> $posted_a,'received_q'=> $received_q,'received_a'=> $received_a);
             
        }

			 $fp = fopen('stats.json', 'w');
			 fwrite($fp, json_encode($posts));
			 fclose($fp);
             
				require_once '../view/stats.tpl';
	}
	}
	$controller3 = new StatsController();
 
	$controller3->handleRequest();
}
else
{
	require_once '../view/login.tpl';
}
     


?>