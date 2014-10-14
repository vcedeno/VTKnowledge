<?php
 
/**
 * Table data gateway for Topic.
 * 
 */
class TopicGateway {
     
    public function selectAll($order) {
        if ( !isset($order) ) {
            $order = "name";
        }
        $dbOrder =  mysql_real_escape_string($order);
        //return the topics ordered in asc by $order
        
        $dbres = mysql_query("SELECT * FROM topic ORDER BY $dbOrder ASC");
         
        $topics = array();
        while ( ($obj = mysql_fetch_object($dbres)) != NULL ) {
            $topics[] = $obj;
        }
         
        return $topics;
    }
     
    public function selectById($id) {
        $dbId = mysql_real_escape_string($id);
         
        $dbres = mysql_query("SELECT * FROM topic WHERE id=$dbId");
         
        return mysql_fetch_object($dbres);
         
    }
     
    public function insert( $name, $desc ) {
         
        $dbName = ($name != NULL)?"'".mysql_real_escape_string($name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysql_real_escape_string($desc)."'":'NULL';
		
        mysql_query("INSERT INTO topic (name, description,date) VALUES ($dbName, $dbDesc, now())");
        return mysql_insert_id();
        
    }
     
    public function delete($id) {
        $dbId = mysql_real_escape_string($id);
        mysql_query("DELETE FROM topic WHERE id=$dbId");
        if (mysql_affected_rows() <= 0) {
    		echo "You can't delete a topic being referenced by a User or Question.<br><br>";
		}


    }
     
    public function update( $id, $name, $desc ) {
         
        $dbId = ($id != NULL)?"'".mysql_real_escape_string($id)."'":'NULL';
        $dbName = ($name != NULL)?"'".mysql_real_escape_string($name)."'":'NULL';
        $dbDesc = ($desc != NULL)?"'".mysql_real_escape_string($desc)."'":'NULL';
		
        mysql_query("update topic set name=$dbName, description=$dbDesc,date=now() where id=$dbId");
        
    }
}
 
?>