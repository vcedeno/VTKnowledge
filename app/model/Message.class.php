<?php

class Message extends DbObject {
    // name of database table
    const DB_TABLE = 'message';
    
    // database fields (omit timestamps)
    protected $id;
    protected $creator_id;
    protected $content;
    protected $hidden;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'creator_id' => 0,
            'content' => '',
            'when_posted' => null,
            'hidden' => 0
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->creator_id = $args['creator_id'];
        $this->content = $args['content'];
        $this->when_posted = $args['when_posted'];
        $this->hidden = $args['hidden'];
    }
    
    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'creator_id' => $this->creator_id,
            'content' => $this->content,
            'hidden' => $this->hidden
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
    
    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    // get an array of messages created by this user ID
    public function getMessagesByCreatorId($creatorID=null) {
        if($creatorID == null)
            return null;
        
        $query = sprintf(" SELECT * FROM `%s`
            WHERE creator_id = %d
            ORDER BY when_posted DESC ",
            self::DB_TABLE,
            $creatorID
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $messages = array();
            while($row = mysql_fetch_assoc($result)) {
                $messages[] = self::loadById($row['id']);
            }
            return ($messages);
        }
    }
    
    public function getFolloweeMessagesByFollowerId($followerID=null) {
        if($followerID == null)
            return null;
        
        $query = sprintf(" SELECT m.id AS id FROM `%s` m
            INNER JOIN `%s` f ON m.creator_id = f.followee_id 
            WHERE (f.follower_id = %d
            OR m.creator_id = %d )
            ORDER BY when_posted DESC ",
            self::DB_TABLE,
            Follower::DB_TABLE,
            $followerID,
            $followerID
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $messages = array();
            while($row = mysql_fetch_assoc($result)) {
                $messages[] = self::loadById($row['id']);
            }
            return ($messages);
        }
    }
    
}