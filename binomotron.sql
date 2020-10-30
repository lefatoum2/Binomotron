-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8081
-- Généré le : ven. 30 oct. 2020 à 10:06
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `binomotron`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenants`
--

CREATE TABLE `apprenants` (
  `id_apprenant` int(20) NOT NULL,
  `nom_apprenant` varchar(30) NOT NULL,
  `prenom_apprenant` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenants`
--

INSERT INTO `apprenants` (`id_apprenant`, `nom_apprenant`, `prenom_apprenant`) VALUES
(1, 'BOKALLI', 'Luigi'),
(2, 'BONNEAU', 'Amaury'),
(3, 'CHAIGNEAU', 'Thomas'),
(4, 'CLOATRE', 'Erwan'),
(5, 'FURIGA', 'Julien'),
(6, 'GUILLEN', 'Céline'),
(7, 'HERGOUALC\'H', 'Pereg'),
(8, 'IBANNI', 'Jamal'),
(9, 'KARFAOUI', 'Christelle'),
(10, 'LE BERRE', 'Baptiste'),
(11, 'LE GOFF', 'Baptiste'),
(12, 'LE JONCOUR', 'Jérémy'),
(13, 'LE MOAL', 'Patricia'),
(14, 'MAINTIER', 'Ludivine'),
(15, 'MBARGA MVOGO', 'Christian'),
(16, 'MOULARD', 'Eva'),
(17, 'PERTRON', 'Aude'),
(18, 'RIOUAL', 'Ronan'),
(19, 'SABIA', 'Paul'),
(20, 'VERPOEST', 'Guillaume');

-- --------------------------------------------------------

--
-- Structure de la table `apprenants_groupes_projets`
--

CREATE TABLE `apprenants_groupes_projets` (
  `id_apprenant` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `id_groupe` int(20) NOT NULL,
  `libelle_groupe` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `groupes`
--

INSERT INTO `groupes` (`id_groupe`, `libelle_groupe`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3'),
(4, 'Groupe 4'),
(5, 'Groupe 5'),
(6, 'Groupe 6'),
(7, 'Groupe 7'),
(8, 'Groupe 8'),
(9, 'Groupe 9'),
(10, 'Groupe 10'),
(11, 'Groupe 11'),
(12, 'Groupe 12'),
(13, 'Groupe 13'),
(14, 'Groupe 14'),
(15, 'Groupe 15'),
(16, 'Groupe 16'),
(17, 'Groupe 17'),
(18, 'Groupe 18'),
(19, 'Groupe 19'),
(20, 'Groupe 20');

-- --------------------------------------------------------

--
-- Structure de la table `projets`
--

CREATE TABLE `projets` (
  `id_projet` int(50) NOT NULL,
  `libelle_projet` varchar(50) NOT NULL,
  `date_projet` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `apprenants`
--
ALTER TABLE `apprenants`
  ADD PRIMARY KEY (`id_apprenant`);

--
-- Index pour la table `apprenants_groupes_projets`
--
ALTER TABLE `apprenants_groupes_projets`
  ADD KEY `id_apprenant` (`id_apprenant`),
  ADD KEY `id_groupe` (`id_groupe`),
  ADD KEY `id_projet` (`id_projet`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Index pour la table `projets`
--
ALTER TABLE `projets`
  ADD PRIMARY KEY (`id_projet`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `apprenants`
--
ALTER TABLE `apprenants`
  MODIFY `id_apprenant` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `groupes`
--
ALTER TABLE `groupes`
  MODIFY `id_groupe` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `projets`
--
ALTER TABLE `projets`
  MODIFY `id_projet` int(50) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `apprenants_groupes_projets`
--
ALTER TABLE `apprenants_groupes_projets`
  ADD CONSTRAINT `apprenants_groupes_projets_ibfk_1` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenants` (`id_apprenant`),
  ADD CONSTRAINT `apprenants_groupes_projets_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupes` (`id_groupe`),
  ADD CONSTRAINT `apprenants_groupes_projets_ibfk_3` FOREIGN KEY (`id_projet`) REFERENCES `projets` (`id_projet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
