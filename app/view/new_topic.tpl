<!--Shows all the topics and allos to CRUD--!>
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
    
  <h1>Topic</h1>  
	<div class="row">
		<table class="table table-striped" border="0" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                	<th>Detailed View</th>
                    <th><a href="?orderby=id">ID<span class="glyphicon glyphicon-sort-by-attributes"></span></a></th>
                    <th><a href="?orderby=name">Name<span class="glyphicon glyphicon-sort-by-attributes"></span></a></th>
                    <th><a href="?orderby=description">Description<span class="glyphicon glyphicon-sort-by-attributes"></span></a></th>
                    <th><a href="?orderby=date">Date<span class="glyphicon glyphicon-sort-by-attributes"></span></a></th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($topics as $topic): ?>
                <tr>
                	<!--<td><a href="<?= SERVER_PATH ?>new/topic?op=show&id=<?php print $topic->id; ?>" class="btn btn-info">Details</a></td>-->
                	<td><a href="#detailsTopic" data-toggle="modal" class="btn btn-info" data-id="<?php print $topic->id; ?>" data-name="<?php print $topic->name; ?>" data-desc="<?php print $topic->description; ?>" data-date="<?php print $topic->date; ?>">Details</a></td>
                	<td><?php print htmlentities($topic->id); ?></td>
                    <td><?php print htmlentities($topic->name); ?></td>
                    <td><?php print htmlentities($topic->description); ?></td>
                    <td><?php print htmlentities($topic->date); ?></td>
                   
                    <td><a href="<?= SERVER_PATH ?>topic?op=show&id=<?php print $topic->id; ?>" class="btn btn-primary">Edit</a></td>
                    <td><a href="#deleteTopic" data-toggle="modal" class="btn btn-danger" data-id="<?php print $topic->id; ?>" data-name="<?php print $topic->name; ?>">Delete</a></td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
	</div>
	<form method="POST" action=""> 
	<div class="col-lg-12" style="text-align:center">  
	<!--<a href="<?= SERVER_PATH ?>topic?op=new" class="btn btn-primary">Add New Topic</a>!-->
	<input name="form-new" type="submit" class="btn btn-primary" value="Add New Topic" />
	</div>  
	</form> 
</div> 

		<div class="modal fade" id="deleteTopic" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				
					<form method="POST" action=""> 
					<div class="modal-header">
						<h4>Delete Topic</h4>
					</div> 
					<div class="modal-body">
						<div class="form-group">
							<label for="alertTopic" class="col-sm-12 control-label"></label>
							<input type="hidden" name="myid" id="myid" /></td>
							
						</div> 


					</div> 
					
						<div class="modal-footer" >
							<div class="col-sm-10 text-center">	
							<a class="btn btn-primary" data-dismiss="modal">Cancel</a>
							<input name="form-delete" type="submit" class="btn btn-danger" value="Delete" />
							
							</div>
						</div>
					</form> 

					
			</div> 
		</div> 
	</div> 
	
	<div class="modal fade" id="detailsTopic" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<form class="form-horizontal" role="form">
				
					<div class="modal-header">
						<h4>Topic Details</h4>
					</div> 
					<div class="modal-body">
						<div>
            				<label  class="label label-info">ID:</label>
            				<label for="detTopicID" ></label>
        				</div>
						<div>
            				<label class="label label-info">Name:</label>
            				<label for="detTopicName" ></label>
        				</div>
        				<div>
            				<label class="label label-info">Description:</label>
            				<label for="detTopicDesc"></label>
        				</div>
        				<div>
        					<label  class="label label-info">Date created:</label>
            				<label for="detTopicDate"></label>
           			 		
        				</div>

					</div> 
					<div class="modal-footer">
						<a class="btn btn-primary" data-dismiss="modal">Close</a>
					</div> 
					
				<form>
			</div> 
		</div>
		
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