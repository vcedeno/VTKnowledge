<!--Home page -->
<?php
require_once '../global.php';



/* Inclusion of libraries */
//session_start();

require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookSession.php');
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookRequest.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookResponse.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookSDKException.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookRequestException.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookRedirectLoginHelper.php');
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/FacebookAuthorizationException.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/GraphObject.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/GraphUser.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/GraphSessionInfo.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/Entities/AccessToken.php');
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/HttpClients/FacebookCurl.php' );
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/HttpClients/FacebookHttpable.php');
require_once( 'facebook-php-sdk-v4-4.0-dev/src/Facebook/HttpClients/FacebookCurlHttpClient.php');

/* Using namespaces */
use Facebook\FacebookSession;
use Facebook\FacebookRedirectLoginHelper;
use Facebook\FacebookRequest;
use Facebook\FacebookResponse;
use Facebook\FacebookSDKException;
use Facebook\FacebookRequestException;
use Facebook\FacebookAuthorizationException;
use Facebook\GraphObject;
use Facebook\GraphUser;
use Facebook\GraphSessionInfo;
use Facebook\FacebookHttpable;
use Facebook\FacebookCurlHttpClient;
use Facebook\FacebookCurl;

/* Main process */

// Use app id, secret and redirect url
$app_id = '1374976189463583';
$app_secret = '3b4b491041382443d0b0ca88a371c0e9';
$redirect_url = 'http://localhost/VTKnowledge/registerWithFB';

// $app_id = '404749033037149';
// $app_secret = '4f1e08f6bd2373d488c7b67710b3d503';
// $redirect_url = 'http://www.vtknowledge.com/registerWithFB';

// Initialize application, create helper object, and get fb session
FacebookSession::setDefaultApplication($app_id, $app_secret);
$helper = new FacebookRedirectLoginHelper($redirect_url);
$sess = $helper->getSessionFromRedirect();













$pageName = 'Feed';

/*Verify if the user has a session to show login or homepage*/
if(isset($_SESSION['user'])) {
	require_once '../view/header.tpl';

	require_once '../view/footer.tpl';


	class FeedController {
     
    private $contactsService = NULL;
    private $contactsService1 = NULL;
    
    public function __construct() {
        $this->contactsService = new Answer();
        $this->contactsService1 = new Topic();
    }
     
    public function redirect($location) {
        //header('Location: '.$location);
    }
     
    public function handleRequest() {
 
 				//load all the events
        		$events=$this->contactsService->allEvents($_SESSION['id']);
    			
    			//load all the topics
        		$topics = $this->contactsService1->getAllTopics("name");
    
    
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