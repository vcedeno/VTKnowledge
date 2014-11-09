<?php
 
require_once 'TopicGateway.class.php';
require_once 'ValidationException.class.php';
 
class Topic {

private $topicGateway    = NULL;

private function openDb() {
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE);
if (mysqli_connect_errno()) {
throw new Exception("Connection to the database server failed!");
}
//if (!mysql_select_db(DB_DATABASE)) {
//throw new Exception("No mydb database found on database server.");
//}
}

private function closeDb() {
mysqli_close(mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
}

public function __construct() {
$this->topicGateway = new TopicGateway();
}

public function getAllTopics($order) {
		try {
				$this->openDb();
				$res = $this->topicGateway->selectAll($order,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}

public function getTopic($id) {
		try {
				$this->openDb();
				$res = $this->topicGateway->selectById($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->topicGateway->find($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
}

private function validateTopicParams( $name, $desc) {
$errors = array();
if ( !isset($name) || empty($name) ) {
$errors[] = 'Name is required';
}
if ( empty($errors) ) {
return;
}
throw new ValidationException($errors);
}

public function createNewTopic( $name, $desc) {
	try {
			$this->openDb();
			$this->validateTopicParams($name, $desc);
			$res = $this->topicGateway->insert($name, $desc,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
			$this->closeDb();
			return $res;
		} catch (Exception $e) {
			$this->closeDb();
			throw $e;
			}
}

	public function deleteTopic( $id ) {
		try {
		$this->openDb();
		$res = $this->topicGateway->delete($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function editTopic( $id, $name, $desc ) {
		try {
		$this->openDb();
		$res = $this->topicGateway->update($id, $name, $desc,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

}
