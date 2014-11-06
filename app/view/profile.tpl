<script type="text/javascript">

$(document).ready(function(){
   
<?php if($_SESSION['user'] == $user->get('user')) { ?>
    $('#editProfilePanel').hide();
    
    $('#editProfileButton').click(function(){
        $('#editProfilePanel').show();
        $('input[name="first_name"]').focus();
        $('#profileInfo').hide();
    });

<?php } ?>
});

</script>

<div id="avatar"></div>

<div class="container">
    <div class="row">
        <div class="col-md-4">

        </div>
        <div class="col-md-4">
        
            <div id="profileInfo">
                <h3><?= $user->get('firstName').' '.$user->get('lastName') ?></h3>

                <p>Email: <a href="mailto:<?= $user->get('user') ?>"><?= $user->get('user') ?></a></p>


                <button name="editProfileButton" id="editProfileButton">Edit profile</button>
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

                <form name="form01" method="POST" action="<?= SERVER_PATH ?>profile/<?= $_SESSION['user'] ?>/edit">    
                    <label>First name: <input type="text" name="first_name" value="<?= $user->get('firstName') ?>" /></label>

                    <label>Last name: <input type="text" name="last_name" value="<?= $user->get('lastName') ?>" /></label>
                    
                    <input type="submit" name="submit" value="Save changes" />
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
