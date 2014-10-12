<h3>Post Message</h3>

<form name="form01" method="POST" action="<?= SERVER_PATH ?>message/add">

    <textarea name="message"></textarea><br />
    <input type="submit" name="submit" value="Post" />
</form>

<hr />

<h3>News Feed</h3>

<?php if(!is_null($messages)){ ?>

<ul id="feed">
<?php
    foreach($messages as $m) {
        $content = $m->get('content'); // message content
        $creatorID = $m->get('creator_id'); // creator ID
        $creator = AppUser::loadById($creatorID);
        $cfullname = $creator->get('first_name').' '.$creator->get('last_name');
        $cusername = $creator->get('username');
        $when = $m->get('when_posted'); // message timestamp
        $when = date("M j, g:i a", strtotime($when)); // format: Mar 10, 5:16 pm
?>
    <li><?= $content ?> <span class="byline">posted by <a href="<?= SERVER_PATH.'profile/'.$cusername ?>"><?= $cfullname ?></a> at <?= $when ?></span></li>
<?php } ?>
</ul>

<?php } ?>