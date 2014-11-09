<?php
 
require_once 'QuestionGateway.class.php';
require_once 'ValidationException.class.php';
 
class Question {

private $questionGateway    = NULL;

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
$this->questionGateway = new questionGateway();
}

public function getAllQuestions($order) {
		try {
				$this->openDb();
				$res = $this->questionGateway->selectAll($order,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
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
				$res = $this->questionGateway->selectById($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->questionGateway->find($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
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
			$res = $this->questionGateway->insert($text, $user1,$user2,$topic1,$topic2,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
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
		$res = $this->questionGateway->delete($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function editQuestion( $id, $name, $desc ) {
		try {
		$this->openDb();
		$res = $this->questionGateway->update($id, $name, $desc,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

}
