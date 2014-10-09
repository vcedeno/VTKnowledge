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
  <form name="topicview" id="topicview" method="POST" action="<?= SERVER_PATH ?>view/topic">    
	<div class="row">
						<h4>Topic Details</h4>

       				 	<div>
            				<span for="prueba" class="label label-info">Name:</span>
            				<?php print $topic->name; ?>
        				</div>
        				<div>
            				<span class="label label-info">Description:</span>
            				<?php print $topic->description; ?>
        				</div>
        				<div>
            				<span class="label label-info">Date created:</span>
           			 		<?php print $topic->date; ?>
        				</div>
	</div>
	</form>
	<a href="<?= SERVER_PATH ?>new/topic" class="btn btn-primary">Close</a>
	</div> 

	
  <!--<div class="container">
  <form name="topicform" id="topicform" method="POST" action="<?= SERVER_PATH ?>new/topic">    
	<div class="row">
		<div class="col-sm-12">
			<p><h3>New Topic</h3></p>
			<div class="form-group">
				<label form="topic-name" class="col-sm-2 control-label">Topic:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="topic-name" id="topic-name" placeholder="Name of the topic...">
				</div> 
			
			</div>
		</div>	
	</div>	
	<p><br></p>
	<div class="row">
		<div class="col-sm-12">
			<div class="form-group">
				<label form="topic-desc" class="col-sm-2 control-label">Description:</label>
				<div class="col-sm-6">
					<textarea class="form-control" name="topic-desc" rows=4 id="topic-desc"></textarea>
				</div> 
			</div> 
		</div>
	</div>
	<p><br></p>
	<div class="row">
		<div class="col-sm-10 text-center">	
			<div class="form-actions">
			
			<a class="btn btn-primary" id="cancelTopic" href="<?= SERVER_PATH ?>">Cancel</a>
			<button type="submit" name="save" value="topic" class="btn btn-primary">Create</button>
			</div>
		</div>
	</div>
	</form>
</div> -->


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<?= SERVER_PATH ?>public/js/bootstrap.min.js"></script>
    <script src="<?= SERVER_PATH ?>public/js/script.js"></script>

  </body>
</html>