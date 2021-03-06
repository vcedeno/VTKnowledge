<!--Shows all the answers to an specific question and allows you to create a new answer--!>
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
  
  <input type="hidden" id="sesid" value="<?php print ($_SESSION['id']); ?>">
<input type="hidden" id="rid" value="<?php print ($_SESSION['role_id']); ?>">
<input type="hidden" id="ui" value="<?php print htmlentities($question->user_id); ?>">

<div class="container">
<h1><?php print htmlentities($question->text); ?>
<?php if($_SESSION['id']==htmlentities($question->user_id)||$_SESSION['role_id']=="2"||$_SESSION['role_id']=="3"){ ?>
<!--<a href="#" data-target="#updatingQuestion" data-toggle="modal" class="btn btn-primary" data-idq="<?php print htmlentities($question->id); ?>" data-q="<?php print htmlentities($question->text); ?>">Edit</a>-->
<?php } ?>
</h1>



	</script>
           
		<div>
        	<label class="label label-info">Posted:</label>
        	<label><?php print date("M j, g:i a",strtotime($question->date)); ?></label>
        </div>
        <div>
            <label class="label label-info">By User:</label>
        	<a href="<?php echo SERVER_PATH ?>profile/<?php foreach ($userList as $user){ if(htmlentities($question->user_id)==$user->get('id')) print $user->get('user'); } ?>"><?php foreach ($userList as $user){ if(htmlentities($question->user_id)==$user->get('id')) print $user->get('user'); }?></a>
        </div>
		<div>
           	<label class="label label-info">To User:</label>
        	<a href="<?php echo SERVER_PATH ?>profile/<?php foreach ($userList as $user){ if(htmlentities($question->user_id1)==$user->get('id')) print $user->get('user'); } ?>"><?php foreach ($userList as $user){ if(htmlentities($question->user_id1)==$user->get('id')) print $user->get('user'); }?></a>
    	</div>
    	<div>
            <label class="label label-info">Related Topics:</label>
            <label class="bg-success"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id)) print htmlentities($topic->name); } ?></label>
            <label class="bg-warning"><?php foreach ($topics as $topic){if (htmlentities($topic->id)==htmlentities($question->topic_id1)) print htmlentities($topic->name); } ?></label>
        </div>
    <p><br></p>
    <p><br></p>
    
    <hr />
    <h1>Answers</h1>
<?php foreach ($answers as $answer): ?>
<hr />
		<form method="POST" action=""> 
		<?php if(htmlentities($answer->show)=="1"){ ?>
        	<label class="label label-info">Answer:</label>
        	<label><?php print htmlentities($answer->text); ?></label>
        	
        	<input type="hidden" name="qid" id="qid" value="<?php print htmlentities($question->id); ?>">
        	<input type="hidden" name="aid" id="aid" value="<?php print htmlentities($answer->id); ?>">
        	<?php if($_SESSION['id']==htmlentities($question->user_id)||$_SESSION['id']==htmlentities($answer->user_id) ||$_SESSION['role_id']=="2"||$_SESSION['role_id']=="3"){ ?>
        	
			<input name="form-ea" type="submit" class="btn-primary btn-mini" value="Edit" />
			<?php if(htmlentities($answer->old_text)!=NULL&& $_SESSION['id']==htmlentities($answer->user_update)){ ?>
			<input name="form-ue" type="submit" value="Undo Edit" />
			<?php } ?>
			<?php } ?>
        	
        	<?php if($_SESSION['id']==htmlentities($question->user_id)||$_SESSION['id']==htmlentities($answer->user_id) ||$_SESSION['role_id']=="2"||$_SESSION['role_id']=="3"){ ?>
			<input name="form-da" type="submit" class="btn-danger btn-mini" value="Delete" />

			<?php } ?>
		
		</form>	
			
        	
               
	<div>
        <div>
        	<label class="label label-info">By User:</label>
        	<a href="<?php echo SERVER_PATH ?>profile/<?php foreach ($userList as $user){ if(htmlentities($answer->user_id)==$user->get('id')) print $user->get('user'); } ?>"><?php foreach ($userList as $user){ if(htmlentities($answer->user_id)==$user->get('id')) print $user->get('user'); }?></a>
        </div>
        <div>
        	<label class="label label-info">On:</label>
        	<label><?php print date("M j, g:i a",strtotime($answer->date)); ?></label>
        </div>
        
	</div>
	<?php } ?>	
	<form method="POST" action=""> 
			<input type="hidden" name="qid" id="qid" value="<?php print htmlentities($question->id); ?>">
        	<input type="hidden" name="aid" id="aid" value="<?php print htmlentities($answer->id); ?>">
        	<?php if(htmlentities($answer->show)=="0" && $_SESSION['id']==htmlentities($answer->user_delete)){ ?>
			<input name="form-ud" type="submit" value="Undo Delete" />
			
			<?php } ?>
	</form>	
<p><br></p>


<?php endforeach; ?>
<hr />

<p><br></p>
<form method="POST" action="">  
<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-12">
						<input type="hidden" name="qqid" id="qqid" value="<?php print htmlentities($question->id); ?>">
						<label form="answer-text" class="control-label">Your answer:</label>
					</div> 
					<div class="col-sm-10">
					<textarea class="form-answer" name="answer-text" rows=5 cols="100"></textarea>
            
					</div> 
				</div> 
</div>

	<div class="row">
		<div class="col-sm-10 text-center">	
			<a href="<?php echo SERVER_PATH ?>allquestions" class="btn btn-primary">Cancel</a>
			<input name="form-submitted" type="submit" class="btn btn-primary" value="Post" />
		</div>
	</div>
</form> 
</div> 

	<div class="modal fade" id="updatingQuestion" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
					<form method="POST" action=""> 
					<div class="modal-header">
						<h4>Update Question</h4>
					</div> 
					<div class="modal-body">
						<div class="form-group">
							<input type="text" name="qid" id="qid" />
							<input type="text" class="form-control" name="q" id="q">
				
						</div> 
					</div> 
					
						<div class="modal-footer" >
							<div class="col-sm-10 text-center">	
							<a class="btn btn-primary" data-dismiss="modal">Cancel</a>
							<input name="form-q" type="submit" class="btn btn-danger" value="Update" />
							
							</div>
						</div>
					</form> 

					
			</div> 
		</div> 
	</div> 

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?php echo SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?php echo SERVER_PATH ?>public/js/script.js"></script>
  </body>
</html>