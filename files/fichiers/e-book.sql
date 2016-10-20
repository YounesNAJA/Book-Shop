-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 09 Janvier 2014 à 02:59
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `e-book`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) CHARACTER SET utf8 NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`, `slug`, `created`) VALUES
(1, 'Développement', 'Developpement', '2014-01-06');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `images`
--

INSERT INTO `images` (`id`, `url`) VALUES
(1, 'img/book/0764576429.jpg'),
(2, 'img/book/1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE IF NOT EXISTS `livres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `ISBN` varchar(255) NOT NULL,
  `created` date NOT NULL,
  `tags` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `version` int(20) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `livres`
--

INSERT INTO `livres` (`id`, `titre`, `ISBN`, `created`, `tags`, `slug`, `version`, `membre_id`, `categorie_id`, `image_id`, `description`) VALUES
(1, 'hfezufuie', 'feueui', '0000-00-00', '', 'hez fezoijoez fezoijfezfe', 0, 0, 0, 1, ''),
(2, 'ezfzefezfez', 'efezfez', '0000-00-00', '', '', 0, 0, 0, 2, '');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_n` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `membres`
--

INSERT INTO `membres` (`id`, `nom`, `prenom`, `date_n`, `email`, `role`, `password`, `sexe`, `created`, `image_id`) VALUES
(20, 'Hassan', 'Boutannoura', '2014-01-10', 'boutannoura1@gmail.com', 'membre', '1234567895', '', '2014-01-09 02:01:34', 1),
(21, 'Mutapha', 'zirari', '2014-01-11', 'goss-@hotmail.org', 'membre', '1234567895', '', '2014-01-09 02:04:22', 1),
(22, 'Youness', 'Naja', '2014-01-10', 'said_tobi55@hotmail.fr', 'membre', '1234567895', '', '2014-01-09 02:37:22', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
