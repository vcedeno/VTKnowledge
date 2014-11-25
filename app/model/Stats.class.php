<?php
 
require_once 'StatsGateway.class.php';
require_once 'ValidationException.class.php';
 
class Stats {

private $statsGateway    = NULL;


private function openDb() {
$link=mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE);
if (mysqli_connect_errno()) {
throw new Exception("Connection to the database server failed!");
}
}

private function closeDb() {
mysqli_close(mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
}

public function __construct() {
$this->statsGateway = new statsGateway();
}

public function getPostedQ($id,$day) {
		try {
				$this->openDb();
				$res = $this->statsGateway->selectPostedQ($id,$day,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}
public function getPostedA($id,$day) {
		try {
				$this->openDb();
				$res = $this->statsGateway->selectPostedA($id,$day,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}
public function getReceivedQ($id,$day) {
		try {
				$this->openDb();
				$res = $this->statsGateway->selectReceivedQ($id,$day,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}
public function getReceivedA($id,$day) {
		try {
				$this->openDb();
				$res = $this->statsGateway->selectReceivedA($id,$day,mysqli_connect(DB_HOST, DB_USER, DB_PASS,DB_DATABASE));
				$this->closeDb();
				return $res;
				} catch (Exception $e) {
				$this->closeDb();
				throw $e;
				}
}
}