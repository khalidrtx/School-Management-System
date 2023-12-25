-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 05:52 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pfe2019`
--

-- --------------------------------------------------------

--
-- Table structure for table `absenceetudiant`
--

CREATE TABLE `absenceetudiant` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `SeanceID` int(11) NOT NULL,
  `Justification` tinyint(1) DEFAULT NULL,
  `Motif` varchar(255) DEFAULT NULL,
  `DocJustifAbsEtudiantID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absencepersonnel`
--

CREATE TABLE `absencepersonnel` (
  `ID` int(11) NOT NULL,
  `DocJustifAbsPersonnelID` int(11) DEFAULT NULL,
  `PersonnelUtilisateurID` int(11) NOT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Duree` smallint(6) DEFAULT NULL,
  `DateReprise` date DEFAULT NULL,
  `Motif` varchar(255) DEFAULT NULL,
  `Justification` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `absenceprofesseur`
--

CREATE TABLE `absenceprofesseur` (
  `ID` int(11) NOT NULL,
  `DocJustifAbsPersonnelID` int(11) DEFAULT NULL,
  `Justification` tinyint(1) DEFAULT NULL,
  `Motif` varchar(255) DEFAULT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `SeanceID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `acrivitepedagogique`
--

CREATE TABLE `acrivitepedagogique` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `acrivitepedagogique`
--

INSERT INTO `acrivitepedagogique` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'activite1', 'devoir', 'واجب'),
(2, 'activite122', 'TP', NULL),
(3, 'activite4534', 'test rapide', NULL),
(4, 'activite123', 'cours', 'حصة');

-- --------------------------------------------------------

--
-- Table structure for table `actualite`
--

CREATE TABLE `actualite` (
  `ID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Objet` varchar(255) DEFAULT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Priorite` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `DateExpiritation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `anneescolaire`
--

CREATE TABLE `anneescolaire` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `anneescolaire`
--

INSERT INTO `anneescolaire` (`ID`, `Code`, `DateDebut`, `DateFin`) VALUES
(1, '2017/2018', '2017-09-05', '2018-06-29'),
(2, '2018/2019', '2018-09-04', '2019-06-28'),
(3, '2019/2020', '2019-09-04', '2020-06-30'),
(4, '2020/2021', '2020-09-03', '2020-06-30'),
(5, '2021/2022', '2021-09-05', '2022-06-29'),
(6, '2022/2023', '2022-09-05', '2023-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `anneescolairecourante`
--

CREATE TABLE `anneescolairecourante` (
  `ID` int(11) NOT NULL,
  `AnneeScolaireID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `anneescolairecourante`
--

INSERT INTO `anneescolairecourante` (`ID`, `AnneeScolaireID`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `annonce`
--

CREATE TABLE `annonce` (
  `ID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Objet` varchar(255) DEFAULT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Priorite` varchar(255) DEFAULT NULL,
  `DateExpiration` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annonce_classe`
--

CREATE TABLE `annonce_classe` (
  `AnnonceID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avancementpersonnel`
--

CREATE TABLE `avancementpersonnel` (
  `ID` int(11) NOT NULL,
  `PersonnelUtilisateurID` int(11) DEFAULT NULL,
  `Echelle` varchar(255) DEFAULT NULL,
  `Echelon` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avancementtache`
--

CREATE TABLE `avancementtache` (
  `ID` int(11) NOT NULL,
  `TacheID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `TempsPasse` smallint(6) DEFAULT NULL,
  `TempsRestant` smallint(6) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `avertissement`
--

CREATE TABLE `avertissement` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Objet` varchar(255) DEFAULT NULL,
  `Desciption` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bloc`
--

CREATE TABLE `bloc` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `bloc`
--

INSERT INTO `bloc` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'B', 'bloc B', 'الجناح ب'),
(2, 'A', 'bloc A', 'الجناح أ'),
(3, 'C', 'bloc C', 'الجناح س'),
(4, 'D', 'bloc D', 'الجناح د');

-- --------------------------------------------------------

--
-- Table structure for table `cadre`
--

CREATE TABLE `cadre` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cadre`
--

INSERT INTO `cadre` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, '01', 'Professeurs de l\'enseignement primaire', 'أستاذ التعليم الابتدائي'),
(2, '02', 'Professeurs de l\'enseignement secondaire collégial', 'أستاذ التعليم الثانوي الإعدادي'),
(3, '03', 'Professeurs de l\'enseignement secondaire qualifiant', 'أستاذ التعليم الثانوي التأهيلي'),
(4, '04', 'Professeurs agrégés de l\'enseignement secondaire qualifiant', 'أستاذ مبرز للتعليم الثانوي التأهيلي'),
(5, '05', 'Intendant', 'ممون'),
(6, '52', 'Attaché pédagogique', 'ملحق تربوي'),
(7, '53', 'Attaché économique et administratif', 'ملحق الادارة والاقتصاد'),
(8, '54', 'Adjoint technique', 'مساعد تقني'),
(9, '66', 'Employé de bureau', 'كاتب');

-- --------------------------------------------------------

--
-- Table structure for table `cahierchargeprojet`
--

CREATE TABLE `cahierchargeprojet` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cahiertexte`
--

CREATE TABLE `cahiertexte` (
  `ID` int(11) NOT NULL,
  `SeanceID` int(11) NOT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cahiertexte`
--

INSERT INTO `cahiertexte` (`ID`, `SeanceID`, `Texte`, `Observation`, `Etat`) VALUES
(1, 1, 'java client/serveur', 'test', 'faite'),
(2, 2, 'sql server/basse donnee', 'test', 'annuler'),
(3, 2, 'communication avec une serveur utilisant le protocole UDP ', 'bien', 'test'),
(4, 3, 'rftgyhuji', 'ftghj', 'passe'),
(5, 4, 'rftgyhuj', 'frgbhj', 'passe'),
(6, 5, 'khalid', 'rien', 'passe'),
(7, 6, 'Requêtes SQL pour récupérer, insérer, mettre à jour et supprimer des données', 'rien', 'passe'),
(8, 7, 'Protocoles de communication basés sur TCP (ex : TCP/IP, HTTP)', 'rien', 'passe');

-- --------------------------------------------------------

--
-- Table structure for table `cahiertexte_acrivitepedagogique`
--

CREATE TABLE `cahiertexte_acrivitepedagogique` (
  `CahierTexteID` int(11) NOT NULL,
  `AcrivitePedagogiqueID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cahiertexte_acrivitepedagogique`
--

INSERT INTO `cahiertexte_acrivitepedagogique` (`CahierTexteID`, `AcrivitePedagogiqueID`) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 2),
(3, 3),
(4, 1),
(5, 1),
(6, 1),
(7, 4),
(8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cahiertexte_concept`
--

CREATE TABLE `cahiertexte_concept` (
  `CahierTexteID` int(11) NOT NULL,
  `ConceptID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cahiertexte_concept`
--

INSERT INTO `cahiertexte_concept` (`CahierTexteID`, `ConceptID`) VALUES
(4, 7),
(5, 26),
(6, 18),
(7, 44),
(8, 32);

-- --------------------------------------------------------

--
-- Table structure for table `caracteristique`
--

CREATE TABLE `caracteristique` (
  `ID` int(11) NOT NULL,
  `MaterielID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Caracteristique` varchar(255) DEFAULT NULL,
  `Valeur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapitre`
--

CREATE TABLE `chapitre` (
  `ID` int(11) NOT NULL,
  `MatiereID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `chapitre`
--

INSERT INTO `chapitre` (`ID`, `MatiereID`, `ModuleID`, `Nom`, `Description`) VALUES
(20, 8, 18, 'Introduction au développement web', 'estt						    '),
(23, 8, 18, 'HTML (Hypertext Markup Language)', NULL),
(24, 8, 18, 'CSS (Cascading Style Sheets)', NULL),
(25, 8, 18, 'JavaScript', NULL),
(26, 9, 6, 'Modélisation des données', NULL),
(27, 9, 6, 'Gestion de projet', NULL),
(28, 9, 6, 'Analyse des besoins', NULL),
(29, 9, 17, 'Introduction au multimédia', NULL),
(30, 9, 17, 'Graphisme et design', NULL),
(31, 9, 17, 'Vidéo et animation', NULL),
(32, 8, 19, 'Introduction', NULL),
(33, 8, 19, 'Communication client/serveur ', NULL),
(34, 8, 19, 'Développement côté client en Java ', NULL),
(35, 9, 7, 'Introduction', NULL),
(36, 9, 7, ' Conception de bases de données relationnelles', NULL),
(37, 9, 7, 'Langage SQL', NULL),
(38, 9, 7, ' Contraintes et intégrité des données', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `classe`
--

CREATE TABLE `classe` (
  `ID` int(11) NOT NULL,
  `ClasseGeneriqueID` int(11) NOT NULL,
  `AnneeScolaireID` int(11) NOT NULL,
  `Label` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classe`
--

INSERT INTO `classe` (`ID`, `ClasseGeneriqueID`, `AnneeScolaireID`, `Label`) VALUES
(1, 1, 6, 'A'),
(2, 2, 6, 'A'),
(3, 5, 6, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `classegenerique`
--

CREATE TABLE `classegenerique` (
  `ID` int(11) NOT NULL,
  `NiveauID` int(11) NOT NULL,
  `FiliereID` int(11) NOT NULL,
  `CycleID` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classegenerique`
--

INSERT INTO `classegenerique` (`ID`, `NiveauID`, `FiliereID`, `CycleID`, `Description`) VALUES
(1, 1, 1, 2, '								    '),
(2, 2, 1, 2, '								    '),
(3, 1, 2, 2, '								    '),
(4, 2, 2, 2, '								    '),
(5, 1, 3, 2, '								    '),
(6, 2, 3, 2, '								    '),
(7, 1, 4, 2, '								    '),
(8, 2, 4, 2, '								    '),
(9, 1, 5, 2, '								    '),
(10, 1, 6, 2, '								    ');

-- --------------------------------------------------------

--
-- Table structure for table `classegunite`
--

CREATE TABLE `classegunite` (
  `ID` int(11) NOT NULL,
  `ClasseGeneriqueID` int(11) NOT NULL,
  `UniteID` int(11) NOT NULL,
  `NoteEliminatoire` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classegunite`
--

INSERT INTO `classegunite` (`ID`, `ClasseGeneriqueID`, `UniteID`, `NoteEliminatoire`) VALUES
(1, 1, 1, 10),
(2, 1, 2, 10),
(3, 1, 3, 10),
(4, 2, 1, 10),
(5, 2, 2, 10),
(6, 2, 3, 10),
(7, 5, 1, 10),
(8, 7, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `classe_demandephotocopie`
--

CREATE TABLE `classe_demandephotocopie` (
  `ClasseID` int(11) NOT NULL,
  `DemandePhotocopieID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commentaire`
--

CREATE TABLE `commentaire` (
  `ID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `PublicationID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compte`
--

CREATE TABLE `compte` (
  `ID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL,
  `UtilisateurID` int(11) DEFAULT NULL,
  `Login` varchar(255) DEFAULT NULL,
  `MotPass` varchar(255) DEFAULT NULL,
  `DateCreation` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `OnLine` tinyint(1) NOT NULL,
  `Statut` varchar(255) DEFAULT NULL,
  `CodeRecuperation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `compte`
--

INSERT INTO `compte` (`ID`, `RoleID`, `UtilisateurID`, `Login`, `MotPass`, `DateCreation`, `Etat`, `OnLine`, `Statut`, `CodeRecuperation`) VALUES
(1, 1, 1, 'anoiarazo2@gmail.com', 'AZOULAY', '2020-06-05', 'Active', 0, 'HorsLigne', NULL),
(3, 1, 3, 'melhamdaoui888@gmail.com', 'EL HAMDAOUI', '2020-06-05', 'Active', 0, 'HorsLigne', NULL),
(5, 1, 5, 'abdellah_zmarou@outlook.fr', 'ZMARROU', '2020-06-05', 'Active', 0, 'HorsLigne', NULL),
(6, 2, 6, 'khalid@gmail.com', 'khalid', '2020-06-05', 'Active', 0, 'HorsLigne', NULL),
(7, 6, 7, 'oussama@gmail.com', 'oussama', '2020-06-06', 'Active', 0, 'HorsLigne', NULL),
(9, 3, 9, 'chabbi@gmail.com', 'CHABBI', '2020-06-08', 'Active', 0, 'HorsLigne', NULL),
(10, 2, 10, 'bouaabid@gmail.com', 'bouaabid', '2023-01-19', 'Active', 0, 'HorsLigne', NULL),
(11, 2, 11, 'hamid@gmail.com', 'hamid', '2023-01-19', 'Active', 0, 'HorsLigne', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `concept`
--

CREATE TABLE `concept` (
  `ID` int(11) NOT NULL,
  `ChapitreID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `concept`
--

INSERT INTO `concept` (`ID`, `ChapitreID`, `Nom`, `Description`) VALUES
(1, 20, 'Concepts de base du web', NULL),
(2, 20, 'Architecture client-serveur', NULL),
(3, 20, 'Les langages du web (HTML, CSS, JavaScript)', NULL),
(4, 23, 'Structure de base d\'un document HTML', NULL),
(5, 23, 'Formulaires HTML et saisie de données', NULL),
(6, 23, 'Balises HTML courantes (titres, paragraphes, liens, images..)', NULL),
(7, 24, 'Introduction aux styles CSS', NULL),
(8, 24, 'Sélecteurs CSS', NULL),
(9, 24, 'Propriétés de style courantes (couleurs, polices, marges, etc.)', NULL),
(10, 25, 'Introduction à JavaScript', NULL),
(11, 25, 'Variables, types de données et opérateurs', NULL),
(12, 26, 'Modélisation conceptuelle des données ', NULL),
(13, 26, 'Normalisation des données', NULL),
(14, 26, 'Conception de schémas de bases de données relationnelles', NULL),
(15, 27, 'Méthodologies de gestion de projet\r\n', NULL),
(16, 27, 'Planification et suivi du projet', NULL),
(17, 27, 'Gestion des risques et résolution des problèmes', NULL),
(18, 28, 'Collecte des besoins des utilisateurs et des parties prenantes\r\n', NULL),
(19, 28, 'Modélisation des processus métier (diagrammes de flux, diagrammes de cas d\'utilisation)', NULL),
(20, 29, 'Définition du multimédia', NULL),
(21, 29, 'Types de médias', NULL),
(22, 29, 'Principes de base de l\'interactivité', NULL),
(23, 30, 'Principes de design', NULL),
(24, 30, 'Outils de conception graphique', NULL),
(25, 30, 'Formats d\'images et optimisation pour le web', NULL),
(26, 31, 'Formats vidéo (MP4, AVI)', NULL),
(27, 31, 'Montage vidéo et effets spéciaux\r\n', NULL),
(28, 31, 'Création d\'animations (2D, 3D)', NULL),
(29, 32, 'Architecture client/serveur et ses avantages\r\n', NULL),
(30, 32, 'Communication entre le client et le serveur\r\n', NULL),
(31, 32, 'Protocoles de communication ', NULL),
(32, 33, 'Utilisation des sockets pour la communication TCP/IP\r\n', NULL),
(33, 33, 'Protocoles de communication basés sur TCP', NULL),
(34, 33, 'Mise en place de connexions client/serveur en Java\r\n', NULL),
(35, 34, 'Utilisation des bibliothèques et frameworks (Swing)', NULL),
(36, 34, 'Conception de l\'interface utilisateur en Java\r\n', NULL),
(37, 34, 'Manipulation des événements utilisateur en Java\r\n', NULL),
(38, 35, 'Concepts de base des bases de données relationnelles\r\n', NULL),
(39, 35, 'Modèle relationnel et ses composants (tables, colonnes, clés)\r\n', NULL),
(40, 35, 'Langage de requête SQL (Structured Query Language)\r\n', NULL),
(41, 36, 'Modélisation conceptuelle des données ', NULL),
(42, 36, 'Modélisation logique des données ', NULL),
(43, 36, 'Normalisation des données', NULL),
(44, 37, 'Requêtes SQL \'CRUD\'', NULL),
(45, 37, 'Jointures de tables pour combiner des données de différentes tables\r\n', NULL),
(46, 37, 'Agrégation de données ', NULL),
(47, 38, 'Types de contraintes', NULL),
(48, 38, 'Gestion de l\'intégrité référentielle', NULL),
(49, 38, 'Transactions et gestion de la concurrence\r\n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configurationmatiere`
--

CREATE TABLE `configurationmatiere` (
  `ID` int(11) NOT NULL,
  `ClasseGUniteID` int(11) NOT NULL,
  `MatiereID` int(11) NOT NULL,
  `FormeEvaluationID` int(11) NOT NULL,
  `PeriodeID` int(11) NOT NULL,
  `VolumeHoraire` smallint(6) DEFAULT NULL,
  `HoraireS1` smallint(6) DEFAULT NULL,
  `HoraireS2` smallint(6) DEFAULT NULL,
  `NbreControles` smallint(6) DEFAULT NULL,
  `NoteEliminatoire` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `configurationmatiere`
--

INSERT INTO `configurationmatiere` (`ID`, `ClasseGUniteID`, `MatiereID`, `FormeEvaluationID`, `PeriodeID`, `VolumeHoraire`, `HoraireS1`, `HoraireS2`, `NbreControles`, `NoteEliminatoire`) VALUES
(1, 1, 1, 4, 1, 100, 2, 2, 3, 10),
(2, 1, 2, 4, 1, 100, 2, 2, 3, 10),
(3, 1, 3, 4, 1, 100, 2, 2, 3, 10),
(4, 1, 4, 4, 1, 100, 2, 2, 3, 10),
(5, 2, 5, 1, 1, 56, 2, 2, 3, 10),
(6, 2, 6, 1, 1, 200, 4, 4, 3, 10),
(7, 2, 7, 5, 1, 0, 0, 0, 3, 10),
(8, 2, 8, 5, 1, 0, 0, 0, 3, 10),
(9, 3, 9, 5, 1, 0, 0, 0, 3, 10),
(10, 4, 1, 4, 1, 100, 2, 2, 3, 10),
(11, 4, 2, 4, 1, 100, 2, 2, 3, 10),
(12, 4, 3, 4, 1, 100, 2, 2, 3, 10),
(13, 4, 4, 4, 1, 100, 2, 2, 3, 10),
(14, 5, 6, 1, 1, 200, 4, 4, 3, 10),
(15, 5, 8, 5, 1, 0, 0, 0, 3, 10),
(16, 6, 9, 5, 1, 0, 0, 0, 0, 10),
(17, 6, 11, 3, 1, 88, 4, 4, 0, 10),
(18, 6, 10, 3, 3, 0, 0, 0, 0, 10),
(19, 7, 1, 1, 1, 60, 30, 30, 4, 10),
(20, 8, 1, 1, 1, 60, 30, 30, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `configurationmodule`
--

CREATE TABLE `configurationmodule` (
  `ID` int(11) NOT NULL,
  `ConfigurationMatiereID` int(11) NOT NULL,
  `ModuleID` int(11) NOT NULL,
  `PeriodeID` int(11) NOT NULL,
  `FormeEvaluationID` int(11) NOT NULL,
  `VolumeHoraire` smallint(6) DEFAULT NULL,
  `HoraireS1` smallint(6) DEFAULT NULL,
  `HoraireS2` smallint(6) DEFAULT NULL,
  `NbreControles` smallint(6) DEFAULT NULL,
  `NoteEliminatoire` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `configurationmodule`
--

INSERT INTO `configurationmodule` (`ID`, `ConfigurationMatiereID`, `ModuleID`, `PeriodeID`, `FormeEvaluationID`, `VolumeHoraire`, `HoraireS1`, `HoraireS2`, `NbreControles`, `NoteEliminatoire`) VALUES
(1, 7, 1, 2, 5, 28, 2, 0, 2, 6),
(2, 7, 2, 2, 4, 28, 2, 0, 2, 6),
(3, 7, 3, 3, 5, 56, 0, 4, 3, 6),
(4, 7, 4, 1, 5, 56, 2, 2, 3, 6),
(5, 7, 5, 1, 5, 56, 2, 2, 3, 6),
(6, 9, 6, 2, 5, 28, 2, 0, 2, 6),
(7, 9, 7, 3, 5, 56, 0, 4, 2, 6),
(8, 8, 13, 1, 5, 56, 2, 2, 3, 6),
(9, 8, 14, 1, 5, 56, 2, 2, 3, 6),
(10, 8, 16, 1, 5, 100, 2, 2, 3, 6),
(11, 8, 17, 2, 5, 28, 2, 0, 2, 6),
(12, 8, 18, 3, 5, 72, 0, 2, 2, 6),
(13, 15, 15, 1, 5, 88, 4, 4, 3, 10),
(14, 15, 16, 1, 5, 100, 2, 2, 3, 6),
(15, 15, 19, 1, 5, 44, 2, 2, 2, 6),
(16, 15, 18, 1, 5, 72, 2, 2, 3, 6),
(17, 16, 8, 1, 5, 44, 2, 2, 2, 6),
(18, 16, 9, 1, 5, 28, 2, 0, 2, 6),
(19, 16, 10, 3, 5, 16, 0, 2, 2, 6),
(20, 16, 11, 2, 5, 28, 2, 0, 2, 6),
(21, 16, 12, 3, 5, 16, 0, 2, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `UtilisateurID2` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `controle`
--

CREATE TABLE `controle` (
  `ID` int(11) NOT NULL,
  `Comptabilise` tinyint(1) DEFAULT NULL,
  `MatiereID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `DateDepotNotes` date DEFAULT NULL,
  `DatePassage` date DEFAULT NULL,
  `DatePlanifiee` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Duree` smallint(6) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `ClasseID` int(11) NOT NULL,
  `SalleID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `DocumentEvaluationID` int(11) DEFAULT NULL,
  `DocumentEvaluationID2` int(11) DEFAULT NULL,
  `FormeEvaluationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coordination`
--

CREATE TABLE `coordination` (
  `ID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `AnneeScolaireID` int(11) NOT NULL,
  `FiliereID` int(11) NOT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `couverturelivre`
--

CREATE TABLE `couverturelivre` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cycle`
--

CREATE TABLE `cycle` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cycle`
--

INSERT INTO `cycle` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'CSQ', 'Secondaire Qualifiant', 'الثانوي التأهيلي'),
(2, 'BTS', 'Brevet de Technicien Supérieur', 'شهادة التقني العالي');

-- --------------------------------------------------------

--
-- Table structure for table `demandedocetudiant`
--

CREATE TABLE `demandedocetudiant` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `TypeDocumentEtudiantID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `DateRetrait` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demandedocpersonnel`
--

CREATE TABLE `demandedocpersonnel` (
  `ID` int(11) NOT NULL,
  `PersonnelUtilisateurID` int(11) NOT NULL,
  `TypeDocumentPersonnelID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `DateRetrait` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demandephotocopie`
--

CREATE TABLE `demandephotocopie` (
  `ID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `MatiereID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `TypeDocumentID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `DatePrevue` date DEFAULT NULL,
  `DateRetrait` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diplome`
--

CREATE TABLE `diplome` (
  `ID` int(11) NOT NULL,
  `TypeDiplomeID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `diplome`
--

INSERT INTO `diplome` (`ID`, `TypeDiplomeID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 1, '1', NULL, 'ش.الدروس الإبتدائية'),
(2, 1, '2', NULL, 'ش.التعليم الثانوي'),
(3, 1, '3', NULL, 'البكالوريا أو ما يعادلها'),
(4, 1, '40', NULL, 'د.السلك الأول من الإجازة أو ما يعادلها '),
(5, 1, '41', NULL, 'الإجازة أو ما يعادلها'),
(6, 1, '42', NULL, 'د.الدراسات المعمقة'),
(7, 1, '43', NULL, 'ماستر'),
(8, 1, '44', NULL, 'دكتوراه'),
(9, 1, '80', NULL, 'شهادات أخرى'),
(10, 2, '1', NULL, 'ش.الأهلية التربوية'),
(11, 2, '3', NULL, 'ش.الدروس العادية'),
(12, 2, '20', NULL, 'ش.الأهلية التربوية المهنية'),
(13, 2, '21', NULL, 'امتحان التخرج من المركز التربوي الجهوي'),
(14, 2, '22', NULL, 'د.المدرسة العليا للأساتــــذة'),
(15, 2, '23', NULL, 'د.كلية علوم التربية'),
(16, 2, '24', NULL, 'إمتحان التخرج من السلك  الخاص بالمغرب'),
(17, 2, '25', NULL, 'إمتحان التخرج من السلك  الخاص بالخارج'),
(18, 2, '26', NULL, 'ش.الأهلية التربوية للتعليم الثانوي ( سلك 1)'),
(19, 2, '27', NULL, 'ش.الأهلية التربوية للتعليم الثانوي ( سلك 2)'),
(20, 2, '28', NULL, 'شهادات أخرى');

-- --------------------------------------------------------

--
-- Table structure for table `diplomepersonnel`
--

CREATE TABLE `diplomepersonnel` (
  `ID` int(11) NOT NULL,
  `SpecialiteID` int(11) NOT NULL,
  `Annee` varchar(255) DEFAULT NULL,
  `Etablissement` varchar(255) DEFAULT NULL,
  `DiplomeID` int(11) NOT NULL,
  `PersonnelUtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discipline`
--

CREATE TABLE `discipline` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docjustifabsetudiant`
--

CREATE TABLE `docjustifabsetudiant` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `DateDepot` date DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docjustifabspersonnel`
--

CREATE TABLE `docjustifabspersonnel` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL,
  `DateDepot` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentactualite`
--

CREATE TABLE `documentactualite` (
  `ID` int(11) NOT NULL,
  `ActualiteID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentannonce`
--

CREATE TABLE `documentannonce` (
  `ID` int(11) NOT NULL,
  `AnnonceID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentevaluation`
--

CREATE TABLE `documentevaluation` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentmateriel`
--

CREATE TABLE `documentmateriel` (
  `ID` int(11) NOT NULL,
  `MaterielID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentmessage`
--

CREATE TABLE `documentmessage` (
  `ID` int(11) NOT NULL,
  `MessageID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentphotocopie`
--

CREATE TABLE `documentphotocopie` (
  `ID` int(11) NOT NULL,
  `DemandePhotocopieID` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documentpublication`
--

CREATE TABLE `documentpublication` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `domainelivre`
--

CREATE TABLE `domainelivre` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empruntbibliotheque`
--

CREATE TABLE `empruntbibliotheque` (
  `ID` int(11) NOT NULL,
  `DateEmprunt` date DEFAULT NULL,
  `DateRetour` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `ExemplaireLivreID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empruntmateriel`
--

CREATE TABLE `empruntmateriel` (
  `ID` int(11) NOT NULL,
  `DateEmprunt` date DEFAULT NULL,
  `DateRetour` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `ExemplaireMaterielID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encadrantstage`
--

CREATE TABLE `encadrantstage` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `Fonction` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engagement`
--

CREATE TABLE `engagement` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Objet` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `etablissement`
--

CREATE TABLE `etablissement` (
  `ID` int(11) NOT NULL,
  `ProvinceID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Adresse_Fr` varchar(255) DEFAULT NULL,
  `Adresse_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `etablissement`
--

INSERT INTO `etablissement` (`ID`, `ProvinceID`, `Code`, `Nom_Fr`, `Nom_Ar`, `Telephone`, `Email`, `Adresse_Fr`, `Adresse_Ar`) VALUES
(1, 4, 'IDRISS PREMIER', 'Lycee IDRISS PREMIER', NULL, '0537-36-55-98 ', '', 'AVENUE MOHAMMED V KENITRA - Kenitra ', NULL),
(2, 4, 'IBNOU AL HAYTAM', 'Lycée IBNOU AL HAYTAM', NULL, '0661759718', NULL, 'OULED OUJIH KENITRA - KENITRA ', NULL),
(3, 4, 'ABD ERRAHMAN ENNACER ', 'Lycee ABD ERRAHMAN ENNACER ', NULL, '0537-37-00-25 ', NULL, 'AVENUE HOUMMANE ALFATOUAKI KENITRA - Kenitra ', NULL),
(4, 4, 'ABD ALMALEK ASSAADI', 'Lycee ABD ALMALEK ASSAADI', NULL, ' 0537-37-99-16  ', NULL, 'RUE SEBOU KENITRA - Kenitra ', NULL),
(5, 4, 'MILITAIRE ROYAL', 'Lycee MILITAIRE ROYAL', NULL, '0537371121', NULL, 'TROISIEME BASE AERIENNE KENITRA - Kenitra', NULL),
(6, 4, 'IBN SINA', 'Lycee TECHNIQUE IBN SINA', NULL, NULL, NULL, 'AVENUE CHAKIB ARSSALANE - Kenitra', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant`
--

CREATE TABLE `etudiant` (
  `UtilisateurID` int(11) NOT NULL,
  `EtablissementID` int(11) DEFAULT NULL,
  `FiliereID` int(11) DEFAULT NULL,
  `Cne` varchar(255) DEFAULT NULL,
  `NumInscription` varchar(255) DEFAULT NULL,
  `AnneeBac` varchar(255) DEFAULT NULL,
  `OptionBacID` int(11) DEFAULT NULL,
  `MoyenneBac` float DEFAULT NULL,
  `MentionID` int(11) DEFAULT NULL,
  `Candidat` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `ParentUtilisateurID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `etudiant`
--

INSERT INTO `etudiant` (`UtilisateurID`, `EtablissementID`, `FiliereID`, `Cne`, `NumInscription`, `AnneeBac`, `OptionBacID`, `MoyenneBac`, `MentionID`, `Candidat`, `Etat`, `ParentUtilisateurID`) VALUES
(1, 6, 1, 'E142031431', '29/18', '2018', 1, 13.31, 2, 'Officiel', 'Scolarisé', 2),
(3, 6, 1, 'J140021618', '48/18', '2018', 2, 13.51, 2, 'Officiel', 'Scolarisé', 4),
(5, 6, 1, 'E135210177', '60/17', '2015', 1, 12.02, 2, 'Officiel', 'Scolarisé', 6);

-- --------------------------------------------------------

--
-- Table structure for table `examen`
--

CREATE TABLE `examen` (
  `ID` int(11) NOT NULL,
  `TypeExamenID` int(11) NOT NULL,
  `Session` varchar(255) DEFAULT NULL,
  `MatiereID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `SalleID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `FormeEvaluationID` int(11) NOT NULL,
  `DocumentEvaluationID` int(11) DEFAULT NULL,
  `DocumentEvaluationID2` int(11) DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `DateDepotNotes` date DEFAULT NULL,
  `DatePassage` date DEFAULT NULL,
  `DatePlanifiee` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Duree` smallint(6) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exemplairelivre`
--

CREATE TABLE `exemplairelivre` (
  `ID` int(11) NOT NULL,
  `LivreID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `NumInventaire` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exemplairemateriel`
--

CREATE TABLE `exemplairemateriel` (
  `ID` int(11) NOT NULL,
  `MaterielID` int(11) NOT NULL,
  `SalleID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `NumInventaire` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fanspublication`
--

CREATE TABLE `fanspublication` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `PublicationID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `filiere`
--

CREATE TABLE `filiere` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `filiere`
--

INSERT INTO `filiere` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'DSI', 'Développement des Systèmes d\'Informations', 'تطوير نظم الإعلام'),
(2, 'MI', 'Maintenance Industrielle', 'الصيانة الصناعية'),
(3, 'SE', 'Systèmes Electriques', 'الأنظمة الكهروبية'),
(4, 'CPI', 'Conception du Produit Industriel', 'إبتكار المنتوج الصناعي'),
(5, 'PME-PMI', 'Gestion des PME et PMI', 'تسيير المقاولات الصغرى و المتوسطة'),
(6, 'ELT', 'Electro-technique', 'تقنيات الكهرباء');

-- --------------------------------------------------------

--
-- Table structure for table `fonction`
--

CREATE TABLE `fonction` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL DEFAULT '',
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fonction`
--

INSERT INTO `fonction` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, '01', NULL, 'التدريس'),
(2, '03', NULL, 'مدير مؤسسة تعليمية'),
(3, '04', NULL, 'ناظر الدروس'),
(4, '05', NULL, 'حارس عام'),
(5, '06', NULL, 'رئيس الأشغال'),
(6, '07', NULL, 'محضر مختبر'),
(7, '08', NULL, 'معيد'),
(8, '10', NULL, 'مسير المصالح المادية والاقتصادية'),
(9, '11', NULL, 'مساعد مسير المصالح المادية والاقتصادية'),
(10, '12', NULL, 'مرشد تربوي'),
(11, '60', NULL, 'قيم على الخزانة'),
(12, '95', NULL, 'مهام أخرى');

-- --------------------------------------------------------

--
-- Table structure for table `fonctionjury`
--

CREATE TABLE `fonctionjury` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fonctionpersonnel`
--

CREATE TABLE `fonctionpersonnel` (
  `ID` int(11) NOT NULL,
  `EtablissementID` int(11) NOT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `PersonnelUtilisateurID` int(11) NOT NULL,
  `FonctionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formeevaluation`
--

CREATE TABLE `formeevaluation` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `formeevaluation`
--

INSERT INTO `formeevaluation` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'ECR', 'Ecrit', 'كتابي'),
(2, 'PRA', 'Pratique', 'تطبيقي'),
(3, 'ORL', 'Oral', 'شفوي'),
(4, 'ECR/ORL', 'Ecrit/Oral', 'كتابي/شفوي'),
(5, 'ECR/PRA', 'Ecrit/Pratique', 'كتابي/تطبيقي'),
(6, 'PRA/ORL', 'Pratique/Oral', 'تطبيقي/شفوي');

-- --------------------------------------------------------

--
-- Table structure for table `formeexamen`
--

CREATE TABLE `formeexamen` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inspecteur`
--

CREATE TABLE `inspecteur` (
  `UtilisateurID` int(11) NOT NULL,
  `SpecialiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inspecteur`
--

INSERT INTO `inspecteur` (`UtilisateurID`, `SpecialiteID`) VALUES
(7, 16);

-- --------------------------------------------------------

--
-- Table structure for table `inspection`
--

CREATE TABLE `inspection` (
  `ID` int(11) NOT NULL,
  `InspecteurUtilisateurID` int(11) NOT NULL,
  `CahierTexteID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `inspection`
--

INSERT INTO `inspection` (`ID`, `InspecteurUtilisateurID`, `CahierTexteID`, `Date`, `Observation`, `Etat`) VALUES
(3, 7, 8, '2023-06-10', ' Le cahier de texte du professeur est bien organisé et clairement structuré. Chaque jour de classe est correctement enregistré avec les matières enseignées, les objectifs spécifiques et les activités prévues', 'Bien..');

-- --------------------------------------------------------

--
-- Table structure for table `invitation`
--

CREATE TABLE `invitation` (
  `ID` int(11) NOT NULL,
  `UtilisateurID2` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Lu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jalon`
--

CREATE TABLE `jalon` (
  `ID` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livrableprojet`
--

CREATE TABLE `livrableprojet` (
  `ID` int(11) NOT NULL,
  `JalonID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `ID` int(11) NOT NULL,
  `CouvertureLivreID` int(11) DEFAULT NULL,
  `DomaineLivreID` int(11) NOT NULL,
  `Isbn` varchar(255) DEFAULT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `Auteur` varchar(255) DEFAULT NULL,
  `MaisonEdit` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Empruntable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE `materiel` (
  `ID` int(11) NOT NULL,
  `TypeMaterielID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Empruntable` tinyint(1) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `matiere`
--

INSERT INTO `matiere` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'ARA', 'Arabe', 'اللغة العربية'),
(2, 'FRA', 'Français', 'اللغة الفرنسية'),
(3, 'ANG', 'Anglais', 'اللغة الإنجليزية'),
(4, 'TEC', 'Techniques d’expression et de communication', 'تقنيات التعبير و التواصل'),
(5, 'EEJE', 'Environnement économique et juridique de l’entreprise', 'المحيط الإقتصادي و القانوني للمقاولة'),
(6, 'MATH', 'Mathématiques', 'الرياضيات'),
(7, 'ASI', 'Architecture des systèmes informatiques', 'هندسة الأنظمة المعلوماتية'),
(8, 'DAI', 'Développement d\'applications informatiques', 'تطوير التطبيقات المعلوماتية'),
(9, 'CAI', 'Conception des applications informatiques', 'تصميم التطبيقات المعلوماتية'),
(10, 'STAGE', 'Soutenance de stage', 'مناقشة تقرير التدريب'),
(11, 'PFE', 'Soutenance de projet de fin d\'études', 'مناقشة مشروع نهاية التكوين');

-- --------------------------------------------------------

--
-- Table structure for table `matiere_inspecteur`
--

CREATE TABLE `matiere_inspecteur` (
  `InspecteurUtilisateurID` int(11) NOT NULL,
  `MatiereID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `matiere_inspecteur`
--

INSERT INTO `matiere_inspecteur` (`InspecteurUtilisateurID`, `MatiereID`) VALUES
(7, 8);

-- --------------------------------------------------------

--
-- Table structure for table `membrejury`
--

CREATE TABLE `membrejury` (
  `ID` int(11) NOT NULL,
  `FonctionJuryID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `SoutenanceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mention`
--

CREATE TABLE `mention` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `mention`
--

INSERT INTO `mention` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'P', 'Passable', 'مقبول'),
(2, 'AB', 'Assez bien', 'مستحسن'),
(3, 'B', 'Bien', 'حسن'),
(4, 'TB', 'Très bien', 'حسن جدا');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `ID` int(11) NOT NULL,
  `UtilisateurID2` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Objet` varchar(255) DEFAULT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Lu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'DSI-M1', 'Structure technologie des composants des ordinateurs', ''),
(2, 'DSI-M2', 'Structure et fonctionnement des ordinateurs', ''),
(3, 'DSI-M3', 'Programmation en langage assembleur', ''),
(4, 'DSI-M4', 'Systèmes d\'exploitation', ''),
(5, 'DSI-M5', 'Réseaux informatiques', ''),
(6, 'DSI-M6', 'Conception des systèmes d’informations', ''),
(7, 'DSI-M7', 'Base de Données Relationnelle', ''),
(8, 'DSI-M8', 'Système de Gestion de Base de Données', ''),
(9, 'DSI-M9', 'Méthodes de conception orienté objet', ''),
(10, 'DSI-M10', 'Atelier de Génie logicie', ''),
(11, 'DSI-M11', 'Gestion de projet', ''),
(12, 'DSI-M12', 'Assurance qualité, test et maintenance', ''),
(13, 'DSI-M13', 'Algorithmique et structures de données', ''),
(14, 'DSI-M14', 'Programmation procédurale', ''),
(15, 'DSI-M15', 'Programmation orientée objets', ''),
(16, 'DSI-M16', 'Environnement de développement intégré ', ''),
(17, 'DSI-M17', 'Multimédia', ''),
(18, 'DSI-M18', 'Développement WEB', ''),
(19, 'DSI-M19', 'Développement d’application client/serveur', ''),
(20, 'DSI-M21', 'Logiciel de bureautique et communication', '');

-- --------------------------------------------------------

--
-- Table structure for table `niveau`
--

CREATE TABLE `niveau` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `niveau`
--

INSERT INTO `niveau` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, '1ère', '1ère Année', 'السنة الأولى'),
(2, '2ème', '2ème Année', 'السنة التانية');

-- --------------------------------------------------------

--
-- Table structure for table `notation`
--

CREATE TABLE `notation` (
  `ID` int(11) NOT NULL,
  `TypeNoteID` int(11) NOT NULL,
  `PersonnelUtilisateurID` int(11) DEFAULT NULL,
  `Note` float NOT NULL,
  `Annee` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notecontrole`
--

CREATE TABLE `notecontrole` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `Note` float DEFAULT NULL,
  `Valide` tinyint(1) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `ControleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noteexamen`
--

CREATE TABLE `noteexamen` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `Note` float DEFAULT NULL,
  `Valide` tinyint(1) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `ExamenID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `noteprojet`
--

CREATE TABLE `noteprojet` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL,
  `Note` float NOT NULL,
  `Valide` tinyint(1) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notestage`
--

CREATE TABLE `notestage` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `StageID` int(11) NOT NULL,
  `Note` float NOT NULL,
  `Valide` tinyint(1) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `optionbac`
--

CREATE TABLE `optionbac` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `optionbac`
--

INSERT INTO `optionbac` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'SVT', 'Sciences et vies de la terre', 'علوم الحياة و الأرض'),
(2, 'SP', 'Sciences physiques', 'علوم فيزيائية'),
(3, 'SMA', 'Sciences mathématiques A', 'علوم رياضية أ'),
(4, 'SMB', 'Sciences mathématiques B', 'علوم رياضية ب'),
(5, 'SEC', 'Sciences économiques', 'علوم إقتصادية'),
(6, 'STM', 'Sciences et techniques mécaniques', 'علوم و تكنوليجيات ميكانيكية'),
(7, 'STE', 'Sciences et techniques électriques', 'علوم و تكنوليجيات كهربائية'),
(8, 'AAP', 'Arts appliqués', 'فنون تطبيقية'),
(9, 'SGC', 'Sciences de Gestion Comptable', 'علوم التدبير المحاسباتي'),
(10, 'SH', 'Sciences humaines', 'علوم إنسانية');

-- --------------------------------------------------------

--
-- Table structure for table `organisme`
--

CREATE TABLE `organisme` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Site` varchar(255) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Division` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `panne`
--

CREATE TABLE `panne` (
  `ID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `ExemplaireMaterielID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `UtilisateurID` int(11) NOT NULL,
  `LienParente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`UtilisateurID`, `LienParente`) VALUES
(2, '1'),
(4, 'Père'),
(6, 'Père');

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE `periode` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'AN', 'Annuelle', 'طول السنة'),
(2, 'S1', 'Semestre 1', 'الفصل الدراسي 1'),
(3, 'S2', 'Semestre 2', 'الفصل الدراسي 2');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `ID` int(11) NOT NULL,
  `Permission` varchar(255) DEFAULT NULL,
  `DateMAJ` date DEFAULT NULL,
  `RessourceID` int(11) NOT NULL,
  `RoleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personnel`
--

CREATE TABLE `personnel` (
  `UtilisateurID` int(11) NOT NULL,
  `Som` varchar(255) DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `DateAffectation` date DEFAULT NULL,
  `NbrEnfants` smallint(6) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `SomConjoint` varchar(255) DEFAULT NULL,
  `NumContrat` varchar(255) DEFAULT NULL,
  `CadreID` int(11) NOT NULL,
  `SituationAdministrativeID` int(11) NOT NULL,
  `FonctionActuelleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phase`
--

CREATE TABLE `phase` (
  `ID` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Duree` smallint(6) NOT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professeur`
--

CREATE TABLE `professeur` (
  `UtilisateurID` int(11) NOT NULL,
  `CycleID` int(11) NOT NULL,
  `SpecialiteID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `professeur`
--

INSERT INTO `professeur` (`UtilisateurID`, `CycleID`, `SpecialiteID`) VALUES
(6, 2, 16),
(10, 2, 16),
(11, 2, 16);

-- --------------------------------------------------------

--
-- Table structure for table `professeur_projet`
--

CREATE TABLE `professeur_projet` (
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `ID` int(11) NOT NULL,
  `CahierChargeProjetID` int(11) DEFAULT NULL,
  `ClasseID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SoutenanceID` int(11) DEFAULT NULL,
  `DisciplineID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projet_etudiant`
--

CREATE TABLE `projet_etudiant` (
  `ProjetID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `ID` int(11) NOT NULL,
  `RegionID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`ID`, `RegionID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 1, 'Rabat', 'Préfecture de Rabat', NULL),
(2, 1, 'Salé', 'Préfecture de Salé', NULL),
(3, 1, 'Skhirate-Témara', 'Préfecture de Skhirate-Témara', NULL),
(4, 1, 'Kénitra', 'Province de Kénitra', NULL),
(5, 1, 'Khémisset', 'Province de Khémisset', NULL),
(6, 1, 'Sidi Kacem', 'Province de Sidi Kacem', NULL),
(7, 1, 'Sidi Slimane', 'Province de Sidi Slimane', NULL),
(8, 2, 'Tanger-Assilah', 'Préfecture de Tanger-Assilah', NULL),
(9, 2, 'M\'diq-Fnideq', 'Préfecture de M\'diq-Fnideq', NULL),
(10, 2, 'Tétouan', 'Province de Tétouan', NULL),
(11, 2, 'Fahs-Anjra', 'Province de Fahs-Anjra', NULL),
(12, 2, 'Larache', 'Province de Larache', NULL),
(13, 2, 'Al Hoceïma', 'Province d\'Al Hoceïma', NULL),
(14, 2, 'Chefchaouen', 'Province de Chefchaouen', NULL),
(15, 2, 'Ouezzane', 'Province d\'Ouezzane', NULL),
(16, 3, 'Casablanca', 'Préfecture de Casablanca', NULL),
(17, 3, 'Mohammédia', 'Préfecture de Mohammédia', NULL),
(18, 3, 'El Jadida', 'Province d\'El Jadida', NULL),
(19, 3, 'Nouaceur', 'Province de Nouaceur', NULL),
(20, 3, 'Médiouna', 'Province de Médiouna', NULL),
(21, 3, 'Benslimane', 'Province de Benslimane', NULL),
(22, 3, 'Berrechid', 'Province de Berrechid', NULL),
(23, 3, 'Settat', 'Province de Settat', NULL),
(24, 3, 'Sidi Bennour', 'Province de Sidi Bennour', NULL),
(25, 4, 'Errachidia', 'Province d\'Errachidia', NULL),
(26, 4, 'Ouarzazate', 'Province de Ouarzazate', NULL),
(27, 4, 'Midelt', 'Province de Midelt', NULL),
(28, 4, 'Tinghir', 'Province de Tinghir', NULL),
(29, 4, 'Zagora', 'Province de Zagora', NULL),
(30, 5, 'Oujda-Angad', 'Préfecture d\'Oujda-Angad', NULL),
(31, 5, 'Nador', 'Province de Nador', NULL),
(32, 5, 'Driouch', 'Province de Driouch', NULL),
(33, 5, 'Jerada', 'Province de Jerada', NULL),
(34, 5, 'Berkane', 'Province de Berkane', NULL),
(35, 5, 'Taourirt', 'Province de Taourirt', NULL),
(36, 5, 'Guercif', 'Province de Guercif', NULL),
(37, 5, 'Figuig', 'Province de Figuig', NULL),
(38, 6, 'Agadir Ida-Outanane', 'Préfecture d\'Agadir Ida-Outanane', NULL),
(39, 6, 'Inezgane-Aït Melloul', 'Préfecture d\'Inezgane-Aït Melloul', NULL),
(40, 6, 'Chtouka-Aït Baha', 'Province de Chtouka-Aït Baha', NULL),
(41, 6, 'Taroudant', 'Province de Taroudant', NULL),
(42, 6, 'Tiznit', 'Province de Tiznit', NULL),
(43, 6, 'Tata', 'Province de Tata', NULL),
(44, 7, 'Fès', 'Préfecture de Fès', NULL),
(45, 7, 'Meknès', 'Préfecture de Meknès', NULL),
(46, 7, 'El Hajeb', 'Province d’El Hajeb', NULL),
(47, 7, 'Ifrane', 'Province d’Ifrane', NULL),
(48, 7, 'Moulay Yaâcoub', 'Province de Moulay Yaâcoub', NULL),
(49, 7, 'Séfrou', 'Province de Séfrou', NULL),
(50, 7, 'Boulemane', 'Province de Boulemane', NULL),
(51, 7, 'Taounate', 'Province de Taounate', NULL),
(52, 7, 'Taza', 'Province de Taza', NULL),
(53, 8, 'Marrakech', 'Préfecture de Marrakech', NULL),
(54, 8, 'Chichaoua', 'Province de Chichaoua', NULL),
(55, 8, 'Al Haouz', 'Province d\'Al Haouz', NULL),
(56, 8, 'El Kelaâ des Sraghna', 'Province d\'El Kelaâ des Sraghna', NULL),
(57, 8, 'Essaouira', 'Province d\'Essaouira', NULL),
(58, 8, 'Rehamna', 'Province de Rehamna', NULL),
(59, 8, 'Safi', 'Province de Safi', NULL),
(60, 8, 'Youssoufia', 'Province de Youssoufia', NULL),
(61, 9, 'Béni-Mellal', 'Province de Béni-Mellal', NULL),
(62, 9, 'Azilal', 'Province d\'Azilal', NULL),
(63, 9, 'Fquih Ben Salah', 'Province de Fquih Ben Salah', NULL),
(64, 9, 'Khénifra', 'Province de Khénifra', NULL),
(65, 9, 'Khouribga', 'Province de Khouribga', NULL),
(66, 10, 'Guelmim', 'Province de Guelmim', NULL),
(67, 10, 'Assa-Zag', 'Province d\'Assa-Zag', NULL),
(68, 10, 'Tan-Tan', 'Province de Tan-Tan', NULL),
(69, 10, 'Sidi Ifni', 'Province de Sidi Ifni', NULL),
(70, 11, 'Laâyoune', 'Province de Laâyoune', NULL),
(71, 11, 'Boujdour', 'Province de Boujdour', NULL),
(72, 11, 'Tarfaya', 'Province de Tarfaya', NULL),
(73, 11, 'Es-Semara', 'Province d\'Es-Semara', NULL),
(74, 12, 'Oued Ed Dahab', 'Province d\'Oued Ed Dahab', NULL),
(75, 12, 'Aousserd', 'Province d\'Aousserd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `ID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `DocumentPublicationID` int(11) DEFAULT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Objet` varchar(255) DEFAULT NULL,
  `Texte` varchar(255) DEFAULT NULL,
  `Etat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rapportprojet`
--

CREATE TABLE `rapportprojet` (
  `ID` int(11) NOT NULL,
  `ProjetID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rapportstage`
--

CREATE TABLE `rapportstage` (
  `ID` int(11) NOT NULL,
  `StageID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Emplacement` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Taille` varchar(255) DEFAULT NULL,
  `DateUpload` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `region`
--

INSERT INTO `region` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'Rabat-Salé-Kénitra', 'Rabat-Salé-Kénitra', 'جهة الرباط سلا القنيطرة'),
(2, 'Tanger-Tétouan-Al Hoceïma', 'Tanger-Tétouan-Al Hoceïma', 'جهة طنجة تطوان الحسيمة'),
(3, 'Casablanca-Settat', 'Casablanca-Settat', 'جهة الدار البيضاء سطات'),
(4, ' Drâa-Tafilalet', ' Drâa-Tafilalet', 'جهة درعة تافيلالت'),
(5, 'l\'Oriental', 'l\'Oriental', 'جهة الشرق'),
(6, 'Souss-Massa', 'Souss-Massa', 'جهة سوس ماسة'),
(7, 'Fès-Meknès', 'Fès-Meknès', 'جهة فاس مكناس'),
(8, 'Marrakech-Safi', 'Marrakech-Safi', 'جهة مراكش آسفي'),
(9, 'Béni Mellal-Khénifra', 'Béni Mellal-Khénifra', 'جهة بني ملال خنيفرة'),
(10, 'Guelmim-Oued Noun', 'Guelmim-Oued Noun', 'جهة كلميم واد نون'),
(11, 'Laâyoune-Sakia El Hamra', 'Laâyoune-Sakia El Hamra', 'جهة العيون الساقية الحمراء'),
(12, 'Dakhla-Oued Ed Dahab', 'Dakhla-Oued Ed Dahab', 'جهة الداخلة وادي الذهب');

-- --------------------------------------------------------

--
-- Table structure for table `reparartion`
--

CREATE TABLE `reparartion` (
  `ID` int(11) NOT NULL,
  `PanneID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservationbibliotheque`
--

CREATE TABLE `reservationbibliotheque` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `LivreID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservationmateriel`
--

CREATE TABLE `reservationmateriel` (
  `ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `MaterielID` int(11) NOT NULL,
  `UtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ressource`
--

CREATE TABLE `ressource` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`, `Description`) VALUES
(1, 'ETUDIANT', 'Etudiant', NULL, NULL),
(2, 'PROFESSEUR', 'Professeur', NULL, NULL),
(3, 'DIRECTEUR-ETUDES', 'Directeur Etudes', NULL, NULL),
(4, 'SCOLRITE', 'Scolarite', NULL, NULL),
(5, 'PARENT', 'Parent', NULL, NULL),
(6, 'INSPECTEUR', 'Inspecteur', NULL, NULL),
(7, 'MAINTENANCE', 'Technicien de maintenance', NULL, NULL),
(8, 'DIRECTEUR', 'Directeur', NULL, NULL),
(9, 'INTENDANT', 'Intendent', NULL, NULL),
(10, 'MAGASINIER', 'Magasinier', NULL, NULL),
(11, 'ADMIN', 'Administrateur', NULL, NULL),
(12, 'PHOTOCOPIE', 'Agent de photocopie', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `ID` int(11) NOT NULL,
  `TypeSalleID` int(11) NOT NULL,
  `BlocID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`ID`, `TypeSalleID`, `BlocID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 3, 1, 'A', NULL, NULL),
(2, 1, 1, 'B', NULL, NULL),
(3, 2, 3, 'C', NULL, NULL),
(4, 2, 2, NULL, NULL, NULL),
(5, 3, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scolarite`
--

CREATE TABLE `scolarite` (
  `ID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `DateInscription` date DEFAULT NULL,
  `DecisionFinAnnee` varchar(255) DEFAULT NULL,
  `MentionID` int(11) DEFAULT NULL,
  `Moyenne` float DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `scolarite`
--

INSERT INTO `scolarite` (`ID`, `EtudiantUtilisateurID`, `ClasseID`, `DateInscription`, `DecisionFinAnnee`, `MentionID`, `Moyenne`, `Etat`, `Observation`) VALUES
(1, 1, 2, '2020-06-05', NULL, 1, 0, NULL, NULL),
(2, 3, 2, '2020-06-05', NULL, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seance`
--

CREATE TABLE `seance` (
  `ID` int(11) NOT NULL,
  `SeanceGeneriqueID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seance`
--

INSERT INTO `seance` (`ID`, `SeanceGeneriqueID`, `Date`, `Etat`, `Observation`) VALUES
(1, 1, '2023-01-02', 'passe', 'test'),
(2, 2, '2023-01-02', 'passe', 'test'),
(3, 4, '2023-06-17', NULL, NULL),
(4, 5, '2023-06-10', NULL, NULL),
(5, 3, '2023-06-10', NULL, NULL),
(6, 2, '2023-06-01', NULL, NULL),
(7, 1, '2023-06-02', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seancegenerique`
--

CREATE TABLE `seancegenerique` (
  `ID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `MatiereID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `SalleID` int(11) NOT NULL,
  `PeriodeID` int(11) NOT NULL,
  `Jour` varchar(255) DEFAULT NULL,
  `HeureDebut` varchar(255) DEFAULT NULL,
  `HeureFin` varchar(255) DEFAULT NULL,
  `Duree` smallint(6) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seancegenerique`
--

INSERT INTO `seancegenerique` (`ID`, `ClasseID`, `MatiereID`, `ModuleID`, `ProfesseurUtilisateurID`, `SalleID`, `PeriodeID`, `Jour`, `HeureDebut`, `HeureFin`, `Duree`, `Observation`) VALUES
(1, 2, 8, 19, 10, 1, 2, 'Lundi', '8H', '10H', 2, NULL),
(2, 2, 9, 7, 10, 2, 2, 'Mardi', '14H', '16H', 4, NULL),
(3, 2, 9, 6, 11, 3, 2, 'Lundi', '8H', '10H', 4, NULL),
(4, 2, 8, 18, 11, 1, 2, 'Mercredi', '14H', '16H', 4, NULL),
(5, 1, 9, 17, 11, 1, 2, 'Lundi', '8H', '10H', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `situationadministrative`
--

CREATE TABLE `situationadministrative` (
  `ID` int(11) NOT NULL,
  `Code` int(11) NOT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soutenance`
--

CREATE TABLE `soutenance` (
  `ID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `SalleID` int(11) NOT NULL,
  `MatiereID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL,
  `DocumentEvaluationID` int(11) NOT NULL,
  `DocumentEvaluationID2` int(11) NOT NULL,
  `FormeEvaluationID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `DateDepotNotes` date DEFAULT NULL,
  `DatePassage` date DEFAULT NULL,
  `DatePlanifiee` date DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Duree` smallint(6) DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

CREATE TABLE `specialite` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, '10', 'Arabe', 'اللغة العربية'),
(2, '11', 'Instruction islamique', 'التربية الاسلامية'),
(3, '12', 'Philosophie', 'الفلسفة و الفكر الاسلامي'),
(4, '13', 'Histoire-Géographie', 'الاجتماعيات'),
(5, '14', 'Sciences de l\'éducation', 'علوم التربية'),
(6, '15', 'Education physique', 'التربية البدنية'),
(7, '16', 'Education artistique', 'التربية التشكيلية'),
(8, '17', NULL, 'الثقافة النسوية'),
(9, '18', 'Français', 'اللغة الفرنسية'),
(10, '19', 'Anglais', 'اللغة الانجليزية'),
(11, '20', 'Espagnol', 'اللغة الاسبانية'),
(12, '21', 'Allemand', 'اللغة الألمانية'),
(13, '22', 'Mathématiques', 'الرياضيات'),
(14, '23', 'Science de la vie et de la terre', 'علوم الحياة والارض'),
(15, '24', 'Physique et chimie', 'الفيزياء و الكيمياء'),
(16, '25', 'Informatique', 'الإعلاميات'),
(17, '26', 'Traduction', 'الترجمة'),
(18, '27', 'Italien', 'اللغة الايطالية'),
(19, '28', 'Musique', 'الموسيقى'),
(20, '50', 'Technologie', 'التكنولوجيا'),
(21, '51', 'Génie mécanique', 'الهندسة الميكانيكية'),
(22, '52', 'Génie électrique', 'الهندسة الكهربائية'),
(23, '56', 'Economie et gestion', 'هندسة الاقتصاد والتسيير');

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `ID` int(11) NOT NULL,
  `EncadrantStageID` int(11) NOT NULL,
  `TypeStageID` int(11) NOT NULL,
  `ClasseID` int(11) NOT NULL,
  `EtudiantUtilisateurID` int(11) NOT NULL,
  `OrganismeID` int(11) NOT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Observation` varchar(255) DEFAULT NULL,
  `SoutenanceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stage_professeur`
--

CREATE TABLE `stage_professeur` (
  `StageID` int(11) NOT NULL,
  `ProfesseurUtilisateurID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tache`
--

CREATE TABLE `tache` (
  `ID` int(11) NOT NULL,
  `PhaseID` int(11) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `Duree` smallint(6) NOT NULL,
  `Etat` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typediplome`
--

CREATE TABLE `typediplome` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `typediplome`
--

INSERT INTO `typediplome` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'D. Scolaire/Univrsitaire', 'Diplôme scolaire ou universitaire', 'شهادة مدرسية أو جامعية'),
(2, 'D. Professionnel', 'Diplôme professionnel', 'شهادة مهنيـــــــــة');

-- --------------------------------------------------------

--
-- Table structure for table `typedocument`
--

CREATE TABLE `typedocument` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typedocumentetudiant`
--

CREATE TABLE `typedocumentetudiant` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typedocumentpersonnel`
--

CREATE TABLE `typedocumentpersonnel` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typeexamen`
--

CREATE TABLE `typeexamen` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typemateriel`
--

CREATE TABLE `typemateriel` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `typenote`
--

CREATE TABLE `typenote` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `typenote`
--

INSERT INTO `typenote` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'Administrative', 'Note administrative', 'نقطة إدارية'),
(2, 'Pédagogique', 'Note pédagogique', 'نقطة تربوية');

-- --------------------------------------------------------

--
-- Table structure for table `typesalle`
--

CREATE TABLE `typesalle` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `typesalle`
--

INSERT INTO `typesalle` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'laboratoire', NULL, NULL),
(2, 'Atelier', NULL, NULL),
(3, 'class', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `typestage`
--

CREATE TABLE `typestage` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `typestage`
--

INSERT INTO `typestage` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'Stage 1ére Année', 'Stage première année', 'تدريب السنة الأولى'),
(2, 'Stage 2ème Année', 'Stage deuxième année', 'تدريب السنة الثانية');

-- --------------------------------------------------------

--
-- Table structure for table `unite`
--

CREATE TABLE `unite` (
  `ID` int(11) NOT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `unite`
--

INSERT INTO `unite` (`ID`, `Code`, `Nom_Fr`, `Nom_Ar`) VALUES
(1, 'U1', 'Langue et Communication', 'اللغات والتواصل'),
(2, 'U2', 'Scientifique et Technique', 'العلمية و التقنية'),
(3, 'U3', 'Professionnelle', 'المهنية');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID` int(11) NOT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Nom_Fr` varchar(255) DEFAULT NULL,
  `Nom_Ar` varchar(255) DEFAULT NULL,
  `Prenom_Fr` varchar(255) DEFAULT NULL,
  `Prenom_Ar` varchar(255) DEFAULT NULL,
  `Sexe` varchar(255) DEFAULT NULL,
  `Titre` varchar(255) DEFAULT NULL,
  `Cin` varchar(255) DEFAULT NULL,
  `Nationalite` varchar(255) DEFAULT NULL,
  `DateNais` date DEFAULT NULL,
  `LieuNais_Fr` varchar(255) DEFAULT NULL,
  `LieuNais_Ar` varchar(255) DEFAULT NULL,
  `Adresse_Fr` varchar(255) DEFAULT NULL,
  `Adresse_Ar` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SituationF` varchar(255) DEFAULT NULL,
  `TeleMobile` varchar(255) DEFAULT NULL,
  `TeleDomicile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`ID`, `Photo`, `Nom_Fr`, `Nom_Ar`, `Prenom_Fr`, `Prenom_Ar`, `Sexe`, `Titre`, `Cin`, `Nationalite`, `DateNais`, `LieuNais_Fr`, `LieuNais_Ar`, `Adresse_Fr`, `Adresse_Ar`, `Email`, `SituationF`, `TeleMobile`, `TeleDomicile`) VALUES
(1, 'c:\\School\\data\\users\\usersphotos\\Chrysanthemum9001591320959596.jpg', 'AZOULAY', 'ازولي', 'Anouar', 'أنور', 'M', 'M.', 'GA221521', 'Marocaine', '1999-10-28', 'Missour Boulemane', 'ميسور بولمان', '', 'تجزئة جليل التازي قطاع 2 رقم 179 سيدي سليمان', 'anoiarazo2@gmail.com', NULL, '0653077997', ''),
(2, NULL, '', '', '', '', NULL, 'M.', '', NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', ''),
(3, 'c:\\School\\data\\users\\usersphotos\\Tulips6711591375829439.jpg', 'EL HAMDAOUI', 'الحمداوي', 'Mohammed', 'محمد', 'M', 'M.', 'AE266781', 'Marocaine', '1999-09-18', 'Salé Bettana Salé', 'سلا بطانة سلا', '', '88 زنقة اغبالو قطاع الفتح لعيايدة سلا', 'melhamdaoui888@gmail.com', NULL, '0670319175', ''),
(4, NULL, '', '', '', '', NULL, 'M.', '', NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', ''),
(5, 'c:\\School\\data\\users\\usersphotos\\Jellyfish7101591376650991.jpg', 'ZMARROU', 'زمرو', 'Abdellah', 'عبد الله', 'M', 'M.', 'G702644', 'Marocaine', '1997-04-15', 'Kénitra', 'القنيطرة', '', 'العنوان\r\nحي النور الزنقة 102 رقم 37 القنيطرة', 'abdellah_zmarou@outlook.fr', NULL, '642113470', ''),
(6, 'c:\\School\\data\\users\\usersphotos\\Tulips6711591375829439.jpg', 'Elbouari', '', 'Khalid', '', NULL, 'M.', '', NULL, NULL, NULL, NULL, '', NULL, '', NULL, '', ''),
(7, 'c:\\School\\data\\users\\usersphotos\\Desert9791591411294434.jpg', 'bakri', NULL, 'oussama', NULL, 'M', 'M.', 'GI2956', 'Marocaine', '2000-12-01', 'Kénitra', 'القنيطرة', '', 'القنيطرة', 'dodslim100@gmail.com', NULL, '0602925048', ''),
(9, 'c:\\School\\data\\users\\usersphotos\\Penguins900159132091245.jpg', 'CHABBI', 'الشابي', 'Hamid', 'حميد', 'M', 'M.', 'G124578', 'Marocaine', '1961-06-12', 'Kénitra', 'القنيطرة', 'Kénitra', 'القنيطرة', 'chabbii@gmail.com', 'M', '0666666666', '0537373737'),
(10, 'c:\\School\\data\\users\\usersphotos\\Desert9791591411294434.jpg', 'Bouaabid', 'بوعبيد', 'Morad', 'مراد', 'M', 'M.', 'GA221521', 'Marocaine', '1997-02-01', 'Kénitra', 'القنيطرة', 'Kénitra', 'القنيطرة', 'bouaabid@gmail.com', NULL, '62177126', '51287212'),
(11, 'c:\\School\\data\\users\\usersphotos\\Penguins900159132091245.jpg', 'Alhayan', 'الحيان', 'Hamid', 'حميد', 'M', 'M.', 'GA66621', 'Marocaine', '1994-04-01', 'Kénitra', 'القنيطرة', 'Kénitra', 'القنيطرة', 'hamid@gmail.com', NULL, '672819273', '572834918');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absenceetudiant`
--
ALTER TABLE `absenceetudiant`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `DocJustifAbsEtudiantID` (`DocJustifAbsEtudiantID`),
  ADD KEY `SeanceID` (`SeanceID`);

--
-- Indexes for table `absencepersonnel`
--
ALTER TABLE `absencepersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DocJustifAbsPersonnelID` (`DocJustifAbsPersonnelID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`);

--
-- Indexes for table `absenceprofesseur`
--
ALTER TABLE `absenceprofesseur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DocJustifAbsPersonnelID` (`DocJustifAbsPersonnelID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `SeanceID` (`SeanceID`);

--
-- Indexes for table `acrivitepedagogique`
--
ALTER TABLE `acrivitepedagogique`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `actualite`
--
ALTER TABLE `actualite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `anneescolairecourante`
--
ALTER TABLE `anneescolairecourante`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AnneeScolaireID` (`AnneeScolaireID`);

--
-- Indexes for table `annonce`
--
ALTER TABLE `annonce`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `annonce_classe`
--
ALTER TABLE `annonce_classe`
  ADD PRIMARY KEY (`AnnonceID`,`ClasseID`),
  ADD KEY `AnnonceID` (`AnnonceID`),
  ADD KEY `ClasseID` (`ClasseID`);

--
-- Indexes for table `avancementpersonnel`
--
ALTER TABLE `avancementpersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`);

--
-- Indexes for table `avancementtache`
--
ALTER TABLE `avancementtache`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TacheID` (`TacheID`);

--
-- Indexes for table `avertissement`
--
ALTER TABLE `avertissement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`);

--
-- Indexes for table `bloc`
--
ALTER TABLE `bloc`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cadre`
--
ALTER TABLE `cadre`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cahierchargeprojet`
--
ALTER TABLE `cahierchargeprojet`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cahiertexte`
--
ALTER TABLE `cahiertexte`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SeanceID` (`SeanceID`);

--
-- Indexes for table `cahiertexte_acrivitepedagogique`
--
ALTER TABLE `cahiertexte_acrivitepedagogique`
  ADD PRIMARY KEY (`CahierTexteID`,`AcrivitePedagogiqueID`),
  ADD KEY `CahierTexteID` (`CahierTexteID`),
  ADD KEY `AcrivitePedagogiqueID` (`AcrivitePedagogiqueID`);

--
-- Indexes for table `cahiertexte_concept`
--
ALTER TABLE `cahiertexte_concept`
  ADD PRIMARY KEY (`CahierTexteID`,`ConceptID`),
  ADD KEY `ConceptID` (`ConceptID`),
  ADD KEY `CahierTexteID` (`CahierTexteID`);

--
-- Indexes for table `caracteristique`
--
ALTER TABLE `caracteristique`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MaterielID` (`MaterielID`);

--
-- Indexes for table `chapitre`
--
ALTER TABLE `chapitre`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `ModuleID` (`ModuleID`);

--
-- Indexes for table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AnneeScolaireID` (`AnneeScolaireID`),
  ADD KEY `ClasseGeneriqueID` (`ClasseGeneriqueID`);

--
-- Indexes for table `classegenerique`
--
ALTER TABLE `classegenerique`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `NiveauID` (`NiveauID`),
  ADD KEY `FiliereID` (`FiliereID`),
  ADD KEY `CycleID` (`CycleID`);

--
-- Indexes for table `classegunite`
--
ALTER TABLE `classegunite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClasseGeneriqueID` (`ClasseGeneriqueID`),
  ADD KEY `UniteID` (`UniteID`);

--
-- Indexes for table `classe_demandephotocopie`
--
ALTER TABLE `classe_demandephotocopie`
  ADD PRIMARY KEY (`ClasseID`,`DemandePhotocopieID`),
  ADD KEY `DemandePhotocopieID` (`DemandePhotocopieID`),
  ADD KEY `ClasseID` (`ClasseID`);

--
-- Indexes for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`),
  ADD KEY `PublicationID` (`PublicationID`);

--
-- Indexes for table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `concept`
--
ALTER TABLE `concept`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ChapitreID` (`ChapitreID`);

--
-- Indexes for table `configurationmatiere`
--
ALTER TABLE `configurationmatiere`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClasseGUniteID` (`ClasseGUniteID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `PeriodeID` (`PeriodeID`),
  ADD KEY `FormeEvaluationID` (`FormeEvaluationID`);

--
-- Indexes for table `configurationmodule`
--
ALTER TABLE `configurationmodule`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ConfigurationMatiereID` (`ConfigurationMatiereID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `PeriodeID` (`PeriodeID`),
  ADD KEY `FormeEvaluationID` (`FormeEvaluationID`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`),
  ADD KEY `UtilisateurID2` (`UtilisateurID2`);

--
-- Indexes for table `controle`
--
ALTER TABLE `controle`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `DocumentEvaluationID` (`DocumentEvaluationID`),
  ADD KEY `DocumentEvaluationID2` (`DocumentEvaluationID2`),
  ADD KEY `FormeEvaluationID` (`FormeEvaluationID`);

--
-- Indexes for table `coordination`
--
ALTER TABLE `coordination`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `AnneeScolaireID` (`AnneeScolaireID`),
  ADD KEY `FiliereID` (`FiliereID`);

--
-- Indexes for table `couverturelivre`
--
ALTER TABLE `couverturelivre`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `cycle`
--
ALTER TABLE `cycle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `demandedocetudiant`
--
ALTER TABLE `demandedocetudiant`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `TypeDocumentEtudiantID` (`TypeDocumentEtudiantID`);

--
-- Indexes for table `demandedocpersonnel`
--
ALTER TABLE `demandedocpersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`),
  ADD KEY `TypeDocumentPersonnelID` (`TypeDocumentPersonnelID`);

--
-- Indexes for table `demandephotocopie`
--
ALTER TABLE `demandephotocopie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `TypeDocumentID` (`TypeDocumentID`);

--
-- Indexes for table `diplome`
--
ALTER TABLE `diplome`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TypeDiplomeID` (`TypeDiplomeID`);

--
-- Indexes for table `diplomepersonnel`
--
ALTER TABLE `diplomepersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SpecialiteID` (`SpecialiteID`),
  ADD KEY `DiplomeID` (`DiplomeID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`);

--
-- Indexes for table `discipline`
--
ALTER TABLE `discipline`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `docjustifabsetudiant`
--
ALTER TABLE `docjustifabsetudiant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `docjustifabspersonnel`
--
ALTER TABLE `docjustifabspersonnel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `documentactualite`
--
ALTER TABLE `documentactualite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ActualiteID` (`ActualiteID`);

--
-- Indexes for table `documentannonce`
--
ALTER TABLE `documentannonce`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `AnnonceID` (`AnnonceID`);

--
-- Indexes for table `documentevaluation`
--
ALTER TABLE `documentevaluation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `documentmateriel`
--
ALTER TABLE `documentmateriel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MaterielID` (`MaterielID`);

--
-- Indexes for table `documentmessage`
--
ALTER TABLE `documentmessage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MessageID` (`MessageID`);

--
-- Indexes for table `documentphotocopie`
--
ALTER TABLE `documentphotocopie`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DemandePhotocopieID` (`DemandePhotocopieID`);

--
-- Indexes for table `documentpublication`
--
ALTER TABLE `documentpublication`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `domainelivre`
--
ALTER TABLE `domainelivre`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `empruntbibliotheque`
--
ALTER TABLE `empruntbibliotheque`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ExemplaireLivreID` (`ExemplaireLivreID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `empruntmateriel`
--
ALTER TABLE `empruntmateriel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ExemplaireMaterielID` (`ExemplaireMaterielID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `encadrantstage`
--
ALTER TABLE `encadrantstage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `engagement`
--
ALTER TABLE `engagement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`);

--
-- Indexes for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProvinceID` (`ProvinceID`);

--
-- Indexes for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`UtilisateurID`),
  ADD KEY `EtablissementID` (`EtablissementID`),
  ADD KEY `FiliereID` (`FiliereID`),
  ADD KEY `OptionBacID` (`OptionBacID`),
  ADD KEY `MentionID` (`MentionID`),
  ADD KEY `ParentUtilisateurID` (`ParentUtilisateurID`);

--
-- Indexes for table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `SalleID` (`SalleID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `FormeEvaluationID` (`FormeEvaluationID`),
  ADD KEY `DocumentEvaluationID` (`DocumentEvaluationID`),
  ADD KEY `DocumentEvaluationID2` (`DocumentEvaluationID2`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `TypeExamenID` (`TypeExamenID`);

--
-- Indexes for table `exemplairelivre`
--
ALTER TABLE `exemplairelivre`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LivreID` (`LivreID`);

--
-- Indexes for table `exemplairemateriel`
--
ALTER TABLE `exemplairemateriel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MaterielID` (`MaterielID`),
  ADD KEY `SalleID` (`SalleID`);

--
-- Indexes for table `fanspublication`
--
ALTER TABLE `fanspublication`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PublicationID` (`PublicationID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fonction`
--
ALTER TABLE `fonction`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fonctionjury`
--
ALTER TABLE `fonctionjury`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fonctionpersonnel`
--
ALTER TABLE `fonctionpersonnel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtablissementID` (`EtablissementID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`),
  ADD KEY `FonctionID` (`FonctionID`);

--
-- Indexes for table `formeevaluation`
--
ALTER TABLE `formeevaluation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `formeexamen`
--
ALTER TABLE `formeexamen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inspecteur`
--
ALTER TABLE `inspecteur`
  ADD PRIMARY KEY (`UtilisateurID`),
  ADD KEY `SpecialiteID` (`SpecialiteID`);

--
-- Indexes for table `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CahierTexteID` (`CahierTexteID`),
  ADD KEY `InspecteurUtilisateurID` (`InspecteurUtilisateurID`);

--
-- Indexes for table `invitation`
--
ALTER TABLE `invitation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID2` (`UtilisateurID2`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `jalon`
--
ALTER TABLE `jalon`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjetID` (`ProjetID`);

--
-- Indexes for table `livrableprojet`
--
ALTER TABLE `livrableprojet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `JalonID` (`JalonID`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CouvertureLivreID` (`CouvertureLivreID`),
  ADD KEY `DomaineLivreID` (`DomaineLivreID`);

--
-- Indexes for table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TypeMaterielID` (`TypeMaterielID`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `matiere_inspecteur`
--
ALTER TABLE `matiere_inspecteur`
  ADD PRIMARY KEY (`InspecteurUtilisateurID`,`MatiereID`),
  ADD KEY `MatiereID` (`MatiereID`);

--
-- Indexes for table `membrejury`
--
ALTER TABLE `membrejury`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FonctionJuryID` (`FonctionJuryID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `SoutenanceID` (`SoutenanceID`);

--
-- Indexes for table `mention`
--
ALTER TABLE `mention`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UtilisateurID2` (`UtilisateurID2`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `notation`
--
ALTER TABLE `notation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TypeNoteID` (`TypeNoteID`),
  ADD KEY `PersonnelUtilisateurID` (`PersonnelUtilisateurID`);

--
-- Indexes for table `notecontrole`
--
ALTER TABLE `notecontrole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `ControleID` (`ControleID`);

--
-- Indexes for table `noteexamen`
--
ALTER TABLE `noteexamen`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `ExamenID` (`ExamenID`);

--
-- Indexes for table `noteprojet`
--
ALTER TABLE `noteprojet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `ProjetID` (`ProjetID`);

--
-- Indexes for table `notestage`
--
ALTER TABLE `notestage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `StageID` (`StageID`);

--
-- Indexes for table `optionbac`
--
ALTER TABLE `optionbac`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `organisme`
--
ALTER TABLE `organisme`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `panne`
--
ALTER TABLE `panne`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `ExemplaireMaterielID` (`ExemplaireMaterielID`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`UtilisateurID`);

--
-- Indexes for table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RessourceID` (`RessourceID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`UtilisateurID`),
  ADD KEY `CadreID` (`CadreID`),
  ADD KEY `SituationAdministrativeID` (`SituationAdministrativeID`),
  ADD KEY `FonctionActuelleID` (`FonctionActuelleID`);

--
-- Indexes for table `phase`
--
ALTER TABLE `phase`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjetID` (`ProjetID`);

--
-- Indexes for table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`UtilisateurID`),
  ADD KEY `CycleID` (`CycleID`),
  ADD KEY `SpecialiteID` (`SpecialiteID`);

--
-- Indexes for table `professeur_projet`
--
ALTER TABLE `professeur_projet`
  ADD PRIMARY KEY (`ProfesseurUtilisateurID`,`ProjetID`),
  ADD KEY `ProjetID` (`ProjetID`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CahierChargeProjetID` (`CahierChargeProjetID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `SoutenanceID` (`SoutenanceID`),
  ADD KEY `DisciplineID` (`DisciplineID`);

--
-- Indexes for table `projet_etudiant`
--
ALTER TABLE `projet_etudiant`
  ADD PRIMARY KEY (`ProjetID`,`EtudiantUtilisateurID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RegionID` (`RegionID`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `DocumentPublicationID` (`DocumentPublicationID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`);

--
-- Indexes for table `rapportprojet`
--
ALTER TABLE `rapportprojet`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjetID` (`ProjetID`);

--
-- Indexes for table `rapportstage`
--
ALTER TABLE `rapportstage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `StageID` (`StageID`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reparartion`
--
ALTER TABLE `reparartion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PanneID` (`PanneID`);

--
-- Indexes for table `reservationbibliotheque`
--
ALTER TABLE `reservationbibliotheque`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LivreID` (`LivreID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `reservationmateriel`
--
ALTER TABLE `reservationmateriel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MaterielID` (`MaterielID`),
  ADD KEY `UtilisateurID` (`UtilisateurID`);

--
-- Indexes for table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TypeSalleID` (`TypeSalleID`),
  ADD KEY `BlocID` (`BlocID`);

--
-- Indexes for table `scolarite`
--
ALTER TABLE `scolarite`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `MentionID` (`MentionID`);

--
-- Indexes for table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SeanceGeneriqueID` (`SeanceGeneriqueID`);

--
-- Indexes for table `seancegenerique`
--
ALTER TABLE `seancegenerique`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `ModuleID` (`ModuleID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `SalleID` (`SalleID`),
  ADD KEY `PeriodeID` (`PeriodeID`);

--
-- Indexes for table `situationadministrative`
--
ALTER TABLE `situationadministrative`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `soutenance`
--
ALTER TABLE `soutenance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `SalleID` (`SalleID`),
  ADD KEY `MatiereID` (`MatiereID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`),
  ADD KEY `DocumentEvaluationID` (`DocumentEvaluationID`),
  ADD KEY `DocumentEvaluationID2` (`DocumentEvaluationID2`),
  ADD KEY `FormeEvaluationID` (`FormeEvaluationID`);

--
-- Indexes for table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EncadrantStageID` (`EncadrantStageID`),
  ADD KEY `TypeStageID` (`TypeStageID`),
  ADD KEY `ClasseID` (`ClasseID`),
  ADD KEY `EtudiantUtilisateurID` (`EtudiantUtilisateurID`),
  ADD KEY `OrganismeID` (`OrganismeID`),
  ADD KEY `SoutenanceID` (`SoutenanceID`);

--
-- Indexes for table `stage_professeur`
--
ALTER TABLE `stage_professeur`
  ADD PRIMARY KEY (`StageID`,`ProfesseurUtilisateurID`),
  ADD KEY `ProfesseurUtilisateurID` (`ProfesseurUtilisateurID`);

--
-- Indexes for table `tache`
--
ALTER TABLE `tache`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PhaseID` (`PhaseID`);

--
-- Indexes for table `typediplome`
--
ALTER TABLE `typediplome`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typedocument`
--
ALTER TABLE `typedocument`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typedocumentetudiant`
--
ALTER TABLE `typedocumentetudiant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typedocumentpersonnel`
--
ALTER TABLE `typedocumentpersonnel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typeexamen`
--
ALTER TABLE `typeexamen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typemateriel`
--
ALTER TABLE `typemateriel`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typenote`
--
ALTER TABLE `typenote`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typesalle`
--
ALTER TABLE `typesalle`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `typestage`
--
ALTER TABLE `typestage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absenceetudiant`
--
ALTER TABLE `absenceetudiant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `absencepersonnel`
--
ALTER TABLE `absencepersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `acrivitepedagogique`
--
ALTER TABLE `acrivitepedagogique`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `actualite`
--
ALTER TABLE `actualite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `anneescolaire`
--
ALTER TABLE `anneescolaire`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `anneescolairecourante`
--
ALTER TABLE `anneescolairecourante`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `annonce`
--
ALTER TABLE `annonce`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avancementpersonnel`
--
ALTER TABLE `avancementpersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avancementtache`
--
ALTER TABLE `avancementtache`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `avertissement`
--
ALTER TABLE `avertissement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bloc`
--
ALTER TABLE `bloc`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cadre`
--
ALTER TABLE `cadre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cahierchargeprojet`
--
ALTER TABLE `cahierchargeprojet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cahiertexte`
--
ALTER TABLE `cahiertexte`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `caracteristique`
--
ALTER TABLE `caracteristique`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapitre`
--
ALTER TABLE `chapitre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `classe`
--
ALTER TABLE `classe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `classegenerique`
--
ALTER TABLE `classegenerique`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `classegunite`
--
ALTER TABLE `classegunite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compte`
--
ALTER TABLE `compte`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `concept`
--
ALTER TABLE `concept`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `configurationmatiere`
--
ALTER TABLE `configurationmatiere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `configurationmodule`
--
ALTER TABLE `configurationmodule`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `controle`
--
ALTER TABLE `controle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coordination`
--
ALTER TABLE `coordination`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couverturelivre`
--
ALTER TABLE `couverturelivre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cycle`
--
ALTER TABLE `cycle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `demandedocetudiant`
--
ALTER TABLE `demandedocetudiant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demandedocpersonnel`
--
ALTER TABLE `demandedocpersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `demandephotocopie`
--
ALTER TABLE `demandephotocopie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diplome`
--
ALTER TABLE `diplome`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `diplomepersonnel`
--
ALTER TABLE `diplomepersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docjustifabsetudiant`
--
ALTER TABLE `docjustifabsetudiant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docjustifabspersonnel`
--
ALTER TABLE `docjustifabspersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentactualite`
--
ALTER TABLE `documentactualite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentannonce`
--
ALTER TABLE `documentannonce`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentevaluation`
--
ALTER TABLE `documentevaluation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentmateriel`
--
ALTER TABLE `documentmateriel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentmessage`
--
ALTER TABLE `documentmessage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentphotocopie`
--
ALTER TABLE `documentphotocopie`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentpublication`
--
ALTER TABLE `documentpublication`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `domainelivre`
--
ALTER TABLE `domainelivre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empruntbibliotheque`
--
ALTER TABLE `empruntbibliotheque`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empruntmateriel`
--
ALTER TABLE `empruntmateriel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `encadrantstage`
--
ALTER TABLE `encadrantstage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engagement`
--
ALTER TABLE `engagement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `examen`
--
ALTER TABLE `examen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exemplairelivre`
--
ALTER TABLE `exemplairelivre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exemplairemateriel`
--
ALTER TABLE `exemplairemateriel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fanspublication`
--
ALTER TABLE `fanspublication`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fonction`
--
ALTER TABLE `fonction`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fonctionjury`
--
ALTER TABLE `fonctionjury`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fonctionpersonnel`
--
ALTER TABLE `fonctionpersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formeevaluation`
--
ALTER TABLE `formeevaluation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `formeexamen`
--
ALTER TABLE `formeexamen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inspection`
--
ALTER TABLE `inspection`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jalon`
--
ALTER TABLE `jalon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livrableprojet`
--
ALTER TABLE `livrableprojet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matiere`
--
ALTER TABLE `matiere`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `membrejury`
--
ALTER TABLE `membrejury`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mention`
--
ALTER TABLE `mention`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notation`
--
ALTER TABLE `notation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notecontrole`
--
ALTER TABLE `notecontrole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noteexamen`
--
ALTER TABLE `noteexamen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `noteprojet`
--
ALTER TABLE `noteprojet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notestage`
--
ALTER TABLE `notestage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `optionbac`
--
ALTER TABLE `optionbac`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `organisme`
--
ALTER TABLE `organisme`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `panne`
--
ALTER TABLE `panne`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `periode`
--
ALTER TABLE `periode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phase`
--
ALTER TABLE `phase`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rapportprojet`
--
ALTER TABLE `rapportprojet`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rapportstage`
--
ALTER TABLE `rapportstage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reparartion`
--
ALTER TABLE `reparartion`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservationbibliotheque`
--
ALTER TABLE `reservationbibliotheque`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservationmateriel`
--
ALTER TABLE `reservationmateriel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `scolarite`
--
ALTER TABLE `scolarite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seance`
--
ALTER TABLE `seance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `seancegenerique`
--
ALTER TABLE `seancegenerique`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `situationadministrative`
--
ALTER TABLE `situationadministrative`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soutenance`
--
ALTER TABLE `soutenance`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tache`
--
ALTER TABLE `tache`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typediplome`
--
ALTER TABLE `typediplome`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `typedocument`
--
ALTER TABLE `typedocument`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typedocumentetudiant`
--
ALTER TABLE `typedocumentetudiant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typedocumentpersonnel`
--
ALTER TABLE `typedocumentpersonnel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typeexamen`
--
ALTER TABLE `typeexamen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typemateriel`
--
ALTER TABLE `typemateriel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typenote`
--
ALTER TABLE `typenote`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `typesalle`
--
ALTER TABLE `typesalle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `typestage`
--
ALTER TABLE `typestage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unite`
--
ALTER TABLE `unite`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absenceetudiant`
--
ALTER TABLE `absenceetudiant`
  ADD CONSTRAINT `absenceetudiant_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absenceetudiant_ibfk_2` FOREIGN KEY (`SeanceID`) REFERENCES `seance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absenceetudiant_ibfk_3` FOREIGN KEY (`DocJustifAbsEtudiantID`) REFERENCES `docjustifabsetudiant` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `absencepersonnel`
--
ALTER TABLE `absencepersonnel`
  ADD CONSTRAINT `absencepersonnel_ibfk_1` FOREIGN KEY (`DocJustifAbsPersonnelID`) REFERENCES `docjustifabspersonnel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absencepersonnel_ibfk_2` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `absenceprofesseur`
--
ALTER TABLE `absenceprofesseur`
  ADD CONSTRAINT `absenceprofesseur_ibfk_1` FOREIGN KEY (`DocJustifAbsPersonnelID`) REFERENCES `docjustifabspersonnel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absenceprofesseur_ibfk_2` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absenceprofesseur_ibfk_3` FOREIGN KEY (`SeanceID`) REFERENCES `seance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actualite`
--
ALTER TABLE `actualite`
  ADD CONSTRAINT `actualite_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `anneescolairecourante`
--
ALTER TABLE `anneescolairecourante`
  ADD CONSTRAINT `anneescolairecourante_ibfk_1` FOREIGN KEY (`AnneeScolaireID`) REFERENCES `anneescolaire` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `annonce_classe`
--
ALTER TABLE `annonce_classe`
  ADD CONSTRAINT `annonce_classe_ibfk_1` FOREIGN KEY (`AnnonceID`) REFERENCES `annonce` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `annonce_classe_ibfk_2` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `avancementpersonnel`
--
ALTER TABLE `avancementpersonnel`
  ADD CONSTRAINT `avancementpersonnel_ibfk_1` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `avancementtache`
--
ALTER TABLE `avancementtache`
  ADD CONSTRAINT `avancementtache_ibfk_1` FOREIGN KEY (`TacheID`) REFERENCES `tache` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `avertissement`
--
ALTER TABLE `avertissement`
  ADD CONSTRAINT `avertissement_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cahiertexte`
--
ALTER TABLE `cahiertexte`
  ADD CONSTRAINT `cahiertexte_ibfk_2` FOREIGN KEY (`SeanceID`) REFERENCES `seance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cahiertexte_acrivitepedagogique`
--
ALTER TABLE `cahiertexte_acrivitepedagogique`
  ADD CONSTRAINT `cahiertexte_acrivitepedagogique_ibfk_1` FOREIGN KEY (`CahierTexteID`) REFERENCES `cahiertexte` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cahiertexte_acrivitepedagogique_ibfk_2` FOREIGN KEY (`AcrivitePedagogiqueID`) REFERENCES `acrivitepedagogique` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cahiertexte_concept`
--
ALTER TABLE `cahiertexte_concept`
  ADD CONSTRAINT `cahiertexte_concept_ibfk_1` FOREIGN KEY (`CahierTexteID`) REFERENCES `cahiertexte` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cahiertexte_concept_ibfk_2` FOREIGN KEY (`ConceptID`) REFERENCES `concept` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `caracteristique`
--
ALTER TABLE `caracteristique`
  ADD CONSTRAINT `caracteristique_ibfk_1` FOREIGN KEY (`MaterielID`) REFERENCES `materiel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chapitre`
--
ALTER TABLE `chapitre`
  ADD CONSTRAINT `chapitre_ibfk_1` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chapitre_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`AnneeScolaireID`) REFERENCES `anneescolaire` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classe_ibfk_3` FOREIGN KEY (`ClasseGeneriqueID`) REFERENCES `classegenerique` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classegenerique`
--
ALTER TABLE `classegenerique`
  ADD CONSTRAINT `classegenerique_ibfk_1` FOREIGN KEY (`NiveauID`) REFERENCES `niveau` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classegenerique_ibfk_2` FOREIGN KEY (`FiliereID`) REFERENCES `filiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classegenerique_ibfk_3` FOREIGN KEY (`CycleID`) REFERENCES `cycle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classegunite`
--
ALTER TABLE `classegunite`
  ADD CONSTRAINT `classegunite_ibfk_1` FOREIGN KEY (`ClasseGeneriqueID`) REFERENCES `classegenerique` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classegunite_ibfk_2` FOREIGN KEY (`UniteID`) REFERENCES `unite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classe_demandephotocopie`
--
ALTER TABLE `classe_demandephotocopie`
  ADD CONSTRAINT `classe_demandephotocopie_ibfk_1` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classe_demandephotocopie_ibfk_2` FOREIGN KEY (`DemandePhotocopieID`) REFERENCES `demandephotocopie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commentaire_ibfk_2` FOREIGN KEY (`PublicationID`) REFERENCES `publication` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compte_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `concept`
--
ALTER TABLE `concept`
  ADD CONSTRAINT `concept_ibfk_1` FOREIGN KEY (`ChapitreID`) REFERENCES `chapitre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `configurationmatiere`
--
ALTER TABLE `configurationmatiere`
  ADD CONSTRAINT `configurationmatiere_ibfk_1` FOREIGN KEY (`ClasseGUniteID`) REFERENCES `classegunite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmatiere_ibfk_2` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmatiere_ibfk_4` FOREIGN KEY (`PeriodeID`) REFERENCES `periode` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmatiere_ibfk_5` FOREIGN KEY (`FormeEvaluationID`) REFERENCES `formeevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `configurationmodule`
--
ALTER TABLE `configurationmodule`
  ADD CONSTRAINT `configurationmodule_ibfk_1` FOREIGN KEY (`ConfigurationMatiereID`) REFERENCES `configurationmatiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmodule_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmodule_ibfk_3` FOREIGN KEY (`PeriodeID`) REFERENCES `periode` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `configurationmodule_ibfk_4` FOREIGN KEY (`FormeEvaluationID`) REFERENCES `formeevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`UtilisateurID2`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `controle`
--
ALTER TABLE `controle`
  ADD CONSTRAINT `controle_ibfk_1` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_ibfk_2` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_ibfk_3` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_ibfk_4` FOREIGN KEY (`DocumentEvaluationID`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_ibfk_5` FOREIGN KEY (`DocumentEvaluationID2`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `controle_ibfk_6` FOREIGN KEY (`FormeEvaluationID`) REFERENCES `formeevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coordination`
--
ALTER TABLE `coordination`
  ADD CONSTRAINT `coordination_ibfk_1` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coordination_ibfk_2` FOREIGN KEY (`AnneeScolaireID`) REFERENCES `anneescolaire` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coordination_ibfk_3` FOREIGN KEY (`FiliereID`) REFERENCES `filiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `demandedocetudiant`
--
ALTER TABLE `demandedocetudiant`
  ADD CONSTRAINT `demandedocetudiant_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demandedocetudiant_ibfk_2` FOREIGN KEY (`TypeDocumentEtudiantID`) REFERENCES `typedocumentetudiant` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `demandedocpersonnel`
--
ALTER TABLE `demandedocpersonnel`
  ADD CONSTRAINT `demandedocpersonnel_ibfk_1` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demandedocpersonnel_ibfk_2` FOREIGN KEY (`TypeDocumentPersonnelID`) REFERENCES `typedocumentpersonnel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `demandephotocopie`
--
ALTER TABLE `demandephotocopie`
  ADD CONSTRAINT `demandephotocopie_ibfk_1` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demandephotocopie_ibfk_2` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demandephotocopie_ibfk_3` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `demandephotocopie_ibfk_4` FOREIGN KEY (`TypeDocumentID`) REFERENCES `typedocument` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diplome`
--
ALTER TABLE `diplome`
  ADD CONSTRAINT `diplome_ibfk_1` FOREIGN KEY (`TypeDiplomeID`) REFERENCES `typediplome` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diplomepersonnel`
--
ALTER TABLE `diplomepersonnel`
  ADD CONSTRAINT `diplomepersonnel_ibfk_1` FOREIGN KEY (`SpecialiteID`) REFERENCES `specialite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diplomepersonnel_ibfk_2` FOREIGN KEY (`DiplomeID`) REFERENCES `diplome` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `diplomepersonnel_ibfk_3` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documentactualite`
--
ALTER TABLE `documentactualite`
  ADD CONSTRAINT `documentactualite_ibfk_1` FOREIGN KEY (`ActualiteID`) REFERENCES `actualite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documentannonce`
--
ALTER TABLE `documentannonce`
  ADD CONSTRAINT `documentannonce_ibfk_1` FOREIGN KEY (`AnnonceID`) REFERENCES `annonce` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documentmateriel`
--
ALTER TABLE `documentmateriel`
  ADD CONSTRAINT `documentmateriel_ibfk_1` FOREIGN KEY (`MaterielID`) REFERENCES `materiel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documentmessage`
--
ALTER TABLE `documentmessage`
  ADD CONSTRAINT `documentmessage_ibfk_1` FOREIGN KEY (`MessageID`) REFERENCES `message` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documentphotocopie`
--
ALTER TABLE `documentphotocopie`
  ADD CONSTRAINT `documentphotocopie_ibfk_1` FOREIGN KEY (`DemandePhotocopieID`) REFERENCES `demandephotocopie` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empruntbibliotheque`
--
ALTER TABLE `empruntbibliotheque`
  ADD CONSTRAINT `empruntbibliotheque_ibfk_1` FOREIGN KEY (`ExemplaireLivreID`) REFERENCES `exemplairelivre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empruntbibliotheque_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `empruntmateriel`
--
ALTER TABLE `empruntmateriel`
  ADD CONSTRAINT `empruntmateriel_ibfk_1` FOREIGN KEY (`ExemplaireMaterielID`) REFERENCES `exemplairemateriel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empruntmateriel_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `engagement`
--
ALTER TABLE `engagement`
  ADD CONSTRAINT `engagement_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `etablissement_ibfk_1` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`EtablissementID`) REFERENCES `etablissement` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`FiliereID`) REFERENCES `filiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_4` FOREIGN KEY (`OptionBacID`) REFERENCES `optionbac` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_5` FOREIGN KEY (`MentionID`) REFERENCES `mention` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `etudiant_ibfk_6` FOREIGN KEY (`ParentUtilisateurID`) REFERENCES `parent` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_2` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_3` FOREIGN KEY (`SalleID`) REFERENCES `salle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_4` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_5` FOREIGN KEY (`FormeEvaluationID`) REFERENCES `formeevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_6` FOREIGN KEY (`DocumentEvaluationID`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_7` FOREIGN KEY (`DocumentEvaluationID2`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `examen_ibfk_8` FOREIGN KEY (`TypeExamenID`) REFERENCES `typeexamen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exemplairelivre`
--
ALTER TABLE `exemplairelivre`
  ADD CONSTRAINT `exemplairelivre_ibfk_1` FOREIGN KEY (`LivreID`) REFERENCES `livre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exemplairemateriel`
--
ALTER TABLE `exemplairemateriel`
  ADD CONSTRAINT `exemplairemateriel_ibfk_1` FOREIGN KEY (`MaterielID`) REFERENCES `materiel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exemplairemateriel_ibfk_2` FOREIGN KEY (`SalleID`) REFERENCES `salle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fanspublication`
--
ALTER TABLE `fanspublication`
  ADD CONSTRAINT `fanspublication_ibfk_1` FOREIGN KEY (`PublicationID`) REFERENCES `publication` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fanspublication_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fonctionpersonnel`
--
ALTER TABLE `fonctionpersonnel`
  ADD CONSTRAINT `fonctionpersonnel_ibfk_1` FOREIGN KEY (`EtablissementID`) REFERENCES `etablissement` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fonctionpersonnel_ibfk_2` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fonctionpersonnel_ibfk_3` FOREIGN KEY (`FonctionID`) REFERENCES `fonction` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inspecteur`
--
ALTER TABLE `inspecteur`
  ADD CONSTRAINT `inspecteur_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inspecteur_ibfk_2` FOREIGN KEY (`SpecialiteID`) REFERENCES `specialite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inspection`
--
ALTER TABLE `inspection`
  ADD CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`InspecteurUtilisateurID`) REFERENCES `inspecteur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inspection_ibfk_2` FOREIGN KEY (`CahierTexteID`) REFERENCES `cahiertexte` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invitation`
--
ALTER TABLE `invitation`
  ADD CONSTRAINT `invitation_ibfk_1` FOREIGN KEY (`UtilisateurID2`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invitation_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jalon`
--
ALTER TABLE `jalon`
  ADD CONSTRAINT `jalon_ibfk_1` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `livrableprojet`
--
ALTER TABLE `livrableprojet`
  ADD CONSTRAINT `livrableprojet_ibfk_1` FOREIGN KEY (`JalonID`) REFERENCES `jalon` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`CouvertureLivreID`) REFERENCES `couverturelivre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`DomaineLivreID`) REFERENCES `domainelivre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`TypeMaterielID`) REFERENCES `typemateriel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matiere_inspecteur`
--
ALTER TABLE `matiere_inspecteur`
  ADD CONSTRAINT `matiere_inspecteur_ibfk_1` FOREIGN KEY (`InspecteurUtilisateurID`) REFERENCES `inspecteur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `matiere_inspecteur_ibfk_2` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `membrejury`
--
ALTER TABLE `membrejury`
  ADD CONSTRAINT `membrejury_ibfk_1` FOREIGN KEY (`FonctionJuryID`) REFERENCES `fonctionjury` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membrejury_ibfk_2` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `membrejury_ibfk_3` FOREIGN KEY (`SoutenanceID`) REFERENCES `soutenance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`UtilisateurID2`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notation`
--
ALTER TABLE `notation`
  ADD CONSTRAINT `notation_ibfk_1` FOREIGN KEY (`TypeNoteID`) REFERENCES `typenote` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notation_ibfk_2` FOREIGN KEY (`PersonnelUtilisateurID`) REFERENCES `personnel` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notecontrole`
--
ALTER TABLE `notecontrole`
  ADD CONSTRAINT `notecontrole_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notecontrole_ibfk_2` FOREIGN KEY (`ControleID`) REFERENCES `controle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noteexamen`
--
ALTER TABLE `noteexamen`
  ADD CONSTRAINT `noteexamen_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noteexamen_ibfk_2` FOREIGN KEY (`ExamenID`) REFERENCES `examen` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noteprojet`
--
ALTER TABLE `noteprojet`
  ADD CONSTRAINT `noteprojet_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noteprojet_ibfk_2` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notestage`
--
ALTER TABLE `notestage`
  ADD CONSTRAINT `notestage_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notestage_ibfk_2` FOREIGN KEY (`StageID`) REFERENCES `stage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `panne`
--
ALTER TABLE `panne`
  ADD CONSTRAINT `panne_ibfk_1` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `panne_ibfk_2` FOREIGN KEY (`ExemplaireMaterielID`) REFERENCES `exemplairemateriel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parent`
--
ALTER TABLE `parent`
  ADD CONSTRAINT `parent_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission`
--
ALTER TABLE `permission`
  ADD CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`RessourceID`) REFERENCES `ressource` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`RoleID`) REFERENCES `role` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `personnel`
--
ALTER TABLE `personnel`
  ADD CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`CadreID`) REFERENCES `cadre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_3` FOREIGN KEY (`SituationAdministrativeID`) REFERENCES `situationadministrative` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personnel_ibfk_4` FOREIGN KEY (`FonctionActuelleID`) REFERENCES `fonction` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phase`
--
ALTER TABLE `phase`
  ADD CONSTRAINT `phase_ibfk_1` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `professeur_ibfk_2` FOREIGN KEY (`CycleID`) REFERENCES `cycle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `professeur_ibfk_3` FOREIGN KEY (`SpecialiteID`) REFERENCES `specialite` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `professeur_projet`
--
ALTER TABLE `professeur_projet`
  ADD CONSTRAINT `professeur_projet_ibfk_1` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `professeur_projet_ibfk_2` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`CahierChargeProjetID`) REFERENCES `cahierchargeprojet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projet_ibfk_2` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projet_ibfk_3` FOREIGN KEY (`SoutenanceID`) REFERENCES `soutenance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projet_ibfk_4` FOREIGN KEY (`DisciplineID`) REFERENCES `discipline` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projet_etudiant`
--
ALTER TABLE `projet_etudiant`
  ADD CONSTRAINT `projet_etudiant_ibfk_1` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projet_etudiant_ibfk_2` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `province_ibfk_1` FOREIGN KEY (`RegionID`) REFERENCES `region` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_ibfk_2` FOREIGN KEY (`DocumentPublicationID`) REFERENCES `documentpublication` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `publication_ibfk_3` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rapportprojet`
--
ALTER TABLE `rapportprojet`
  ADD CONSTRAINT `rapportprojet_ibfk_1` FOREIGN KEY (`ProjetID`) REFERENCES `projet` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rapportstage`
--
ALTER TABLE `rapportstage`
  ADD CONSTRAINT `rapportstage_ibfk_1` FOREIGN KEY (`StageID`) REFERENCES `stage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reparartion`
--
ALTER TABLE `reparartion`
  ADD CONSTRAINT `reparartion_ibfk_1` FOREIGN KEY (`PanneID`) REFERENCES `panne` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservationbibliotheque`
--
ALTER TABLE `reservationbibliotheque`
  ADD CONSTRAINT `reservationbibliotheque_ibfk_1` FOREIGN KEY (`LivreID`) REFERENCES `livre` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservationbibliotheque_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservationmateriel`
--
ALTER TABLE `reservationmateriel`
  ADD CONSTRAINT `reservationmateriel_ibfk_1` FOREIGN KEY (`MaterielID`) REFERENCES `materiel` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservationmateriel_ibfk_2` FOREIGN KEY (`UtilisateurID`) REFERENCES `utilisateur` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`TypeSalleID`) REFERENCES `typesalle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `salle_ibfk_2` FOREIGN KEY (`BlocID`) REFERENCES `bloc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scolarite`
--
ALTER TABLE `scolarite`
  ADD CONSTRAINT `scolarite_ibfk_1` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scolarite_ibfk_2` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `scolarite_ibfk_3` FOREIGN KEY (`MentionID`) REFERENCES `mention` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`SeanceGeneriqueID`) REFERENCES `seancegenerique` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seancegenerique`
--
ALTER TABLE `seancegenerique`
  ADD CONSTRAINT `seancegenerique_ibfk_1` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seancegenerique_ibfk_2` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seancegenerique_ibfk_3` FOREIGN KEY (`ModuleID`) REFERENCES `module` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seancegenerique_ibfk_4` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seancegenerique_ibfk_5` FOREIGN KEY (`SalleID`) REFERENCES `salle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seancegenerique_ibfk_6` FOREIGN KEY (`PeriodeID`) REFERENCES `periode` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `soutenance`
--
ALTER TABLE `soutenance`
  ADD CONSTRAINT `soutenance_ibfk_1` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_2` FOREIGN KEY (`SalleID`) REFERENCES `salle` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_3` FOREIGN KEY (`MatiereID`) REFERENCES `matiere` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_4` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_5` FOREIGN KEY (`DocumentEvaluationID`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_6` FOREIGN KEY (`DocumentEvaluationID2`) REFERENCES `documentevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `soutenance_ibfk_7` FOREIGN KEY (`FormeEvaluationID`) REFERENCES `formeevaluation` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`EncadrantStageID`) REFERENCES `encadrantstage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_2` FOREIGN KEY (`TypeStageID`) REFERENCES `typestage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_3` FOREIGN KEY (`ClasseID`) REFERENCES `classe` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_4` FOREIGN KEY (`EtudiantUtilisateurID`) REFERENCES `etudiant` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_5` FOREIGN KEY (`OrganismeID`) REFERENCES `organisme` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_ibfk_6` FOREIGN KEY (`SoutenanceID`) REFERENCES `soutenance` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stage_professeur`
--
ALTER TABLE `stage_professeur`
  ADD CONSTRAINT `stage_professeur_ibfk_1` FOREIGN KEY (`StageID`) REFERENCES `stage` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stage_professeur_ibfk_2` FOREIGN KEY (`ProfesseurUtilisateurID`) REFERENCES `professeur` (`UtilisateurID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `tache_ibfk_1` FOREIGN KEY (`PhaseID`) REFERENCES `phase` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
