# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.20)
# Database: mydb
# Generation Time: 2014-11-09 03:09:14 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table answer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `vote` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `old_text` text,
  `old_date` datetime DEFAULT NULL,
  `show` int(11) DEFAULT '1',
  `user_delete` int(11) DEFAULT NULL,
  `user_update` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`question_id`),
  KEY `fk_answer_user1_idx` (`user_id`),
  KEY `fk_answer_question1_idx` (`question_id`),
  CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;

INSERT INTO `answer` (`id`, `text`, `vote`, `date`, `user_id`, `question_id`, `old_text`, `old_date`, `show`, `user_delete`, `user_update`)
VALUES
	(7,'Nope, it\'s a holiday',0,'2014-10-12 15:31:41',5,13,NULL,NULL,1,NULL,NULL),
	(14,'It\'s D2',0,'2014-10-12 15:39:00',5,12,NULL,NULL,1,NULL,NULL),
	(20,'Torg bridge',0,'2014-10-13 18:31:12',6,20,NULL,NULL,1,NULL,NULL),
	(21,'8pm and 10pm',0,'2014-10-13 18:32:22',4,19,NULL,NULL,1,NULL,NULL),
	(22,'Theory of Algorithms',0,'2014-10-13 18:32:42',4,16,NULL,NULL,1,NULL,NULL),
	(23,'The library',0,'2014-10-13 18:41:35',5,14,NULL,NULL,1,NULL,NULL),
	(24,'hsjfhajfhjashsjfhajfhjashsjfhajfhjashsjfhajfh',0,'2014-10-21 10:59:47',18,20,NULL,NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `post_answer` AFTER INSERT ON `answer` FOR EACH ROW BEGIN
DECLARE user integer;

  SET @user:=(select user_id from question where id= NEW.question_id);
  INSERT INTO event (event_type_id,user_id1,user_id2,data_1,when_happened)
  values(5,NEW.user_id,@user,NEW.question_id,NEW.date);

END */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) DEFAULT NULL,
  `user_id1` int(11) DEFAULT NULL,
  `user_id2` int(11) DEFAULT NULL,
  `data_1` text,
  `data_2` text,
  `when_happened` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `event_type_id` (`event_type_id`),
  KEY `user_id1` (`user_id1`),
  KEY `user_id2` (`user_id2`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_id1`) REFERENCES `user` (`id`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`user_id2`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`id`, `event_type_id`, `user_id1`, `user_id2`, `data_1`, `data_2`, `when_happened`)
VALUES
	(12,3,5,NULL,NULL,NULL,'2014-11-08 21:50:59'),
	(13,3,5,NULL,NULL,NULL,'2014-11-08 21:50:59');

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event_type`;

CREATE TABLE `event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;

INSERT INTO `event_type` (`id`, `name`)
VALUES
	(1,'edit_first_name'),
	(2,'edit_last_name'),
	(3,'edit_topic'),
	(4,'post_question'),
	(5,'post_answer');

/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table question
# ------------------------------------------------------------

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `date` datetime DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_id1` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `topic_id1` int(11) DEFAULT NULL,
  `show` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_question_user_idx` (`user_id`),
  KEY `fk_question_user1_idx` (`user_id1`),
  KEY `fk_question_topic1_idx` (`topic_id`),
  KEY `fk_question_topic2_idx` (`topic_id1`),
  CONSTRAINT `fk_question_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_topic2` FOREIGN KEY (`topic_id1`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user1` FOREIGN KEY (`user_id1`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;

INSERT INTO `question` (`id`, `text`, `date`, `vote`, `user_id`, `user_id1`, `topic_id`, `topic_id1`, `show`)
VALUES
	(12,'What is the best vegan dining hall?','2014-10-12 14:14:24',0,5,NULL,13,NULL,1),
	(13,'Do we classes this Friday?','2014-10-12 14:15:10',0,5,NULL,NULL,NULL,1),
	(14,'Where is the most quiet place on campus?','2014-10-12 19:12:00',0,6,NULL,NULL,NULL,1),
	(16,'What\'s the hardest CS class taught next Fall?','2014-10-13 12:20:03',0,5,NULL,NULL,NULL,1),
	(17,'Who is the best HCI professor?','2014-10-13 16:33:28',0,6,4,2,11,1),
	(18,'What\'s the best co-ed fraternity?','2014-10-13 16:38:53',0,6,NULL,8,NULL,1),
	(19,'What times do people play bball at the gym?','2014-10-13 17:03:22',0,6,4,15,NULL,1),
	(20,'Where do I take a computer for repair?','2014-10-13 18:30:05',0,5,6,NULL,NULL,1);

/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

DELIMITER ;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION" */;;
/*!50003 CREATE */ /*!50017 DEFINER=`root`@`localhost` */ /*!50003 TRIGGER `post_question` AFTER INSERT ON `question` FOR EACH ROW INSERT INTO event (event_type_id,user_id1,user_id2,data_1,when_happened)
  values(4,NEW.user_id,NEW.user_id1,NEW.id, NEW.date) */;;
DELIMITER ;
/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`id`, `name`)
VALUES
	(1,'registered'),
	(2,'moderator'),
	(3,'admin');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;

INSERT INTO `topic` (`id`, `name`, `description`, `date`)
VALUES
	(2,'Education','Education classes and conferences','2014-10-13 12:18:49'),
	(8,'Greek Life','Fraternities and Sororities','2014-10-13 16:36:28'),
	(11,'HCI','Topics in Human Computer Interaction','2014-11-03 15:18:45'),
	(13,'Dining','Dining halls and food','2014-10-13 16:41:16'),
	(15,'Sports','Pick up games','2014-10-13 17:02:21');

/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `description` varchar(345) DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `topic_id1` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_topic1_idx` (`topic_id`),
  KEY `fk_user_topic2_idx` (`topic_id1`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `fk_user_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_topic2` FOREIGN KEY (`topic_id1`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `firstName`, `lastName`, `description`, `user`, `password`, `image`, `gender`, `topic_id`, `topic_id1`, `role_id`)
VALUES
	(4,'Ambika','Karanth',NULL,'ak@vt.edu','Securepass1',NULL,'female',NULL,NULL,1),
	(5,'Vanessa','Cedeno','d','vc@vt.edu','Securepass1',NULL,'female',NULL,NULL,3),
	(6,'Mauricio','De la Barra',NULL,'md@vt.edu','Securepass1',NULL,'male',NULL,NULL,2),
	(13,'Andy','Johnson',NULL,'andy@vt.edu','Securepass1',NULL,'male',NULL,NULL,1),
	(14,'Matt','Neal',NULL,'matt@vt.edu','Securepass1',NULL,'other',NULL,NULL,2),
	(15,'Theo','Walcott',NULL,'theo@vt.edu','Securepass1',NULL,'male',NULL,NULL,1),
	(16,'Anna','Knox',NULL,'anna@vt.edu','Securepass1',NULL,'female',NULL,NULL,1),
	(17,'John','Leon',NULL,'john@vt.edu','Securepass1',NULL,'male',NULL,NULL,2),
	(18,'Kurt','Luther',NULL,'kl@vt.edu','Securepass1',NULL,'male',NULL,NULL,1),
	(19,'Daniel','Sanders',NULL,'sanders@vt.edu','Securepass1',NULL,'male',NULL,NULL,2),
	(20,'Mary','Huang',NULL,'huang@vt.edu','Securepass1',NULL,'female',NULL,NULL,2);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
