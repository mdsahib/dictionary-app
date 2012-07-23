-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 23, 2012 at 12:20 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bangla_dictionary`
--

-- --------------------------------------------------------

--
-- Table structure for table `bangla_parts_of_speech`
--

CREATE TABLE IF NOT EXISTS `bangla_parts_of_speech` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bangla_parts_of_speech` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bangla_parts_of_speech_UNIQUE` (`bangla_parts_of_speech`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bangla_parts_of_speech`
--


-- --------------------------------------------------------

--
-- Table structure for table `bangla_words`
--

CREATE TABLE IF NOT EXISTS `bangla_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID of bangla words',
  `bangla_word` varchar(45) NOT NULL,
  `bangla_parts_of_speech_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bangla_word_UNIQUE` (`bangla_word`),
  KEY `bangla_words_fk_parts_of_speech` (`bangla_parts_of_speech_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='This table will store all the bangla words' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `bangla_words`
--


-- --------------------------------------------------------

--
-- Table structure for table `bangla_word_examples`
--

CREATE TABLE IF NOT EXISTS `bangla_word_examples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'bangla_word_examples id',
  `sentences` varchar(45) NOT NULL COMMENT 'this colum will store the sentences',
  `bangla_words_id` int(10) unsigned NOT NULL COMMENT 'it is a foreigh key from the table bagla_words',
  PRIMARY KEY (`id`),
  KEY `Index` (`bangla_words_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this will store relavant exapmle sentences of a bangla word\n' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bangla_word_examples`
--


-- --------------------------------------------------------

--
-- Table structure for table `english_parts_of_speechs`
--

CREATE TABLE IF NOT EXISTS `english_parts_of_speechs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Parts of speech id',
  `english_parts_of_speech` varchar(45) NOT NULL COMMENT 'Name of the parts of speech',
  PRIMARY KEY (`id`),
  UNIQUE KEY `parts_of_speech_UNIQUE` (`english_parts_of_speech`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='this table will store several parts of speech of bangla word' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `english_parts_of_speechs`
--

INSERT INTO `english_parts_of_speechs` (`id`, `english_parts_of_speech`) VALUES
(1, 'noun');

-- --------------------------------------------------------

--
-- Table structure for table `english_words`
--

CREATE TABLE IF NOT EXISTS `english_words` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID of english words',
  `english_word` varchar(45) NOT NULL COMMENT 'this column represents english word',
  `parts_of_speech_id` int(10) unsigned NOT NULL COMMENT 'this is a foreign key',
  PRIMARY KEY (`id`),
  UNIQUE KEY `english_word_UNIQUE` (`english_word`),
  KEY `english_words_fk_parts_of_speech` (`parts_of_speech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table wil store the english words' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `english_words`
--


-- --------------------------------------------------------

--
-- Table structure for table `english_word_expamles`
--

CREATE TABLE IF NOT EXISTS `english_word_expamles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `english_words_id` int(10) unsigned NOT NULL COMMENT 'this is a foreign key of english_words table',
  `sentence` varchar(300) NOT NULL COMMENT 'this column will store sentences',
  PRIMARY KEY (`id`),
  KEY `english_word_expamles_fk_english_word` (`english_words_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table will store example sentence of an english word' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `english_word_expamles`
--


-- --------------------------------------------------------

--
-- Table structure for table `meanings`
--

CREATE TABLE IF NOT EXISTS `meanings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bangla_words_id` int(10) unsigned NOT NULL COMMENT 'store the bangla words id which is a foreign id from bangla_words table',
  `english_words_id` int(10) unsigned NOT NULL COMMENT 'store the bangla words id which is a foreign id from english_words table',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bangla_words_id` (`bangla_words_id`,`english_words_id`),
  KEY `english_words_id` (`english_words_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table will store relationships between bangla and engli' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `meanings`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `bangla_words`
--
ALTER TABLE `bangla_words`
  ADD CONSTRAINT `bangla_words_fk_id` FOREIGN KEY (`bangla_parts_of_speech_id`) REFERENCES `bangla_parts_of_speech` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bangla_word_examples`
--
ALTER TABLE `bangla_word_examples`
  ADD CONSTRAINT `bangla_word_examples_ibfk_1` FOREIGN KEY (`bangla_words_id`) REFERENCES `bangla_words` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `english_words`
--
ALTER TABLE `english_words`
  ADD CONSTRAINT `english_words_fk_parts_of_speech` FOREIGN KEY (`parts_of_speech_id`) REFERENCES `english_parts_of_speechs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `english_word_expamles`
--
ALTER TABLE `english_word_expamles`
  ADD CONSTRAINT `english_word_expamles_ibfk_1` FOREIGN KEY (`english_words_id`) REFERENCES `english_words` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `meanings`
--
ALTER TABLE `meanings`
  ADD CONSTRAINT `meanings_ibfk_2` FOREIGN KEY (`bangla_words_id`) REFERENCES `bangla_words` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `meanings_ibfk_1` FOREIGN KEY (`english_words_id`) REFERENCES `english_words` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
