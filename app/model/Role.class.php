<?php

class Role extends DbObject {
    // name of database table
    const DB_TABLE = 'role';
    
    // database fields (omit timestamps)
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
        if(!mysql_num_rows($result)) {
            return null;
        } else {
            $row = mysql_fetch_assoc($result);
            return ($row['id']);
        }
    }

    // load all roles
    public static function loadRoles() {
        $query = sprintf(" SELECT * FROM %s",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);

        if(!mysql_num_rows($result))
            return null;
        else {
            $roleList = array();
            while($row = mysql_fetch_assoc($result)) {
                $roleList[] = self::loadById($row['id']);
            }
            return ($roleList);
        }
    }
    
}