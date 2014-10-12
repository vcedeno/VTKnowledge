<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge - Log In</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link href="<?= SERVER_PATH ?>public/css/custom.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
      
     
      <!-- Body of page: Columns of text with Thumbnails -->
      <div class="container">
            
            <div class="row">
                
                <div class="col-md-6 text-center ">
                    <h1>VT Knowledge</h1>
                    <p>Everything you need to know and want to know about Virginia Tech. 
                    </p>
                    <a href="<?= SERVER_PATH ?>register" class="btn btn-primary">Sign Up with a VT email address</a>
                </div>
                
                <div class="col-md-6 well well-sm">
                    <p class="errorMessage">
                        <?php
                        if($errorMessage != '') {
                            print($errorMessage); 
                        }
                        ?>
                    </p>  
                    <form name="form01" method="POST" action="<?= SERVER_PATH ?>login/process" class="form" role="form">

                        <input class="form-control" name="username" placeholder="Your VT Email Address" type="email" required/>
                        <input class="form-control" name="pass" placeholder="Password" type="password" required/>
                       
                        <button class="btn  btn-primary" type="submit" name="submit" value="Log i">Log In</button>
                        <a href="#">Forgot Password?</a>
                    </form>         
                                     
                </div>
 
            </div>
          
            <div class="row text-center">
                <h2>Why you will love VT Knowledge</h2>
                <p>VT Knowledge lets you interact with the VT community to learn about all things VT!</p><br />
            </div>
          
            <div class="row text-center">
                <div class="col-md-6 ">

                    <img src="<?= SERVER_PATH ?>public/img/Q&A4.jpg" alt="q&a" class="thumbnail col-centered">

                    <h3>Ask Questions and get Answers</h3>
                    <p>To and from real VT students and faculty members. 
                    </p>
                    
                </div>
                <div class="col-md-6">
                   <img src="<?= SERVER_PATH ?>public/img/topics.jpeg" alt="topics" class="thumbnail col-centered">

                    <h3>Get updates on a variety of Topics</h3>
                    <p>Follow topics that interest you, such as classes, dining, VT traditions, housing, and more! You can also follow other users. 
                    </p>
                    
                </div>
            </div>
          
            <div class="row text-center">
                <div class="col-md-6">
                    <img src="<?= SERVER_PATH ?>public/img/improve.jpeg" alt="improve" class="thumbnail col-centered">
                    <h3>Improve existing content</h3>
                    <p>Provide your own answers, upvote/downvote questions and answers to promote interesting items, and you can even request another user to answer an existing question. 
                    </p>
                    
                </div>
                <div class="col-md-6">
                    <img src="<?= SERVER_PATH ?>public/img/validation.jpeg" alt="validation" class="thumbnail col-centered">
                    <h3>Add validation your profile</h3>
                    <p>Add Topics to your profile biography in order to add validation to the content you are writing. You can even create your own Topics! 
                    </p>
                    
                </div>
                
            </div>
            <br />
          
            <div class="row text-center">
                    <a href="<?= SERVER_PATH ?>register" class="btn btn-primary">Sign Up with a VT email address</a>
           </div>
          
      </div>
      
      
    <!-- Core JavaScript-->
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </body>
</html>