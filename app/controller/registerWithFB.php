<!-- Register Page -->
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

$pageName = 'Register';

// If fb session exists, echo user's name 
if(isset($sess)) {
	//create request object, execute, and capture response
	$request = new FacebookRequest($sess, 'GET', '/me');

	// from response get graph object
	$response = $request->execute();
	$graph = $response->getGraphObject(GraphUser::className());
	//$graph2 = $response->getGraphObject();

	// use graph object methods to get user details
	$firstNameFB = $graph->getFirstName();
	$_SESSION['firstNameFB'] = $firstNameFB;

	$lastNameFB = $graph->getlastName();
	$_SESSION['lastNameFB'] = $lastNameFB;

	$emailFB =$graph->getProperty('email');
	$_SESSION['emailFB'] = $emailFB;

	$genderFB =$graph->getProperty('gender');
	$_SESSION['genderFB'] = $genderFB;



} else {
	// else echo login
	echo 'Error';
}






require_once '../view/register.tpl';