<?php
 
require_once 'AnswerGateway.class.php';
require_once 'ValidationException.class.php';
 
class Answer {

private $answerGateway    = NULL;


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
$this->answerGateway = new answerGateway();
}

public function getAllAnswers($id) {
		try {
				$this->openDb();
				$res = $this->answerGateway->selectAll($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}

public function getAnswer($id) {
		try {
				$this->openDb();
				$res = $this->answerGateway->selectById($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->answerGateway->find($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
}

private function validateQuestionParams( $text, $user, $question) {
				$errors = array();
				if ( !isset($text) || empty($text) ) {
				$errors[] = 'Text is required';
}

if ( empty($errors) ) {
				return;
				}
				throw new ValidationException($errors);
}

public function createNewAnswer($text, $user, $question) {
	try {
			$this->openDb();
			$this->validateQuestionParams($text, $user, $question);
			$res = $this->answerGateway->insert($text, $user, $question,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
			$this->closeDb();
			return $res;
		} catch (Exception $e) {
			$this->closeDb();
			throw $e;
			}
}

	public function deleteAnswer( $id,$user ) {
		try {
		$this->openDb();
		$res = $this->answerGateway->delete($id,$user,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
	public function undoDelete($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->undoDelete($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
	public function editAnswer( $id, $text,$user) {
		try {
		$this->openDb();
		$res = $this->answerGateway->update($id, $text,$user,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function undoEdit($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->undoEdit($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function allEvents($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->allEvents($id,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
		return $res;
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
}
