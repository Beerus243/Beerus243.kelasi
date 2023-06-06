-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 06 juin 2023 à 18:46
-- Version du serveur :  10.10.2-MariaDB
-- Version de PHP :  7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `kelasi`
--
CREATE DATABASE IF NOT EXISTS `kelasi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kelasi`;

-- --------------------------------------------------------

--
-- Structure de la table `application`
--

DROP TABLE IF EXISTS `application`;
CREATE TABLE IF NOT EXISTS `application` (
  `id_application` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) NOT NULL,
  `nom_application` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_installation` date NOT NULL,
  PRIMARY KEY (`id_application`),
  KEY `id_eleve` (`id_eleve`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `application`
--

INSERT INTO `application` (`id_application`, `id_eleve`, `nom_application`, `description`, `date_installation`) VALUES
(1, 1, 'Conduite', 'Bonne eleve il derange presque pas', '2023-06-05'),
(2, 2, 'Conduite', 'Bonne eleve il derange quasi pas', '2023-06-05'),
(3, 3, 'Conduite', 'Bonne eleve il derange pas vraiment', '2023-06-05');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cours` varchar(255) NOT NULL,
  `horaire_debut` time NOT NULL,
  `horaire_fin` time NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `coefficient_interro` float DEFAULT NULL,
  `coefficient_devoir` float DEFAULT NULL,
  `coefficient_examen` float DEFAULT NULL,
  `date_cours` date NOT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `id_enseignant` (`id_enseignant`),
  KEY `niveau_id` (`niveau_id`),
  KEY `option_id` (`option_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id_cours`, `nom_cours`, `horaire_debut`, `horaire_fin`, `id_enseignant`, `niveau_id`, `option_id`, `section_id`, `coefficient_interro`, `coefficient_devoir`, `coefficient_examen`, `date_cours`) VALUES
(1, 'Math', '09:00:00', '10:30:00', 1, 1, 1, 1, 0.3, 0.3, 0.4, '2023-06-06'),
(2, 'Francais', '10:45:00', '12:15:00', 2, 2, 2, 2, 0.2, 0.4, 0.4, '2023-06-06'),
(3, 'Comptabilité', '13:30:00', '15:00:00', 3, 3, 3, 3, 0.4, 0.3, 0.3, '2023-06-06'),
(4, 'Chimie', '15:15:00', '16:45:00', 4, 1, 1, 1, 0.3, 0.4, 0.3, '2023-06-06'),
(5, 'Philosophie', '09:00:00', '10:30:00', 5, 2, 2, 2, 0.4, 0.3, 0.3, '2023-06-06'),
(6, 'Statistique', '10:45:00', '12:15:00', 6, 3, 3, 3, 0.3, 0.3, 0.4, '2023-06-06'),
(7, 'Biologie', '13:30:00', '15:00:00', 7, 1, 1, 1, 0.4, 0.4, 0.2, '2023-06-06');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id_eleve` int(11) NOT NULL AUTO_INCREMENT,
  `matricule_el` varchar(255) NOT NULL,
  `nom_el` varchar(255) NOT NULL,
  `postnom_el` varchar(255) NOT NULL,
  `prenom_el` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `nationalite` varchar(255) NOT NULL,
  `lieu_de_naissance` varchar(255) NOT NULL,
  `nom_du_pere` varchar(255) NOT NULL,
  `nom_de_la_mere` varchar(255) NOT NULL,
  `contact_parent` varchar(255) NOT NULL,
  `contact_eleve` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `promotion_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `niveau` varchar(255) NOT NULL,
  PRIMARY KEY (`id_eleve`),
  UNIQUE KEY `email` (`email`),
  KEY `promotion_id` (`promotion_id`),
  KEY `option_id` (`option_id`),
  KEY `section_id` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id_eleve`, `matricule_el`, `nom_el`, `postnom_el`, `prenom_el`, `sexe`, `adresse`, `nationalite`, `lieu_de_naissance`, `nom_du_pere`, `nom_de_la_mere`, `contact_parent`, `contact_eleve`, `email`, `mot_de_passe`, `promotion_id`, `option_id`, `section_id`, `niveau`) VALUES
(1, 'E001', 'Élève 1', 'Postnom 1', 'Prénom 1', 'M', 'Adresse 1', 'Nationalité 1', 'Lieu de naissance 1', 'Père 1', 'Mère 1', 'Contact Parent 1', 'Contact Élève 1', 'eleve1@example.com', 'motdepasse1', 1, 1, 1, '5 eme'),
(2, 'E002', 'Élève 2', 'Postnom 2', 'Prénom 2', 'F', 'Adresse 2', 'Nationalité 2', 'Lieu de naissance 2', 'Père 2', 'Mère 2', 'Contact Parent 2', 'Contact Élève 2', 'eleve2@example.com', 'motdepasse2', 2, 2, 2, '6 eme'),
(3, 'E003', 'Élève 3', 'Postnom 3', 'Prénom 3', 'M', 'Adresse 3', 'Nationalité 3', 'Lieu de naissance 3', 'Père 3', 'Mère 3', 'Contact Parent 3', 'Contact Élève 3', 'eleve3@example.com', 'motdepasse3', 3, 3, 3, '4 eme');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

DROP TABLE IF EXISTS `enseignant`;
CREATE TABLE IF NOT EXISTS `enseignant` (
  `id_enseignant` int(11) NOT NULL AUTO_INCREMENT,
  `matricule_ens` varchar(255) NOT NULL,
  `nom_ens` varchar(255) NOT NULL,
  `postnom_ens` varchar(255) NOT NULL,
  `prenom_ens` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `lieu_de_naissance` varchar(255) NOT NULL,
  `nationalite` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  PRIMARY KEY (`id_enseignant`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_enseignant`, `matricule_ens`, `nom_ens`, `postnom_ens`, `prenom_ens`, `sexe`, `adresse`, `contact`, `lieu_de_naissance`, `nationalite`, `email`, `mot_de_passe`) VALUES
(1, 'ENS001', 'Fabrice', 'Marie', 'dupencheng', 'M', 'Adresse 1', 'Contact 1', 'Lieu de naissance 1', 'Nationalité 1', 'enseignant1@example.com', 'motdepasse1'),
(2, 'ENS002', 'Grace', 'Biyolo', 'Cristian', 'F', 'Adresse 2', 'Contact 2', 'Lieu de naissance 2', 'Nationalité 2', 'enseignant2@example.com', 'motdepasse2'),
(3, 'ENS003', 'Rhema', 'salani', 'Fabrice', 'M', 'Adresse 3', 'Contact 3', 'Lieu de naissance 3', 'Nationalité 3', 'enseignant3@example.com', 'motdepasse3'),
(4, 'ENS004', 'Denis', 'Postnom 4', 'Prénom 4', 'F', 'Adresse 4', 'Contact 4', 'Lieu de naissance 4', 'Nationalité 4', 'enseignant4@example.com', 'motdepasse4'),
(5, 'ENS005', 'Fiston', 'Postnom 5', 'Prénom 5', 'M', 'Adresse 5', 'Contact 5', 'Lieu de naissance 5', 'Nationalité 5', 'enseignant5@example.com', 'motdepasse5'),
(6, 'ENS006', 'Melissa', 'Postnom 6', 'Prénom 6', 'F', 'Adresse 6', 'Contact 6', 'Lieu de naissance 6', 'Nationalité 6', 'enseignant6@example.com', 'motdepasse6'),
(7, 'ENS007', 'Junior', 'Postnom 7', 'Prénom 7', 'M', 'Adresse 7', 'Contact 7', 'Lieu de naissance 7', 'Nationalité 7', 'enseignant7@example.com', 'motdepasse7');

-- --------------------------------------------------------

--
-- Structure de la table `niveau_etudes`
--

DROP TABLE IF EXISTS `niveau_etudes`;
CREATE TABLE IF NOT EXISTS `niveau_etudes` (
  `id_niveau` int(11) NOT NULL AUTO_INCREMENT,
  `nom_niveau` varchar(255) NOT NULL,
  PRIMARY KEY (`id_niveau`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `niveau_etudes`
--

INSERT INTO `niveau_etudes` (`id_niveau`, `nom_niveau`) VALUES
(1, '4 eme'),
(2, '5 eme'),
(3, '6 eme');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) DEFAULT NULL,
  `id_cours` int(11) DEFAULT NULL,
  `note_interrogation` float DEFAULT NULL,
  `note_devoir` float DEFAULT NULL,
  `note_examen` float DEFAULT NULL,
  `coefficient` int(11) DEFAULT NULL,
  `type_evaluation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_note`),
  KEY `id_eleve` (`id_eleve`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `id_eleve`, `id_cours`, `note_interrogation`, `note_devoir`, `note_examen`, `coefficient`, `type_evaluation`) VALUES
(1, 1, 1, 15, 16, 14, 1, 'Interrogation'),
(2, 1, 2, 18, 17, 16, 1, 'Interrogation'),
(3, 1, 3, 14, 15, 16, 1, 'Interrogation'),
(4, 2, 1, 16, 18, 15, 1, 'Interrogation'),
(5, 2, 2, 17, 15, 16, 1, 'Interrogation'),
(6, 2, 3, 15, 16, 14, 1, 'Interrogation'),
(7, 3, 1, 18, 17, 16, 1, 'Interrogation'),
(8, 3, 2, 15, 14, 15, 1, 'Interrogation'),
(9, 3, 3, 16, 18, 17, 1, 'Interrogation');

-- --------------------------------------------------------

--
-- Structure de la table `option`
--

DROP TABLE IF EXISTS `option`;
CREATE TABLE IF NOT EXISTS `option` (
  `id_option` int(11) NOT NULL AUTO_INCREMENT,
  `nom_option` varchar(255) NOT NULL,
  `duree_option` int(11) NOT NULL,
  PRIMARY KEY (`id_option`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `option`
--

INSERT INTO `option` (`id_option`, `nom_option`, `duree_option`) VALUES
(1, 'Scientifique', 3),
(2, 'Litteraire', 4),
(3, 'Comptabilité', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pourcentages`
--

DROP TABLE IF EXISTS `pourcentages`;
CREATE TABLE IF NOT EXISTS `pourcentages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eleve_id` int(11) DEFAULT NULL,
  `cours_id` int(11) DEFAULT NULL,
  `pourcentage` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eleve_id` (`eleve_id`),
  KEY `cours_id` (`cours_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `presence`
--

DROP TABLE IF EXISTS `presence`;
CREATE TABLE IF NOT EXISTS `presence` (
  `id_presence` int(11) NOT NULL AUTO_INCREMENT,
  `id_eleve` int(11) NOT NULL,
  `id_cours` int(11) NOT NULL,
  `date_presence` date NOT NULL,
  `heure_arrivee` time NOT NULL,
  PRIMARY KEY (`id_presence`),
  KEY `id_eleve` (`id_eleve`),
  KEY `id_cours` (`id_cours`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `presence`
--

INSERT INTO `presence` (`id_presence`, `id_eleve`, `id_cours`, `date_presence`, `heure_arrivee`) VALUES
(1, 1, 1, '2023-05-01', '09:00:00'),
(2, 1, 2, '2023-05-02', '10:45:00'),
(3, 1, 3, '2023-05-03', '13:30:00'),
(4, 2, 1, '2023-05-01', '09:00:00'),
(5, 2, 2, '2023-05-02', '10:45:00'),
(6, 2, 3, '2023-05-03', '13:30:00'),
(7, 3, 1, '2023-05-01', '09:00:00'),
(8, 3, 2, '2023-05-02', '10:45:00'),
(9, 3, 3, '2023-05-03', '13:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id_promotion` int(11) NOT NULL AUTO_INCREMENT,
  `nom_promotion` varchar(255) NOT NULL,
  `niveau_id` int(11) NOT NULL,
  `annee_scolaire` varchar(255) NOT NULL,
  PRIMARY KEY (`id_promotion`),
  KEY `niveau_id` (`niveau_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id_promotion`, `nom_promotion`, `niveau_id`, `annee_scolaire`) VALUES
(1, 'Promotion 2021-2022', 1, '2021-2022'),
(2, 'Promotion 2022-2023', 2, '2022-2023'),
(3, 'Promotion 2023-2024', 3, '2023-2024');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

DROP TABLE IF EXISTS `section`;
CREATE TABLE IF NOT EXISTS `section` (
  `id_section` int(11) NOT NULL AUTO_INCREMENT,
  `nom_section` varchar(255) NOT NULL,
  `enseignant_responsable` varchar(255) NOT NULL,
  PRIMARY KEY (`id_section`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `section`
--

INSERT INTO `section` (`id_section`, `nom_section`, `enseignant_responsable`) VALUES
(1, 'Biochimie', 'Enseignant A'),
(2, 'Latin Philo', 'Enseignant B'),
(3, 'Comptabilité', 'Enseignant C');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`niveau_id`) REFERENCES `niveau_etudes` (`id_niveau`),
  ADD CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `option` (`id_option`),
  ADD CONSTRAINT `cours_ibfk_4` FOREIGN KEY (`section_id`) REFERENCES `section` (`id_section`);

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id_promotion`),
  ADD CONSTRAINT `eleve_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`id_option`),
  ADD CONSTRAINT `eleve_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `section` (`id_section`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `pourcentages`
--
ALTER TABLE `pourcentages`
  ADD CONSTRAINT `pourcentages_ibfk_1` FOREIGN KEY (`eleve_id`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `pourcentages_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `presence`
--
ALTER TABLE `presence`
  ADD CONSTRAINT `presence_ibfk_1` FOREIGN KEY (`id_eleve`) REFERENCES `eleve` (`id_eleve`),
  ADD CONSTRAINT `presence_ibfk_2` FOREIGN KEY (`id_cours`) REFERENCES `cours` (`id_cours`);

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`niveau_id`) REFERENCES `niveau_etudes` (`id_niveau`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
