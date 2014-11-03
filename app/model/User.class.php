<?php

class User extends DbObject {
    // name of database table
    const DB_TABLE = 'user';
    
    protected $id;
    protected $firstName;
    protected $lastName;
    protected $description;
    protected $user;
    protected $password;
    protected $image;
    protected $gender;
    protected $topic_id;
    protected $topic_id1;

    
    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'firstName' => null,
            'lastName' => null,
            'description' => null,
            'user' => '',
            'password' => '',
            'image' => null,
            'gender' => null,
            'topic_id' => null,
            'topic_id1' => null
            );
        
        $args += $defaultArgs;
        
        $this->id = $args['id'];
        $this->firstName = $args['firstName'];
        $this->lastName = $args['lastName'];
        $this->description = $args['description'];
        $this->user = $args['user'];
        $this->password = $args['password'];
        $this->image = $args['image'];
        $this->gender = $args['gender'];
        $this->topic_id = $args['topic_id'];
        $this->topic_id1 = $args['topic_id1'];

    }
    
    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id 
        $db_properties = array(
            'firstName' => $this->firstName,
            'lastName' => $this->lastName,
            'description' => $this->description,
            'user' => $this->user,
            'password' => $this->password,
            'image' => $this->image,
            'gender' => $this->gender,
            'topic_id' => $this->topic_id,
            'topic_id1' => $this->topic_id1
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }
    
    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    
    // load user by username
    public static function loadByUsername($username=null) {
        if($username === null)
            return null;
        
        $query = sprintf(" SELECT id FROM %s WHERE user = '%s' ",
            self::DB_TABLE,
            $username
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysql_num_rows($result))
            return null;
        else {
            $row = mysql_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }

    // load all users
    public static function loadUsers() {
        $query = sprintf(" SELECT * FROM %s",
            self::DB_TABLE
            );
        $db = Db::instance();
        $result = $db->lookup($query);

        if(!mysql_num_rows($result))
            return null;
        else {
            $userList = array();
            while($row = mysql_fetch_assoc($result)) {
                $userList[] = self::loadById($row['id']);
            }
            return ($userList);
        }
    }

    
}