<?php
 
/**
 * Table data gateway for Topic.
 * 
 */
class TopicGateway {
     
    public function selectAll($order,$link) {
        if ( !isset($order) ) {
            $order = "name";
        }
        $dbOrder =  mysqli_real_escape_string($link,$order);
        //return the topics ordered in asc by $order
        
        $dbres = mysqli_query($link,"SELECT * FROM topic ORDER BY $dbOrder ASC");
         
        $topics = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $topics[] = $obj;
        }
         
        return $topics;
    }
     
    public function selectById($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
         
        $dbres = mysqli_query($link,"SELECT * FROM topic WHERE id=$dbId");
         
        return mysqli_fetch_object($dbres);
         
    }
     
    public function insert( $name, $desc,$link ) {
         
        $dbName = ($name != NULL)?"'".mysqli_real_escape_string($link,$name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysqli_real_escape_string($link,$desc)."'":'NULL';
		
        mysqli_query($link,"INSERT INTO topic (name, description,date) VALUES ($dbName, $dbDesc, now())");
        return mysqli_insert_id($link);
        
    }
     
    public function delete($id,$link) {
        $dbId = mysqli_real_escape_string($link,$id);
        mysqli_query($link,"DELETE FROM topic WHERE id=$dbId");
        if (mysqli_affected_rows($link) <= 0) {
    		echo "You can't delete a topic being referenced by a User or Question.<br><br>";
		}


    }
     
    public function update( $id, $name, $desc,$link ) {
         
        $dbId = ($id != NULL)?"'".mysqli_real_escape_string($link,$id)."'":'NULL';
        $dbName = ($name != NULL)?"'".mysqli_real_escape_string($link,$name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysqli_real_escape_string($link,$desc)."'":'NULL';
		
        mysqli_query($link,"update topic set name=$dbName, description=$dbDesc,date=now() where id=$dbId");
        
    }
}
 
?>