<?php
 
/**
 * Table data gateway for Answer.
 * 
 */
class AnswerGateway {
     
    public function selectAll($id,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbres = mysqli_query($link,"SELECT * FROM answer where question_id = $dbId order by date desc");
         
        $answers = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }
     
        public function allEvents($id,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbres = mysqli_query($link,"select * from event where user_id1=$dbId or user_id2=$dbId order by when_happened desc");
         
        $events = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $events[] = $obj;
        }
         
        return $events;
    }
    
    public function selectById($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
         
        $dbres = mysqli_query($link,"SELECT * FROM answer WHERE id=$dbId");
         
        return mysqli_fetch_object($dbres);
         
    }
     
    public function insert($text, $user,$question,$link) {
         
        $dbText = ($text != NULL)?"'".mysqli_real_escape_string($link,$text)."'":'NULL';
        $dbUser = ($user != NULL)?"'".mysqli_real_escape_string($link,$user)."'":'NULL';
		$dbQuestion = ($question != NULL)?"'".mysqli_real_escape_string($link,$question)."'":'NULL';
       
        
        mysqli_query($link,"INSERT INTO answer (text,vote,date,user_id,question_id) VALUES ($dbText,0,now(),$dbUser,$dbQuestion)");
        return mysqli_insert_id($link);
        
    }
     
    public function delete($id,$user,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
        $userId = mysqli_real_escape_string($link,$user);
        mysqli_query($link,"update answer a set a.show=0, a.user_delete=$userId WHERE id=$dbId");
    }
    
        public function undoDelete($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
        mysqli_query($link,"update answer a set a.show=1, a.user_delete=NULL WHERE id=$dbId");
    }
     
    public function update( $id, $text,$user,$link) {
         
        $dbId = ($id != NULL)?"'".mysqli_real_escape_string($link,$id)."'":'NULL';
        $dbText = ($text != NULL)?"'".mysqli_real_escape_string($link,$text)."'":'NULL';
        $dbUser = ($user != NULL)?"'".mysqli_real_escape_string($link,$user)."'":'NULL';
        mysqli_query($link,"update answer set old_text=text, text=$dbText, old_date=date, date=now(),user_update=$dbUser where id=$dbId");
        
    }
        public function undoEdit($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
        mysqli_query($link,"update answer set text=old_text, old_text=NULL, date=old_date,old_date=NULL, user_update=NULL WHERE id=$dbId");
    }
    

    
    
    
    
}
 
?>