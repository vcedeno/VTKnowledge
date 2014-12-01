<!-- Login page -->
<?php
require_once '../global.php';

session_destroy(); // log us out

$pageName = 'Log in';




/* Inclusion of libraries */
session_start();

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

// Initialize application, create helper object, and get fb session
FacebookSession::setDefaultApplication($app_id, $app_secret);
$helper = new FacebookRedirectLoginHelper($redirect_url);
$sess = $helper->getSessionFromRedirect();













require_once '../view/login.tpl';