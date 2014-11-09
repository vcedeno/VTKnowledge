<?php

class Event extends DbObject {
    // name of database table
    const DB_TABLE = 'event';
    
    // database fields (omit timestamps)
    protected $id;
    protected $event_type_id;
    protected $user_id1;
    protected $user_id2;
    protected $data_1;
    protected $data_2;
    protected $when_happened;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'event_type_id' => 0,
            'user_id1' => 0,
            'user_id2' => null,
            'data_1' => null,
            'data_2' => null,
            'when_happened' => null
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->event_type_id = $args['event_type_id'];
        $this->user_id1 = $args['user_id1'];
        $this->user_id2 = $args['user_id2'];
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
            'user_id1' => $this->user_id1,
            'user_id2' => $this->user_id2,
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
        $q = sprintf(" SELECT id FROM ".self::DB_TABLE." WHERE user_id1 = %d OR user_id2 = %d ORDER BY when_happened DESC ",
            $userID,
            $userID
            );
        $result = $db->lookup($q);
        $events = array();
        while($row = mysqli_fetch_assoc($result)) {
            $events[] = self::loadById($row['id']);
        }
        return ($events);
        
    }

    // load all events
    public static function loadEvents() {
        $query = sprintf(" SELECT * FROM %s order by when_happened desc",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);

        if(!mysqli_num_rows($result))
            return null;
        else {
            $eventList = array();
            while($row = mysqli_fetch_assoc($result)) {
                $eventList[] = self::loadById($row['id']);
            }
            return ($eventList);
        }
    }
    
}