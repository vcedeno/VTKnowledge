<?php

class EventType extends DbObject {
    // name of database table
    const DB_TABLE = 'event_type';
    
    // database fields
    protected $id;
    protected $name;
    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'name' => ''
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->name = $args['name'];
    }
    
    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
            'name' => $this->name
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
    
    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    public static function getIdFromName($name=null) {
        if($name == null)
            return null;
        
        $db = Db::instance();
        $q = sprintf(" SELECT id FROM ".self::DB_TABLE." WHERE name = '%s' ",
                $name
                    );
        $result = $db->lookup($q);
        if(!mysqli_num_rows($result)) {
            return null;
        } else {
            $row = mysqli_fetch_assoc($result);
            return ($row['id']);
        }
    }
    
}