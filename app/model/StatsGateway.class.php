<?php
 
/**
 * Table data gateway for Stats.
 * 
 */
class StatsGateway {
     
    public function selectPostedQ($id,$day,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbDay =  mysqli_real_escape_string($link,$day);
        $dbres = mysqli_query($link,"select count(*) as result from question where user_id = $dbId  and DATE(date) = DATE_SUB(CURDATE(), INTERVAL $dbDay DAY)");
         
        $answers = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }
    public function selectReceivedQ($id,$day,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbDay =  mysqli_real_escape_string($link,$day);
        $dbres = mysqli_query($link,"select count(*) as result from question where user_id1 = $dbId and DATE(date) = DATE_SUB(CURDATE(), INTERVAL $dbDay DAY)");
         
        $answers = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }  
    public function selectPostedA($id,$day,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbDay =  mysqli_real_escape_string($link,$day);
        $dbres = mysqli_query($link,"select count(*) as result from answer where user_id = $dbId  and DATE(date) = DATE_SUB(CURDATE(), INTERVAL $dbDay DAY)");
         
        $answers = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }        
    public function selectReceivedA($id,$day,$link) {
        if ( !isset($id) ) {
            $id = "NULL";
        }
        $dbId =  mysqli_real_escape_string($link,$id);
        $dbDay =  mysqli_real_escape_string($link,$day);
        $dbres = mysqli_query($link,"select count(*) as result from answer a where a.question_id in (select q.id from question q where user_id=$dbId) and DATE(a.date) = DATE_SUB(CURDATE(), INTERVAL $dbDay DAY)");
         
        $answers = array();
        while ( ($obj = mysqli_fetch_object($dbres)) != NULL ) {
            $answers[] = $obj;
        }
         
        return $answers;
    }     
    
}
 
?>