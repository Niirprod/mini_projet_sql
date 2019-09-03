# Database Boutique Chaussures
# ------------------------------------------------------------

CREATE DATABASE `shoes_shop` DEFAULT CHARACTER SET = `utf8`;
USE `shoes_shop`;


# Table marque
# ------------------------------------------------------------

CREATE TABLE `marque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Table modele
# ------------------------------------------------------------

CREATE TABLE `modele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Table chaussure
# ------------------------------------------------------------

CREATE TABLE `chaussure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prix` int(11) NOT NULL,
  `couleur` varchar(255) NOT NULL DEFAULT '',
  `pointure` int(11) NOT NULL,
  `marque_id` int(11) NOT NULL,
  `modele_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_marque` (`marque_id`),
  KEY `fk_modele` (`modele_id`),
  CONSTRAINT `fk_marque` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
  CONSTRAINT `fk_modele` FOREIGN KEY (`modele_id`) REFERENCES `modele` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# Table client
# ------------------------------------------------------------

CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `adresse mail` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




# Table commande
# ------------------------------------------------------------

CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse livraison` varchar(255) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client` (`client_id`),
  CONSTRAINT `fk_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





# Table commande_chaussure
# ------------------------------------------------------------

CREATE TABLE `commande_chaussure` (
  `commande_id` int(11) NOT NULL,
  `chaussure_id` int(11) NOT NULL,
  PRIMARY KEY (`commande_id`,`chaussure_id`),
  KEY `fk_commande_chaussure_chaussure_id` (`chaussure_id`),
  CONSTRAINT `fk_commande_chaussure_chaussure_id` FOREIGN KEY (`chaussure_id`) REFERENCES `chaussure` (`id`),
  CONSTRAINT `fk_commande_chaussure_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
