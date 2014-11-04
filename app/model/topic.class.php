<?php
 
require_once 'TopicGateway.class.php';
require_once 'ValidationException.class.php';
 
class Topic {

private $topicGateway    = NULL;

private function openDb() {
if (!mysql_connect("127.0.0.1", "root", "")) {
throw new Exception("Connection to the database server failed!");
}
if (!mysql_select_db("mydb")) {
throw new Exception("No mydb database found on database server.");
}
}

private function closeDb() {
mysql_close();
}

public function __construct() {
$this->topicGateway = new TopicGateway();
}

public function getAllTopics($order) {
		try {
				$this->openDb();
				$res = $this->topicGateway->selectAll($order);
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
				$res = $this->topicGateway->selectById($id);
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->topicGateway->find($id);
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
			$res = $this->topicGateway->insert($name, $desc);
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
		$res = $this->topicGateway->delete($id);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function editTopic( $id, $name, $desc ) {
		try {
		$this->openDb();
		$res = $this->topicGateway->update($id, $name, $desc);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

}
