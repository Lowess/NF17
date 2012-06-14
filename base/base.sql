-- Script de construction de la base

------------------------------------------------------------------------
-- CONVENTION
------------------------------------------------------------------------

--- 1) Les noms de tables
-- 		a) Les noms de tables se note précédé d'un "t"
--
-- 		Exemple:
-- 			tEtudiant
--		b) Pas de pluriel!
--		c) Reprendre les noms donnés dans le MLD*
--
--		* pour identifiant on pourra se permettre id
---

--- 2) Les noms d'attributs
-- 		a) Les noms de d'attibuts commencent par une minuscule
--
-- 		Exemple:
-- 			nom
--			identifiant
--		b) Si nom composé alors mettre majuscule au deuxième
--
--		Exemple:
--			nomComposeQuiEstUnPeuLong
---

------------------------------------------------------------------------

------------------------------------------------------------------------
-- NOTE
------------------------------------------------------------------------

--- 1)
-- On préférera le type INT au lieu du type DATE & HEURE, 
-- ce qui facilitera les calculs
---

------------------------------------------------------------------------
--DROP DATABASE supermarche

--CREATE DATABASE supermarche

CREATE TABLE IF NOT EXISTS tRayon(
	theme VARCHAR(200) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS tProduit(
	id INT PRIMARY KEY,
	nom VARCHAR(200),
	datePeremption TIMESTAMP,
	prixDeBase FLOAT,
	stock INT,
	categorie VARCHAR(200),
	baremePromo FLOAT,
	idRayon VARCHAR(200) NOT NULL,
	FOREIGN KEY (idRayon) REFERENCES tRayon (theme)
);
CREATE SEQUENCE seq_tProduit;

CREATE TABLE IF NOT EXISTS tAssociation(
	id INT NOT NULL,
	theme VARCHAR(50) NOT NULL,
	FOREIGN KEY (id) REFERENCES tProduit (id),
	FOREIGN KEY (theme) REFERENCES tRayon (theme),
	PRIMARY KEY (id, theme) -- Clé binaire
);

CREATE TABLE IF NOT EXISTS tClient(
	login VARCHAR(50) PRIMARY KEY,
	mdp VARCHAR(50) NOT NULL,
	nom VARCHAR(100) NOT NULL,
	prenom VARCHAR(100) NOT NULL,
	adresse VARCHAR(200),
	age INT,
	pointFidelite INT
);

CREATE TABLE IF NOT EXISTS tPanier(
	id INT PRIMARY KEY,
	datePanier TIMESTAMP,
	login VARCHAR(50),
	FOREIGN KEY (login) REFERENCES tClient (login)
);

CREATE TABLE IF NOT EXISTS tContient(
	idProduit INT NOT NULL,
	idPanier INT NOT NULL,
	quantite INT,
	prixPublicUnitaire FLOAT,
	FOREIGN KEY (idProduit) REFERENCES tProduit (id),
	FOREIGN KEY (idPanier) REFERENCES tPanier (id),
	PRIMARY KEY (idProduit, idPanier) -- Clé binaire
);

CREATE TABLE IF NOT EXISTS tResponsableLivraison(
	login VARCHAR(50) PRIMARY KEY,
	mdp VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tResponsableCatalogue(
	login VARCHAR(50) PRIMARY KEY,
	mdp VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tLivreur(
	login VARCHAR(50) PRIMARY KEY,
	mdp VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS tResponsableMarketing(
	login VARCHAR(50) PRIMARY KEY,
	mdp VARCHAR(50) NOT NULL,
	baremePoint FLOAT
);

CREATE TABLE IF NOT EXISTS tTournee(
	id INT PRIMARY KEY, -- CHECK (id IN tLivreur), Contrainte impossible
	dateTournee TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS tRealise(
	idTournee INT NOT NULL,
	idLivreur VARCHAR(50) NOT NULL,
	FOREIGN KEY (idTournee) REFERENCES tTournee (id),
	FOREIGN KEY (idLivreur) REFERENCES tLivreur (login),
	PRIMARY KEY (idTournee, idLivreur)
);

-- Création d'un type ENUM pour tCommande.etat

CREATE TYPE eEtat AS ENUM ('en préparation', 'disponible', 'traitée');

-- Exemple de requete:
-- 	SELECT e.enumlabel 
--	FROM pg_enum e 
--	JOIN pg_type t ON (t.oid=e.enumtypid) 
--	WHERE t.typname='eEtat';

CREATE TABLE IF NOT EXISTS tCommande(
	idPanier INT PRIMARY KEY,
	dateValidation TIMESTAMP NOT NULL,
	etat eEtat NOT NULL,
	heureLivraison INT NOT NULL,
	lieuLivraison VARCHAR(200) NOT NULL,
	idTournee INT,
	FOREIGN KEY (idPanier) REFERENCES tPanier (id),
	FOREIGN KEY (idTournee) REFERENCES tTournee (id)
);

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

CREATE OR REPLACE VIEW
			vCommande (	idPanier, 
						datePanier, 
						login,
						dateValidation, 
						etat, 
						heureLivraison,
						lieuLivraison, 
						idTournee
					  )
			AS 
				SELECT  tPanier.id,
						tPanier.datePanier,
						tPanier.login,
						tCommande.dateValidation,
						e.enumlabel,
						tCommande.heureLivraison,
						tCommande.lieuLivraison,
						tCommande.idTournee
				FROM tPanier, tCommande, pg_enum e
				--Jointure enum
				JOIN pg_type t ON (t.oid=e.enumtypid) 
				-- Restriction enum
				WHERE t.typname='eEtat'
				--Condition de jointure vue
				AND tPanier.id = tCommande.idPanier
