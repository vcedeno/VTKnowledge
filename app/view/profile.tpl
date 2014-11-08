<script type="text/javascript">

$(document).ready(function(){
   
<?php if($_SESSION['user'] == $user->get('user')) { ?>
    $('#editProfilePanel').hide();
    $('#changePasswordPanel').hide();

    $('#editProfileButton').click(function(){
        $('#editProfilePanel').show();
        $('input[name="first_name"]').focus();
        $('#profileInfo').hide();
    });

    $('#changePasswordButton').click(function(){
        $('#changePasswordPanel').show();
        $('input[name="new_password"]').focus();
        $('#profileInfo').hide();
    });

    $('#cancelEditProfile').click(function(event){
        $('#editProfilePanel').hide();
        $('#profileInfo').show();
    });

    $('#cancelChangePassword').click(function(event){
        $('#changePasswordPanel').hide();
        $('#profileInfo').show();
    });

<?php } else {?>

    $('#editProfileButton').hide();
    $('#changePasswordButton').hide();

<?php } ?>
});

</script>  

<div class="container">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
        
            <div id="profileInfo">
                <h3><?php echo $user->get('firstName').' '.$user->get('lastName'); ?></h3>

                <p>Email: <a href="mailto:<?php echo $user->get('user'); ?>"><?php echo $user->get('user'); ?></a></p>

                <p>Description:</p>
                <p><?php echo $user->get('description'); ?></p>

                <p>Gender: <?php echo $user->get('gender'); ?></p>

				<p>Topics of interest: <label class="bg-success"><?php foreach ($topics as $topic){if ($topic->id==$user->get('topic_id')) print $topic->name; }?></label>
				<label class="bg-warning"><?php foreach ($topics as $topic){if ($topic->id==$user->get('topic_id1')) print ' '.$topic->name; } ?></label></p>
				
                <button class="btn btn-info" name="editProfileButton" id="editProfileButton">Edit profile</button>

                <button class="btn btn-primary" name="changePasswordButton" id="changePasswordButton">Change password</button>
            </div>
        </div>
        <div class="col-md-4">

        </div>
    </div>
</div>

<?php if($_SESSION['user'] == $user->get('user')) { ?>

<div class="container">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
        
            <div id="editProfilePanel">

                <form name="form01" method="POST" action="<?php echo SERVER_PATH ?>profile/<?php echo $_SESSION['user']; ?>/edit">    
                    <label>First name: <input class="form-control" type="text" name="first_name" value="<?php echo $user->get('firstName'); ?>" required/></label>

                    <label>Last name: <input class="form-control" type="text" name="last_name" value="<?php echo $user->get('lastName'); ?>" required/></label>
                    
                    			<select name="topic1" class="selectpicker show-tick form-control" data-live-search="true">
  									
  									<option value="NULL">No topic</option>
  									<?php foreach ($topics as $topic): ?>
  									<option value="<?php echo htmlentities($topic->id); ?>" <?php if($user->get('topic_id')==$topic->id) print "selected"?>><?php echo htmlentities($topic->name); ?></option>
  									<?php endforeach; ?>
								</select>
								
								<select name="topic2" class="selectpicker show-tick form-control" data-live-search="true">
  									<option value="NULL">No topic</option>
  									<?php foreach ($topics as $topic): ?>
  									<option value="<?php echo htmlentities($topic->id); ?>"<?php if($user->get('topic_id1')==$topic->id) print "selected"?>><?php echo htmlentities($topic->name); ?></option>
  									<?php endforeach; ?>
								</select>
                    <br />
                    <button type="submit" class="btn btn-primary">Save changes</button>
                    <button type="button" class="btn btn-default" id="cancelEditProfile">Cancel</button>

                </form>
                
            </div>

        </div>
        <div class="col-md-4">

        </div>
    </div>
</div>

<?php } ?>


<?php if($_SESSION['user'] == $user->get('user')) { ?>

<div class="container">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
        
            <div id="changePasswordPanel">

                <form name="form02" method="POST" action="<?php echo SERVER_PATH ?>profile/<?php echo $_SESSION['user']; ?>/change_password">    
                    <label>New Password: <input class="form-control" type="password" name="new_password" required/></label>
                    <br />
                    <button type="submit" class="btn btn-primary">Save New Password</button>
                    <button type="button" class="btn btn-default" id="cancelChangePassword">Cancel</button>
                </form>
                
            </div>

        </div>
        <div class="col-md-4">

        </div>
    </div>
</div>

<?php } ?>





<hr />

<div class="container">
    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-6">

            <h3>Recent Activity</h3>

            <ul class="events">
            <?php

            foreach($events as $e) {
                renderEvent($e);
            }

            ?>
            </ul>

        </div>
        <div class="col-md-3">

        </div>
    </div>
</div>

<br class="clear" />