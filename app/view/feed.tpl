<!--Home Page shows all the posted questions order by date-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge</title>

    <!-- Bootstrap -->
    <link href="<?php echo SERVER_PATH ?>public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo SERVER_PATH ?>public/css/custom.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
  </head>
  <body>

<div class="container">


<h1 class="text-center">Frequently Used Words in Questions </h1>

<a href="<?php echo SERVER_PATH ?>app/controller/cloud.php" class="text-center" name="statsButton" id="statsButton"><img src="<?php echo SERVER_PATH ?>public/img/word.jpeg" height="200" width="500" alt="q&a" class="thumbnail col-centered"></a>
<h1 class="text-center">Home Feed</h1>
	<div class="row">
		<div class="col-sm-2">
		
		</div>
		<div class="col-sm-8">
		<?php foreach ($events as $event): ?>
			<div>
			<?php foreach ($userList as $user){ if(htmlentities($event->user_id1)==$user->get('id')) print $user->get('user'); }?>
			<a href="<?php echo SERVER_PATH ?>question?op=show&id=<?php print $event->data_1; ?>"><?php if(htmlentities($event->event_type_id)==4) print "Posted a question to: "; 
			if(htmlentities($event->event_type_id)==5) print "Answered a question from: ";?>
			</a>
			<?php if(htmlentities($event->user_id2)!=NULL &&htmlentities($event->event_type_id)==5)
			{foreach ($userList as $user){ if(htmlentities($event->user_id2)==$user->get('id')) print $user->get('user').". "; }}?>
			
			<?php if(htmlentities($event->event_type_id)==1) print "Changed first name from: ".htmlentities($event->data_1)." to ".htmlentities($event->data_2).". ";?> 
			
			<?php if(htmlentities($event->event_type_id)==2) print "Changed last name from: ".htmlentities($event->data_1)." to ".htmlentities($event->data_2).". ";?> 
			
			<?php if(htmlentities($event->event_type_id)==3) 
			{print "Changed interest in topic from : ";
			foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($event->data_1)) 
			print htmlentities($topic->name); }
			print " to "; 
			foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($event->data_2)) 
			print htmlentities($topic->name); } 
			print".";}?> 
			
		
			<?php if(htmlentities($event->user_id2)!=NULL&&htmlentities($event->event_type_id)==4)
			{foreach ($userList as $user){ if(htmlentities($event->user_id2)==$user->get('id')) print $user->get('user').". "; }}?>
			<?php if(htmlentities($event->user_id2)==NULL&&htmlentities($event->event_type_id)==4)
			 print ("everyone. ");?>
			
			<?php print date("M j, g:i a",strtotime($event->when_happened));?>
			</div>
			<p></p>
			</br>
			
			</br>
		<?php endforeach; ?>
		</div>
		<div class="col-sm-2">
		</div>
		
	</div>
	</br>



</div> 


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?php echo SERVER_PATH ?>public/js/script.js"></script>
    

  </body>
</html>