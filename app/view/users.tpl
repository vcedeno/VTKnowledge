<!-- List of Users page -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>VT Knowledge - Users</title>

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
        <table class="table table-striped">
          <thead>
            <tr>
              <th>ID</th>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Username</th>
              <th>Gender</th>
              <th>Role</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            <?php
                foreach ($userList as $user) { ?>
                    <tr>
                      <td><?php print $user->get('id');?></td>
                      <td><?php print $user->get('firstName');?></td>
                      <td><?php print $user->get('lastName');?></td>
                      <td><?php print $user->get('user');?></td>
                      <td><?php print $user->get('gender');?></td>
                      <td>
                        <?php
                        $userRole = Role::loadById($user->get('role_id')); ?>
                        <span class="label 
                            <?php 
                            if ($userRole->get('name') == "registered") {
                                print "label-default";
                            } else if ($userRole->get('name') == "moderator") {
                                print "label-primary";
                            } else if ($userRole->get('name') == "admin") {
                                print "label-success";
                            } 
                            ?>"
                        >
                        <?php print $userRole->get('name'); ?>
                        </span>                        
                      </td>
                      <td><a href="#changeUserRole_<?php print $user->get('id');?>" class="btn btn-info" data-toggle="modal">Change Role</a></td>
                    </tr>
                <?php } ?>
          </tbody>
        </table>
    </div>

    <?php
        foreach ($userList as $user) { ?>
        <div class="modal fade" id="changeUserRole_<?php print $user->get('id');?>" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form class="form-horizontal" role="form" method="POST" action="<?= SERVER_PATH ?>users/change_role/">
                        <div class="modal-header">
                            <h4>Change User Role</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="change_role" class="col-sm-8 control-label">Change current user role for <?php print $user->get('user');?>: </label>

                                <div class="col-sm-4">

                                    <select id="change_role" name="user_role" class="selectpicker show-tick form-control">

                                    <?php
                                    foreach ($roleList as $role) { 
                                        $role_id_curr = $role->get('id');
                                        $role_name_curr = $role->get('name');
                                    ?>
                                        <option value="<?php print $role_id_curr;?>" 
                                            <?php if($user->get('role_id') == $role_id_curr) {
                                                print("selected");
                                            }?>
                                        >
                                            <?php print $role_name_curr;?>
                                        </option>
                                    <?php } ?>    
                                        
                                    </select>
                                    <input type="hidden" name="user_id" value="<?php print $user->get('id');?>">

                                </div>


                            </div>
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-default" data-dismiss="modal">Cancel</a>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 
    <?php } ?>
      
    <!-- Core JavaScript-->
      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="<?= SERVER_PATH ?>public/js/script.js"></script>
  </body>
</html>