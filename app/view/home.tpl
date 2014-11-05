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

<h1 class="text-center">Questions</h1>
	<div class="row">
	<div class="col-sm-1">
	</div>
		<div class="col-sm-9">
		<?php foreach ($questions as $question): ?>
			<p>
			<a href="<?= SERVER_PATH ?>question?op=show&id=<?php print $question->id; ?>"><h2 class="text-primary"><?php print htmlentities($question->text); ?></h2></a>
			
			<a href="<?= SERVER_PATH ?>question?op=show&id=<?php print $question->id; ?>" class="btn btn-danger">View Question</a>
			
			</p>
			<div>
            	<label class="label label-info">Posted:</label>
            	<label><?php $question->date; print htmlentities($question->date); ?></label>
        	
        		
            	<label class="label label-info">By User:</label>
            	<label><?php foreach ($userList as $user){ if(htmlentities($question->user_id)==$user->get('id')) print $user->get('user'); }?></label>
        		
        		<?php if(htmlentities($question->user_id1)!=NULL){?>
            	<label class="label label-info">To User:</label>
            	<label><?php foreach ($userList as $user){ if(htmlentities($question->user_id1)==$user->get('id')) print $user->get('user'); }?></label>
        		<?php }?>
        		
            	<label class="label label-info">Related Topics:</label>
            	<label class="bg-success"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id)) print htmlentities($topic->name); } ?></label>
            	<label class="bg-warning"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id1)) print htmlentities($topic->name); } ?></label>
        	</div>
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