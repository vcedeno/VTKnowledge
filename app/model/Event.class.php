<?php

class Event extends DbObject {
    // name of database table
    const DB_TABLE = 'event';
    
    // database fields (omit timestamps)
    protected $id;
    protected $event_type_id;
    protected $user_1_id;
    protected $user_2_id;
    protected $message_1_id;
    protected $message_2_id;
    protected $data_1;
    protected $data_2;
    protected $when_happened;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'event_type_id' => 0,
            'user_1_id' => 0,
            'user_2_id' => null,
            'message_1_id' => null,
            'message_2_id' => null,
            'data_1' => null,
            'data_2' => null,
            'when_happened' => null
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->event_type_id = $args['event_type_id'];
        $this->user_1_id = $args['user_1_id'];
        $this->user_2_id = $args['user_2_id'];
        $this->message_1_id = $args['message_1_id'];
        $this->message_2_id = $args['message_2_id'];
        $this->data_1 = $args['data_1'];
        $this->data_2 = $args['data_2'];
        $this->when_happened = $args['when_happened'];
    }
    
    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'event_type_id' => $this->event_type_id,
            'user_1_id' => $this->user_1_id,
            'user_2_id' => $this->user_2_id,
            'message_1_id' => $this->message_1_id,
            'message_2_id' => $this->message_2_id,
            'data_1' => $this->data_1,
            'data_2' => $this->data_2
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
    
    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    public static function loadByUserId($userID=null) {
        if($userID == null)
            return null;
        
        $db = Db::instance();
        $q = sprintf(" SELECT id FROM ".self::DB_TABLE." WHERE user_1_id = %d OR user_2_id = %d ORDER BY when_happened DESC ",
            $userID,
            $userID
            );
        $result = $db->lookup($q);
        $events = array();
        while($row = mysql_fetch_assoc($result)) {
            $events[] = self::loadById($row['id']);
        }
        return ($events);
        
    }
    
}