<?php
 
require_once 'QuestionGateway.class.php';
require_once 'ValidationException.class.php';
 
class Question {

private $questionGateway    = NULL;

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
$this->questionGateway = new questionGateway();
}

public function getAllQuestions($order) {
		try {
				$this->openDb();
				$res = $this->questionGateway->selectAll($order);
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}

public function getQuestion($id) {
		try {
				$this->openDb();
				$res = $this->questionGateway->selectById($id);
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->questionGateway->find($id);
}

private function validateQuestionParams( $text, $user1,$user2,$topic1,$topic2) {
				$errors = array();
				if ( !isset($text) || empty($text) ) {
				$errors[] = 'Text is required';
				}
				if (empty($user1) ) {
				$errors[] = 'Problem with user id';
				}
				if ( empty($errors) ) {
				return;
				}
				throw new ValidationException($errors);
}

public function createNewQuestion($text, $user1,$user2,$topic1,$topic2) {
	try {
			$this->openDb();
			$this->validateQuestionParams($text, $user1,$user2,$topic1,$topic2);
			$res = $this->questionGateway->insert($text, $user1,$user2,$topic1,$topic2);
			$this->closeDb();
			return $res;
		} catch (Exception $e) {
			$this->closeDb();
			throw $e;
			}
}

	public function deleteQuestion( $id ) {
		try {
		$this->openDb();
		$res = $this->questionGateway->delete($id);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function editQuestion( $id, $name, $desc ) {
		try {
		$this->openDb();
		$res = $this->questionGateway->update($id, $name, $desc);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

}
