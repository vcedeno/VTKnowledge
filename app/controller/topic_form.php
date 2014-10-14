<!--Page of a form to create a new topic--!>
<?php
require_once '../global.php';


$pageName = 'New Topic';

require_once '../model/topic.class.php';

require_once '../view/header.tpl';

require_once '../view/topic_form.tpl';

require_once '../view/footer.tpl';



?>