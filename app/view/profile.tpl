<script type="text/javascript">

$(document).ready(function(){
   
<?php if($_SESSION['user'] == $user->get('username')) { ?>
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

<div id="profileInfo">
    <h3><?= $user->get('first_name').' '.$user->get('last_name') ?></h3>

    <p>Email: <a href="mailto:<?= $user->get('email') ?>"><?= $user->get('email') ?></a></p>
    <p>From <?= $user->get('location') ?></p>
    <p>Age: <?= $user->get('age') ?></p>

    <button name="editProfileButton" id="editProfileButton">Edit profile</button>
</div>

<?php if($_SESSION['user'] == $user->get('username')) { ?>
<div id="editProfilePanel">

<form name="form01" method="POST" action="<?= SERVER_PATH ?>profile/<?= $_SESSION['user'] ?>/edit">    
    <label>First name: <input type="text" name="first_name" value="<?= $user->get('first_name') ?>" /></label>

    <label>Last name: <input type="text" name="last_name" value="<?= $user->get('last_name') ?>" /></label>
    
    <input type="submit" name="submit" value="Save changes" />
</form>
    
</div>
<?php } ?>

<hr />

<h3>News Feed</h3>

<?php if(!is_null($messages)){ ?>

<ul id="feed">
<?php
    foreach($messages as $m) {
        $content = $m->get('content'); // message content
        $when = $m->get('when_posted'); // message timestamp
        $when = date("M j, g:i a", strtotime($when)); // format: Mar 10, 5:16 pm
?>
    <li><?= $content ?> <span class="byline">posted <?= $when ?></span></li>
<?php } ?>
</ul>

<?php } ?>

<hr />

<h3>Recent Activity</h3>

<ul class="events">
<?php

foreach($events as $e) {
    renderEvent($e);
}

<<<<<<< HEAD
?>
</ul>
=======
<div class="container">
    <div class="row">
        <div class="col-md-3">
>>>>>>> parent of 4aebdb4... htaccesss

<hr />


<div style="width: 45%; float: left;">
<h3>Following (<?= $numFollowing ?>)</h3>

<?php if(!is_null($following)){ ?>

<ul class="follow">
<?php
    foreach($following as $f) {
        $userID = $f->get('followee_id'); // get user ID of followee
        $followee = AppUser::loadById($userID); // get user info for followee
        $fusername = $followee->get('username');
        $ffullname = $followee->get('first_name').' '.$followee->get('last_name');
        $when = $f->get('when_followed'); // follow timestamp
        $when = date("M j, g:i a", strtotime($when)); // format: Mar 10, 5:16 pm
?>
    <li><a href="<?= SERVER_PATH ?>profile/<?= $fusername ?>"><?= $ffullname ?></a> <span class="byline">followed <?= $when ?></span></li>
<?php } ?>
</ul>

<?php } ?>
</div>

<div style="width: 45%; float: right;">
<h3>Followers (<?= $numFollowers ?>)</h3>

<?php if(!is_null($followers)){ ?>

<ul class="follow">
<?php
    foreach($followers as $f) {
        $userID = $f->get('follower_id'); // get user ID of follower
        $follower = AppUser::loadById($userID); // get user info for follower
        $fusername = $follower->get('username');
        $ffullname = $follower->get('first_name').' '.$follower->get('last_name');
        $when = $f->get('when_followed'); // follow timestamp
        $when = date("M j, g:i a", strtotime($when)); // format: Mar 10, 5:16 pm
?>
    <li><a href="<?= SERVER_PATH ?>profile/<?= $fusername ?>"><?= $ffullname ?></a> <span class="byline">followed <?= $when ?></span></li>
<?php } ?>
</ul>

<?php } ?>
</div>

<br class="clear" />
