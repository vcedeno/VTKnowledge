<!--View the details of a topic and modify it--!>
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
  <form method="POST" action="">    
	<div class="row">
						<h4>Edit Topic</h4>

						<div>
            				<span for="editTopicID" class="label label-info">ID:</span>
            				<label for="editTopicID"><?php print $topic->id; ?></label><br>
            				<input type="hidden" name="editTopicID" value="<?php print $topic->id; ?>" />
        				</div>
       				 	<div>
            				<span for="editTopicName" class="label label-info">Name:</span>
            				<input type="text" name="editTopicName" value="<?php print $topic->name; ?>"><br>
        				</div>
        				<div>
            				<span for = "editTopicDesc" class="label label-info">Description:</span>
            				<textarea class="form-control" name="editTopicDesc" rows=4><?php print $topic->description; ?>
            				</textarea><br>
					
        				</div>

	</div>
	<div class="col-lg-12" style="text-align:center">  
	
	<a href="<?= SERVER_PATH ?>topic" class="btn btn-primary">Cancel</a>
	<!--<a href="<?= SERVER_PATH ?>new/topic?op=edit&id=<?php print $topic->id; ?>" class="btn btn-primary">Submit</a>--!>
	<input name="form-edit" type="submit" class="btn btn-primary" value="Submit" />
	</div> 
	</form>                
	</div> 

	<?php if (isset($_POST['form-edit'])&&empty($_POST["editTopicName"])) { ?>
  	<div class="alert alert-danger" role="alert">You can't leave the name of the topic empty...</div>
	<?php } ?>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?= SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?= SERVER_PATH ?>public/js/script.js"></script>

  </body>
</html>