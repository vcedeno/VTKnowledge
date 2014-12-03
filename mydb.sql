CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vtknowle_mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
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
  KEY `fk_answer_question1_idx` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `text`, `vote`, `date`, `user_id`, `question_id`, `old_text`, `old_date`, `show`, `user_delete`, `user_update`) VALUES
(7, 'Nope, it''s a holiday', 0, '2014-11-30 15:31:41', 5, 13, NULL, NULL, 1, NULL, NULL),
(14, 'It''s D2', 0, '2014-10-12 15:39:00', 5, 12, NULL, NULL, 1, NULL, NULL),
(20, 'Torg bridge', 0, '2014-12-01 18:31:12', 6, 20, NULL, NULL, 1, NULL, NULL),
(23, 'The library', 0, '2014-10-13 18:41:35', 5, 14, NULL, NULL, 1, NULL, NULL),
(25, 'To the pc repair.', 0, '2014-12-01 21:18:14', 5, 20, NULL, NULL, 1, NULL, NULL),
(26, 'Student learning center', 0, '2014-11-09 10:17:52', 16, 14, NULL, NULL, 1, NULL, NULL),
(27, 'Try any pc outlet.', 0, '2014-11-30 10:18:33', 16, 20, NULL, NULL, 1, NULL, NULL),
(28, 'I took it to TOSHIBA repair and service center. ', 0, '2014-12-01 10:18:59', 16, 20, NULL, NULL, 1, NULL, NULL),
(29, 'Your dorm', 0, '2014-11-09 10:19:14', 16, 14, NULL, NULL, 1, NULL, NULL),
(30, 'YOU CAN TAKE YOUR COMPUTER TO SECUNDERABAD ', 0, '2014-12-01 10:19:54', 16, 20, NULL, NULL, 1, NULL, NULL),
(31, 'Yes, we do have classes this Friday.', 0, '2014-12-02 11:34:15', 16, 13, NULL, NULL, 1, NULL, NULL),
(32, 'Duck Pond', 0, '2014-11-09 11:35:15', 16, 14, NULL, NULL, 1, NULL, NULL),
(33, 'PC Masters', 0, '2014-12-02 11:38:16', 16, 20, NULL, NULL, 1, NULL, NULL),
(34, 'The library would be my suggestion. ', 0, '2014-11-09 11:42:45', 16, 14, NULL, NULL, 1, NULL, NULL),
(35, 'America', 0, '2014-11-09 11:56:33', 16, 14, NULL, NULL, 1, NULL, NULL),
(36, 'here is an answer', 0, '2014-11-23 15:49:00', 23, 21, NULL, NULL, 0, 5, NULL),
(37, 'Newman library is in front of Torgersen.', 0, '2014-11-30 11:55:45', 5, 24, NULL, NULL, 1, NULL, NULL),
(38, 'you can take it at the Burrus stop', 0, '2014-12-01 10:37:36', 5, 21, NULL, NULL, 1, NULL, NULL);

--
-- Triggers `answer`
--
DROP TRIGGER IF EXISTS `post_answer`;
DELIMITER //
CREATE TRIGGER `post_answer` AFTER INSERT ON `answer`
 FOR EACH ROW BEGIN

DECLARE user integer;



  SET @user:=(select user_id from question where id= NEW.question_id);

  INSERT INTO event (event_type_id,user_id1,user_id2,data_1,when_happened)

  values(5,NEW.user_id,@user,NEW.question_id,NEW.date);



END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `count`
--

CREATE TABLE IF NOT EXISTS `count` (
  `word` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `count`
--

INSERT INTO `count` (`word`, `count`) VALUES
('also', 21),
('away', 24),
('class', 46),
('classes', 15),
('dining', 52),
('eat', 43),
('for', 36),
('gpa', 45),
('in', 356),
('is', 69),
('library', 1),
('lunch', 98),
('me', 1),
('not', NULL),
('park', 1),
('professor', 34),
('question', 76),
('student', 24),
('tech', 87),
('the', 27),
('this', 89),
('virginia', 123),
('where', 2);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
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
  KEY `user_id2` (`user_id2`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `event_type_id`, `user_id1`, `user_id2`, `data_1`, `data_2`, `when_happened`) VALUES
(14, 5, 5, 5, '20', NULL, '2014-11-09 03:18:14'),
(17, 5, 16, 6, '14', NULL, '2014-11-09 16:17:52'),
(18, 5, 16, 5, '20', NULL, '2014-11-09 16:18:33'),
(19, 5, 16, 5, '20', NULL, '2014-11-09 16:18:59'),
(20, 5, 16, 6, '14', NULL, '2014-11-09 16:19:14'),
(21, 5, 16, 5, '20', NULL, '2014-11-09 16:19:54'),
(22, 5, 16, 5, '13', NULL, '2014-11-09 17:34:15'),
(23, 5, 16, 6, '14', NULL, '2014-11-09 17:35:15'),
(24, 5, 16, 5, '20', NULL, '2014-11-09 17:38:16'),
(25, 5, 16, 6, '14', NULL, '2014-11-09 17:42:45'),
(26, 5, 16, 6, '14', NULL, '2014-11-09 17:56:33'),
(27, 1, 6, NULL, 'Mauricio', 'Mauri', '2014-11-11 00:18:41'),
(28, 3, 6, NULL, NULL, NULL, '2014-11-11 00:18:41'),
(29, 3, 6, NULL, NULL, NULL, '2014-11-11 00:18:41'),
(30, 1, 23, NULL, 'Kurt', 'Kurtfoo', '2014-11-23 21:37:25'),
(31, 2, 23, NULL, 'Luther', 'Lutherbar', '2014-11-23 21:37:25'),
(32, 3, 23, NULL, NULL, NULL, '2014-11-23 21:37:25'),
(33, 3, 23, NULL, NULL, NULL, '2014-11-23 21:37:25'),
(34, 3, 23, NULL, NULL, '13', '2014-11-23 21:46:06'),
(35, 3, 23, NULL, NULL, NULL, '2014-11-23 21:46:06'),
(36, 3, 23, NULL, NULL, NULL, '2014-11-23 21:46:35'),
(37, 3, 23, NULL, NULL, NULL, '2014-11-23 21:46:39'),
(38, 3, 23, NULL, NULL, NULL, '2014-11-23 21:46:48'),
(39, 4, 23, NULL, '21', NULL, '2014-11-23 21:47:51'),
(40, 5, 23, 23, '21', NULL, '2014-11-23 21:49:00'),
(43, 2, 24, NULL, 'Tester', 'Testerrr', '2014-11-23 21:55:40'),
(44, 4, 24, NULL, '22', NULL, '2014-11-23 21:57:02'),
(45, 4, 18, NULL, '23', NULL, '2014-11-23 22:07:38'),
(46, 4, 5, 23, '24', NULL, '2014-11-25 17:45:26'),
(47, 5, 5, 5, '24', NULL, '2014-11-25 17:45:45'),
(50, 5, 5, 23, '21', NULL, '2014-12-01 16:37:36'),
(51, 3, 5, NULL, '13', '15', '2014-12-01 16:48:28'),
(52, 3, 5, NULL, '2', '11', '2014-12-01 16:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE IF NOT EXISTS `event_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `name`) VALUES
(1, 'edit_first_name'),
(2, 'edit_last_name'),
(3, 'edit_topic'),
(4, 'post_question'),
(5, 'post_answer');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
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
  KEY `fk_question_topic2_idx` (`topic_id1`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `text`, `date`, `vote`, `user_id`, `user_id1`, `topic_id`, `topic_id1`, `show`) VALUES
(12, 'What is the best vegan dining hall?', '2014-11-27 14:14:24', 0, 5, NULL, 13, NULL, 1),
(13, 'Do we have classes this Friday?', '2014-11-27 14:15:10', 0, 5, NULL, NULL, NULL, 1),
(14, 'Where is the most quiet place on campus?', '2014-10-12 19:12:00', 0, 6, NULL, NULL, NULL, 1),
(16, 'What''s the hardest CS class taught next Fall?', '2014-11-28 12:20:03', 0, 5, NULL, NULL, NULL, 1),
(17, 'Who is the best HCI professor?', '2014-12-02 16:33:28', 0, 6, 5, 2, 11, 1),
(18, 'What''s the best co-ed fraternity?', '2014-10-13 16:38:53', 0, 6, NULL, 8, NULL, 1),
(19, 'What times do people play bball at the gym?', '2014-12-01 17:03:22', 0, 6, 5, 15, NULL, 1),
(20, 'Where do I take a computer for repair?', '2014-11-29 18:30:05', 0, 5, 6, NULL, NULL, 1),
(21, 'Where do you take the bus?', '2014-11-23 15:47:51', 0, 23, NULL, 16, 2, 1),
(24, 'Where is the library?', '2014-11-30 11:45:26', 0, 5, 23, 2, NULL, 1);

--
-- Triggers `question`
--
DROP TRIGGER IF EXISTS `post_question`;
DELIMITER //
CREATE TRIGGER `post_question` AFTER INSERT ON `question`
 FOR EACH ROW INSERT INTO event (event_type_id,user_id1,user_id2,data_1,when_happened)

  values(4,NEW.user_id,NEW.user_id1,NEW.id, NEW.date)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'registered'),
(2, 'moderator'),
(3, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `name`, `description`, `date`) VALUES
(2, 'Education', 'Education classes and conferences', '2014-10-13 12:18:49'),
(8, 'Greek Life', 'Fraternities and Sororities', '2014-10-13 16:36:28'),
(11, 'HCI', 'Topics in Human Computer Interaction', '2014-11-03 15:18:45'),
(13, 'Dining', 'Dining halls and food', '2014-10-13 16:41:16'),
(15, 'Sports', 'Pick up games', '2014-10-13 17:02:21'),
(16, 'Transportation', 'This is a topic about transportation in Blacksburg.', '2014-12-01 10:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
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
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `description`, `user`, `password`, `image`, `gender`, `topic_id`, `topic_id1`, `role_id`) VALUES
(5, 'Vanessa', 'Cedeno', 'This is the description.', 'vc@vt.edu', 'Securepass1', NULL, 'female', 15, 11, 3),
(6, 'Mauri', 'De la Barra', 'd', 'md@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 2),
(13, 'Andy', 'Johnson', NULL, 'andy@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 1),
(14, 'Matt', 'Neal', NULL, 'matt@vt.edu', 'Securepass1', NULL, 'other', NULL, NULL, 2),
(15, 'Theo', 'Walcott', NULL, 'theo@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 1),
(16, 'Anna', 'Knox', NULL, 'anna@vt.edu', 'Securepass1', NULL, 'female', NULL, NULL, 1),
(17, 'John', 'Leon', NULL, 'john@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 2),
(18, 'Kurt', 'Luther', NULL, 'kl@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 3),
(19, 'Daniel', 'Sanders', NULL, 'sanders@vt.edu', 'Securepass1', NULL, 'male', NULL, NULL, 2),
(20, 'Mary', 'Huang', NULL, 'huang@vt.edu', 'Securepass1', NULL, 'female', NULL, NULL, 2),
(23, 'Kurtfoo', 'Lutherbar', 'Here is a descriptionnn', 'kluther@vt.edu', 'TestTest124', NULL, 'male', 13, NULL, 1),
(24, 'Test', 'Testerrr', 'asdf', 'test@vt.edu', 'TestTest123', NULL, 'female', 2, 8, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `fk_answer_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answer_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`),
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`user_id1`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `event_ibfk_3` FOREIGN KEY (`user_id2`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `fk_question_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_topic2` FOREIGN KEY (`topic_id1`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_question_user1` FOREIGN KEY (`user_id1`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_topic1` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_topic2` FOREIGN KEY (`topic_id1`) REFERENCES `topic` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
