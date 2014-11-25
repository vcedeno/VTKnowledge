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
     
        public function selectWords($link) {

        $dbres = mysqli_query($link,"select * from count order by count desc limit 50");
         
        $wordsA = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $wordsA[] = $obj;
        }
         
        return $wordsA;
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
        $output=mysqli_insert_id($link);	
        
        //every time a question is inserted the words are counted into the count table
        $words= str_word_count("$text", 1); 
		foreach($words as $word){ 
		$dbWord = ($word != NULL)?"'".mysqli_real_escape_string($link,$word)."'":'NULL';
		$i=0;
		    if($dbres = mysqli_query($link,"SELECT count FROM count WHERE word=$dbWord"))
        	{
        	    while($obj = mysqli_fetch_object($dbres)){
        		$i=$i+1;
        		$value=$obj->count+1;
        		$dbValue = ($value != NULL)?"'".mysqli_real_escape_string($link,$value)."'":'NULL';
        	 	mysqli_query($link,"update count set count=$dbValue where word=$dbWord");
				}
        	}
        	if($i==0)
        	{
 				mysqli_query($link,"INSERT INTO count VALUES ($dbWord,1)");
 
        	}
		} 
			
        //return mysqli_insert_id($link);
        return $output;
        
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