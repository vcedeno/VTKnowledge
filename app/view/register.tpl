<!-- Registration page -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge - Create Account</title>

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
      
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-4 well well-sm col-centered">
                <h1 class="text-center">VT Knowledge</h1>
                <legend class="text-center">Sign Up</legend>
                <p class="errorMessage">
                    <?php
                    if($errorMessage != '') {
                        print($errorMessage); 
                    }
                    ?>
                </p>  
                <form action="<?= SERVER_PATH ?>register/process" method="post" class="form" role="form">
                    
                    <div class="row">
                        <div class="col-xs-6 col-md-6">
                            <input class="form-control" name="firstName" placeholder="First Name" type="text"
                                required autofocus />
                        </div>

                        <div class="col-xs-6 col-md-6">
                            <input class="form-control" name="lastName" placeholder="Last Name" type="text" required />
                        </div>
                    </div>

                    <input class="form-control" name="username" placeholder="Your VT Email Address (yourpid@vt.edu)" type="email" id="email" required/>
                    <input class="form-control" name="pass" placeholder="Password" type="password" id="pass" required/>
                    <p>Use at least one lower case letter, one upper case letter, one numeral, and eight characters</p>
                    <input class="form-control" name="reenterpass" placeholder="Confirm Password" type="password" id="reenterpass" required/>

                    <label class="radio-inline">
                        <input type="radio" name="gender" id="inlineCheckbox1" value="male" required/>
                        Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="inlineCheckbox2" value="female" required/>
                        Female
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="gender" id="inlineCheckbox3" value="other" required/>
                        Don't want to disclose
                    </label>
                    <br />
                    <br />
                    <button id="submit_button" class="btn btn-lg btn-primary btn-block" type="submit">Sign Up for VT Knowledge</button>
                </form>
                <br />
                <p>By clicking "Sign Up for VT Knowledge" you agree to our <a href="#">Terms of Service</a>.</p>
            </div>
        </div>
    </div> 
      
    <!-- Core JavaScript-->
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="<?= SERVER_PATH ?>public/js/script.js"></script>
  </body>
</html>