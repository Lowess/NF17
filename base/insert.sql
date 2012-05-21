-- Script d'insertion en base
INSERT INTO tRayon (theme) VALUES ('Frais libre service');
INSERT INTO tRayon (theme) VALUES ('Frais traditionnel');
INSERT INTO tRayon (theme) VALUES ('Liquides');
INSERT INTO tRayon (theme) VALUES ('Loisirs');
INSERT INTO tRayon (theme) VALUES ('Textile');
INSERT INTO tRayon (theme) VALUES ('Epicerie');
INSERT INTO tRayon (theme) VALUES ('Droguerie Hygiène');
INSERT INTO tRayon (theme) VALUES ('Surgelés');
INSERT INTO tRayon (theme) VALUES ('Equipement de la maison');

INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (1,'Jambon Herta x4', to_timestamp('12 Jun 2012', 'DD Mon YYYY'), 2.64, 40, 'Viandes', 0);
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (2,'Spaghetti Panzani 3min', to_timestamp('31 Dec 2012', 'DD Mon YYYY'), 1.81, 100, 'Pâtes', 0);
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (3,'Pack de lait Paturage de France', to_timestamp('11 Aug 2012', 'DD Mon YYYY'), 4.12, 40, 'Produits Laitiers', 0);
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (4,'La laitière mousse au chocolat x4', to_timestamp('21 Jul 2012', 'DD Mon YYYY'), 3.08, 20, 'Produits Laitiers', 0);
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (5,'Curry Ducros 250ml', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 2.96, 5, 'Epices', 0);

--

INSERT INTO tAssociation (id, theme) VALUES (1, 'Frais libre service');
INSERT INTO tAssociation (id, theme) VALUES (2, 'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES (3, 'Liquides');
INSERT INTO tAssociation (id, theme) VALUES (4, 'Frais libre service');
INSERT INTO tAssociation (id, theme) VALUES (5, 'Epicerie');

INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Florian', 'azerty', 'Dambrine', 'Florian', '18 résidence Jean Audegond 80470 Ailly/Sur/Somme', 21, 514);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Tudor', 'azerty', 'Luchiancenco', 'Tudor', '5 rue Pierre Sauvage 60200 Compiègne', 21, 245);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Pierre', 'azerty', 'Fayolle', 'Pierre', '10 rue Leon Blum 60200 Compiègne', 21, 33);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Qifan', 'azerty', 'Qifan', 'Zheng', '92 rue Pierre Guillaumat 60200 Compiègne', 20, 0);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Mickael', 'azerty', 'Mickael', 'Macquet', '3bis rue Clément Bayard 60200 Compiègne', 22, 1048);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Olivia', 'azerty', 'Olivia', 'Reaney', '114 avenue de la Marne 60200 Compiègne', 23, 687);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Vanessa', 'azerty', 'Vanessa', 'Wolinne', '22 rue de Vignacourt 80420 Flixecourt', 22, 15);

INSERT INTO tPanier (id, datePanier, login) VALUES (1, to_timestamp('12 May 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (2, to_timestamp('28 Apr 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (3, to_timestamp('26 Apr 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (4, to_timestamp('21 Apr 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (5, to_timestamp('21 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (6, to_timestamp('11 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (7, to_timestamp('08 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (8, to_timestamp('16 Jan 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (9, to_timestamp('18 Mar 2012', 'DD Mon YYYY'), 'Olivia');
INSERT INTO tPanier (id, datePanier, login) VALUES (10, to_timestamp('6 Mar 2012', 'DD Mon YYYY'), 'Pierre');

--~ CREATE TABLE IF NOT EXISTS tContient(
	--~ idProduit INT NOT NULL,
	--~ idPanier INT NOT NULL,
	--~ quantite INT,
	--~ prixPublicUnitaire FLOAT,
	--~ FOREIGN KEY (idProduit) REFERENCES tProduit (id),
	--~ FOREIGN KEY (idPanier) REFERENCES tPanier (id),
	--~ PRIMARY KEY (idProduit, idPanier) -- Clé binaire
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tResponsableLivraison(
	--~ login VARCHAR(50) PRIMARY KEY,
	--~ mdp VARCHAR(50) NOT NULL
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tResponsableCatalogue(
	--~ login VARCHAR(50) PRIMARY KEY,
	--~ mdp VARCHAR(50) NOT NULL
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tLivreur(
	--~ login VARCHAR(50) PRIMARY KEY,
	--~ mdp VARCHAR(50) NOT NULL
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tResponsableMarketing(
	--~ login VARCHAR(50) PRIMARY KEY,
	--~ mdp VARCHAR(50) NOT NULL,
	--~ baremePoint FLOAT
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tTournee(
	--~ id INT PRIMARY KEY, -- CHECK (id IN tLivreur), Contrainte impossible
	--~ dateTournee TIMESTAMP NOT NULL
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tRealise(
	--~ idTournee INT NOT NULL,
	--~ idLivreur VARCHAR(50) NOT NULL,
	--~ FOREIGN KEY (idTournee) REFERENCES tTournee (id),
	--~ FOREIGN KEY (idLivreur) REFERENCES tLivreur (login),
	--~ PRIMARY KEY (idTournee, idLivreur)
--~ );
--~ 
--~ CREATE TABLE IF NOT EXISTS tCommande(
	--~ idPanier INT PRIMARY KEY,
	--~ dateValidation TIMESTAMP NOT NULL,
	--~ etat eEtat NOT NULL,
	--~ heureLivraison INT NOT NULL,
	--~ lieuLivraison VARCHAR(200) NOT NULL,
	--~ idTournee INT,
	--~ FOREIGN KEY (idPanier) REFERENCES tPanier (id),
	--~ FOREIGN KEY (idTournee) REFERENCES tTournee (id)
--~ );

