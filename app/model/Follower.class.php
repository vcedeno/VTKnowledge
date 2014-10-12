<?php

class Follower extends DbObject {
    // name of database table
    const DB_TABLE = 'follower';
    
    // database fields (omit timestamps)
    protected $id;
    protected $follower_id;
    protected $followee_id;
    protected $when_followed;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'follower_id' => 0,
            'followee_id' => 0,
            'when_followed' => null
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->follower_id = $args['follower_id'];
        $this->followee_id = $args['followee_id'];
        $this->when_followed = $args['when_followed'];
    }
    
    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'follower_id' => $this->follower_id,
            'followee_id' => $this->followee_id
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
    
    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    // get an array of followers who follow this user ID
    public function getFollowersByFolloweeId($followeeID=null) {
        if($followeeID == null)
            return null;
        
        $query = sprintf(" SELECT * FROM `%s`
            WHERE followee_id = %d
            ORDER BY when_followed DESC ",
            self::DB_TABLE,
            $followeeID
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $followers = array();
            while($row = mysql_fetch_assoc($result)) {
                $followers[] = self::loadById($row['id']);
            }
            return ($followers);
        }
    }
    
    // get an array of followees who are followed by this user ID
    public function getFolloweesByFollowerId($followerID=null) {
        if($followerID == null)
            return null;
        
        $query = sprintf(" SELECT * FROM `%s`
            WHERE follower_id = %d
            ORDER BY when_followed DESC ",
            self::DB_TABLE,
            $followerID
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $followees = array();
            while($row = mysql_fetch_assoc($result)) {
                $followees[] = self::loadById($row['id']);
            }
            return ($followees);
        }
    }
    
}