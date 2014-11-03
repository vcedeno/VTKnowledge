<!--Shows all the answers to an specific question and allows you to create a new answer--!>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge</title>

    <!-- Bootstrap -->
    <link href="../../public/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../public/css/custom.css" rel="stylesheet">
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
<h1><?php print htmlentities($question->text); ?></h1>
		<div>
        	<label class="label label-info">Posted:</label>
        	<label><?php $question->date; print htmlentities($question->date); ?></label>
        </div>
        <div>
            <label class="label label-info">By User:</label>
        	<label><?php foreach ($userList as $user){ if(htmlentities($question->user_id)==$user->get('id')) print $user->get('user'); }?></label>
        </div>
		<div>
           	<label class="label label-info">To User:</label>
        	<label><?php foreach ($userList as $user){ if(htmlentities($question->user_id1)==$user->get('id')) print $user->get('user'); }?></label>
    	</div>
    	<div>
            <label class="label label-info">Related Topics:</label>
            <label class="bg-success"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id)) print htmlentities($topic->name); } ?></label>
            <label class="bg-warning"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id1)) print htmlentities($topic->name); } ?></label>
        </div>
    <p><br></p>
    <p><br></p>
    
    <h1>Answers</h1>
<form method="POST" action="">  
<?php foreach ($answers as $answer): ?>
	<div class="row">
		<div>
        	<label class="label label-info">Answer:</label>
        	<label><?php print htmlentities($answer->text); ?></label>
        </div>
        <div>
        	<label class="label label-info">By User:</label>
        	<label><?php foreach ($userList as $user){ if(htmlentities($answer->user_id)==$user->get('id')) print $user->get('user'); }?></label>
        </div>
        <div>
        	<label class="label label-info">On:</label>
        	<label><?php print htmlentities($answer->date); ?></label>
        </div>
	</div>
<p><br></p>
<?php endforeach; ?>
</div> 

<p><br></p>

<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-12">
						<label form="answer-text" class="control-label">Your answer:</label>
					</div> 
					<div class="col-sm-10">
					<textarea class="form-answer" name="answer-text" rows=5 cols="100"></textarea>
            
					</div> 
				</div> 
</div>

	<div class="row">
		<div class="col-sm-10 text-center">	
			<a href="<?= SERVER_PATH ?>" class="btn btn-primary">Cancel</a>
			<input name="form-submitted" type="submit" class="btn btn-primary" value="Post" />
		</div>
	</div>
</form> 
</div> 


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../public/js/bootstrap.min.js"></script>
    <script src="../../public/js/script.js"></script>
  </body>
</html>