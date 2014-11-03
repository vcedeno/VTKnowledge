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
        $dbres = mysql_query("SELECT * FROM answer where question_id = $dbId");
         
        $answers = array();
        while ( ($obj = mysql_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
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
     
    public function delete($id) {
        $dbId = mysql_real_escape_string($id);
        mysql_query("DELETE FROM answer WHERE id=$dbId");
    }
     
    public function update( $id, $text) {
         
        $dbId = ($id != NULL)?"'".mysql_real_escape_string($id)."'":'NULL';
        $dbText = ($text != NULL)?"'".mysql_real_escape_string($text)."'":'NULL';
        
        mysql_query("update answer set text=$dbText,date=now() where id=$dbId");
        
    }
}
 
?>