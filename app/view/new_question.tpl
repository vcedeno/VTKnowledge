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
	<div class="row">
		<div class="col-sm-12">
			<p><h3>New Question</h3></p>
			<div class="form-group">
				<label form="topic-name" class="col-sm-2 control-label">Question:</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="question-text" placeholder="Input your question...">
				</div> 
			</div>
		</div>	
	</div>	
	<p><br></p>
	<div class="row">
		<div class="col-sm-12">
			<div class="form-group">
				<label form="topic-desc" class="col-sm-2 control-label">Topic: (Select up to three)</label>
				<div class="col-sm-6">
								<select class="selectpicker show-tick form-control" data-live-search="true">
  									<option value="topic1">No topic</option>
  									<option value="topic2">topic2</option>
  									<option value="topic3">topic3</option>
  									<option value="topic4">topic4</option>
								</select>
								<select class="form-control">
  									<option value="topic1">No topic</option>
  									<option value="topic2">topic2</option>
  									<option value="topic3">topic3</option>
  									<option value="topic4">topic4</option>
								</select>
								<select class="form-control">
  									<option value="topic1">No topic</option>
  									<option value="topic2">topic2</option>
  									<option value="topic3">topic3</option>
  									<option value="topic4">topic4</option>
								</select>
				</div> 
			</div> 
		</div>
	</div>
	<p><br></p>
	<div class="row">
		<div class="col-sm-10 text-center">	
			<a class="btn btn-primary" id="cancelQuestion">Cancel</a>
			<button type="submit" class="btn btn-primary" id="createQuestion">Post</button>
		</div>
	</div>
</div> 



    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../public/js/bootstrap.min.js"></script>
    <script src="../../public/js/script.js"></script>
  </body>
</html>