<?php
 
/**
 * Table data gateway for Question.
 * 
 */
class QuestionGateway {
     
    public function selectAll($order,$link) {
        if ( !isset($order) ) {
            $order = "name";
        }
        $dbOrder =  mysqli_real_escape_string($link,$order);
        $dbres = mysqli_query($link,"SELECT * FROM question ORDER BY $dbOrder DESC");
         
        $topics = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $topics[] = $obj;
        }
         
        return $topics;
    }
     
    public function selectById($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
         
        $dbres = mysqli_query($link,"SELECT * FROM question WHERE id=$dbId");
         
        return mysqli_fetch_object($dbres);
         
    }
     
    public function insert($text, $user1,$user2,$topic1,$topic2,$link) {
         
        $dbText = ($text != NULL)?"'".mysqli_real_escape_string($link,$text)."'":'NULL';
        $dbUser1 = ($user1 != NULL)?"'".mysqli_real_escape_string($link,$user1)."'":'NULL';
		$dbUser2 = ($user2 != NULL)?"'".mysqli_real_escape_string($link,$user2)."'":'NULL';
        $dbTopic1 = ($topic1 != NULL)?"'".mysqli_real_escape_string($link,$topic1)."'":'NULL';
        $dbTopic2 = ($topic2 != NULL)?"'".mysqli_real_escape_string($link,$topic2)."'":'NULL';
        
        
        mysqli_query($link,"INSERT INTO question (text,date,vote,user_id,user_id1, topic_id,topic_id1) VALUES ($dbText,now(),0,$dbUser1,$dbUser2,$dbTopic1,$dbTopic2)");
        return mysqli_insert_id($link);
        
    }
     
    public function delete($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
        mysqli_query($link,"DELETE FROM question WHERE id=$dbId");
    }
     
    public function update( $id, $name, $desc,$link) {
         
        $dbId = ($id != NULL)?"'".mysqli_real_escape_string($link,$id)."'":'NULL';
        $dbName = ($name != NULL)?"'".mysqli_real_escape_string($link,$name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysqli_real_escape_string($link,$desc)."'":'NULL';
		
        mysqli_query($link,"update question set name=$dbName, description=$dbDesc,date=now() where id=$dbId");
        
    }
}
 
?>