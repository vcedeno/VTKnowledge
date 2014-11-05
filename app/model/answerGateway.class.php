<?php
 
/**
 * Table data gateway for Answer.
 * 
 */
class AnswerGateway {
     
    public function selectAll($id) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysql_real_escape_string($id);
        $dbres = mysql_query("SELECT * FROM answer where question_id = $dbId order by date desc");
         
        $answers = array();
        while ( ($obj = mysql_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }
     
        public function allEvents($id) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysql_real_escape_string($id);
        $dbres = mysql_query("select * from event where user_id1=$dbId or user_id2=$dbId");
         
        $events = array();
        while ( ($obj = mysql_fetch_object($dbres)) != NULL ) {
            $events[] = $obj;
        }
         
        return $events;
    }
    
    public function selectById($id) {
        $dbId = mysql_real_escape_string($id);
         
        $dbres = mysql_query("SELECT * FROM answer WHERE id=$dbId");
         
        return mysql_fetch_object($dbres);
         
    }
     
    public function insert($text, $user,$question) {
         
        $dbText = ($text != NULL)?"'".mysql_real_escape_string($text)."'":'NULL';
        $dbUser = ($user != NULL)?"'".mysql_real_escape_string($user)."'":'NULL';
		$dbQuestion = ($question != NULL)?"'".mysql_real_escape_string($question)."'":'NULL';
       
        
        mysql_query("INSERT INTO answer (text,vote,date,user_id,question_id) VALUES ($dbText,0,now(),$dbUser,$dbQuestion)");
        return mysql_insert_id();
        
    }
     
    public function delete($id,$user) {
        $dbId = mysql_real_escape_string($id);
        $userId = mysql_real_escape_string($user);
        mysql_query("update answer a set a.show=0, a.user_delete=$userId WHERE id=$dbId");
    }
    
        public function undoDelete($id) {
        $dbId = mysql_real_escape_string($id);
        mysql_query("update answer a set a.show=1, a.user_delete=NULL WHERE id=$dbId");
    }
     
    public function update( $id, $text,$user) {
         
        $dbId = ($id != NULL)?"'".mysql_real_escape_string($id)."'":'NULL';
        $dbText = ($text != NULL)?"'".mysql_real_escape_string($text)."'":'NULL';
        $dbUser = ($user != NULL)?"'".mysql_real_escape_string($user)."'":'NULL';
        mysql_query("update answer set old_text=text, text=$dbText, old_date=date, date=now(),user_update=$dbUser where id=$dbId");
        
    }
        public function undoEdit($id) {
        $dbId = mysql_real_escape_string($id);
        mysql_query("update answer set text=old_text, old_text=NULL, date=old_date,old_date=NULL, user_update=NULL WHERE id=$dbId");
    }
    

    
    
    
    
}
 
?>