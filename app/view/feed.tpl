<!--Home Page shows all the posted questions order by date-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge</title>

    <!-- Bootstrap -->
    <link href="<?= SERVER_PATH ?>public/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?= SERVER_PATH ?>public/css/custom.css" rel="stylesheet">
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

<h1 class="text-center">Home Feed</h1>
	<div class="row">
		<div class="col-sm-2">
		</div>
		<div class="col-sm-8">
		<?php foreach ($events as $event): ?>
			<div>
			<?php foreach ($userList as $user){ if(htmlentities($event->user_id1)==$user->get('id')) print $user->get('user'); }?>
			<a href="<?= SERVER_PATH ?>question?op=show&id=<?php print $event->data_1; ?>"><?php if(htmlentities($event->event_type_id)==4) print "Posted a question to: "; 
			if(htmlentities($event->event_type_id)==5) print "Answered a question from: ";?>
			</a>
			<?php if(htmlentities($event->user_id2)!=NULL)
			{foreach ($userList as $user){ if(htmlentities($event->user_id2)==$user->get('id')) print $user->get('user'); }}
			else print ("everyone");?>
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
    <script src="<?= SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?= SERVER_PATH ?>public/js/script.js"></script>
    

  </body>
</html>