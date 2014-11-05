<?php
 
require_once 'AnswerGateway.class.php';
require_once 'ValidationException.class.php';
 
class Answer {

private $answerGateway    = NULL;

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
$this->answerGateway = new answerGateway();
}

public function getAllAnswers($id) {
		try {
				$this->openDb();
				$res = $this->answerGateway->selectAll($id);
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
				$res = $this->answerGateway->selectById($id);
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
				return $this->answerGateway->find($id);
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
			$res = $this->answerGateway->insert($text, $user, $question);
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
		$res = $this->answerGateway->delete($id,$user);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
	public function undoDelete($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->undoDelete($id);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
	public function editAnswer( $id, $text,$user) {
		try {
		$this->openDb();
		$res = $this->answerGateway->update($id, $text,$user);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function undoEdit($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->undoEdit($id);
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}

	public function allEvents($id) {
		try {
		$this->openDb();
		$res = $this->answerGateway->allEvents($id);
		return $res;
		$this->closeDb();
		} catch (Exception $e) {
		$this->closeDb();
		throw $e;
		}
}
}
