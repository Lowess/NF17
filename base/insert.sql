-- Script d'insertion en base
INSERT INTO tRayon (theme) VALUES ('Nouveautes');
INSERT INTO tRayon (theme) VALUES ('Frais libre service');
INSERT INTO tRayon (theme) VALUES ('Frais traditionnel');
INSERT INTO tRayon (theme) VALUES ('Charcuterie');
INSERT INTO tRayon (theme) VALUES ('Cremerie');
INSERT INTO tRayon (theme) VALUES ('Traiteur');
INSERT INTO tRayon (theme) VALUES ('Surgeles');
INSERT INTO tRayon (theme) VALUES ('Epicerie');
INSERT INTO tRayon (theme) VALUES ('Boissons sans alcool');
INSERT INTO tRayon (theme) VALUES ('Vins et Spiritueux');
INSERT INTO tRayon (theme) VALUES ('Hygiene parfumerie');
INSERT INTO tRayon (theme) VALUES ('Entretien');
INSERT INTO tRayon (theme) VALUES ('Maison');
INSERT INTO tRayon (theme) VALUES ('Produit BIO et ecologique');

INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (1,'Jambon Herta x4', to_timestamp('12 Jun 2012', 'DD Mon YYYY'), 2.64, 40, 'Viandes', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (2,'Spaghetti Panzani 3min', to_timestamp('31 Dec 2012', 'DD Mon YYYY'), 1.81, 100, 'Pates', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (3,'Pack de lait Paturage de France', to_timestamp('11 Aug 2012', 'DD Mon YYYY'), 4.12, 40, 'Produits Laitiers', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (4,'La laitiere mousse au chocolat x4', to_timestamp('21 Jul 2012', 'DD Mon YYYY'), 3.08, 20, 'Produits Laitiers', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (5,'Curry Ducros 250ml', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 2.96, 5, 'Epices', 0, 'Nouveautes');
--~Cremerie&nouveaute
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (6,'ACTIVIA NATURE DANONE 4X125G', to_timestamp('12 Jun 2012', 'DD Mon YYYY'), 1.41, 20, 'Yaourts', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (7,'VELOUTE FRUIX DANONE 16X125G', to_timestamp('31 Jun 2012', 'DD Mon YYYY'), 4.06, 20, 'Yaourts', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (8,'KINDER CHOCO FRESH 5X21G', to_timestamp('11 Aug 2012', 'DD Mon YYYY'), 1.70, 40, 'Desserts', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (9,'LAIT DEMI ECREME LESCURE 1L', to_timestamp('21 Jul 2012', 'DD Mon YYYY'), 0.71, 80, 'Produits Laitiers', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (10,'BEURRE DEMI-SEL GASTRONOMIQUE PRESIDENT 250G ', to_timestamp('31 Jan 2013', 'DD Mon YYYY'), 1.75, 30, 'Beurre', 0, 'Nouveautes');
--~Charcuterie&nouveaute&bio
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (11,'JAMBON 2 TRANCHES AUCHAN 90G', to_timestamp('01 jun 2012', 'DD Mon YYYY'), 1.6, 50, 'Jambons', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (12,'SAUCISSES FUMEES X4 COOPERL 360G', to_timestamp('31 Jun 2012', 'DD Mon YYYY'), 2.95, 50, 'Saucisses', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (13,'COPPA ITALIENNE 73G', to_timestamp('11 Jun 2012', 'DD Mon YYYY'), 2.00, 40, 'Charcuterie tranchee', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (14,'JAMBON DE BAYONNE 6 TRANCHES DELPEYRAT 100G', to_timestamp('21 Jul 2012', 'DD Mon YYYY'), 3.79, 50, 'Jambons', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (15,'QUART DE JAMBON SEC 10 TRANCHES AUCHAN 250G ', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 4.41, 50, 'Jambons', 0, 'Nouveautes');
--~traiteur&nouveaute&bio
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (16,'SANDWICH JAMBON/EMMENTAL AUCHAN 145G', to_timestamp('01 Jul 2012', 'DD Mon YYYY'), 1.22, 20, 'Sandwiches snacks', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (17,'CHEESE BURGER X2 CHARAL 145G', to_timestamp('31 Jun 2012', 'DD Mon YYYY'), 5.21, 20, 'Sandwiches snacks', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (18,'COUSCOUS VIANDE 1KG', to_timestamp('11 Jun 2012', 'DD Mon YYYY'), 6.99, 20, 'Traiteur traditionnel', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (19,'TOMATES CONFITES 150G', to_timestamp('21 Jul 2012', 'DD Mon YYYY'), 2.49, 20, 'Traiteur traditionnel', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (20,'PIZZA CAPRICCIOSA AUCHAN 450 ', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 3.19, 20, 'Pizzas', 0, 'Nouveautes');
--~Surgeles&nouveaute
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (21,'STEACK HACHE 100% PUR BOEUF X10 AUCHAN 1KG', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 5.58, 30, 'viande hachee', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (22,'LE PUR BOEUF X10 CHARAL 1KG', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 8.17, 30, ' viande hachee', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (23,'MOULES DECORTIQUEES CUITES 400G', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 3.90, 30, 'poisson', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (24,'CREVETTES BLACK TIGER ENTIERES CRUES 400G', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 5.99, 30, 'poisson', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (25,'NOIX DE SAINT-JACQUES SANS CORAIL 300G', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 6.36, 30, 'poisson', 0, 'Nouveautes');
--~Epicerie&bio
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (26,'PERSIL AUCHAN 10G ', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 1.05, 80, 'sauce condiment', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (27,'AIL SEMOULE AUCHAN 70G', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 0.76, 120, 'sauce condiment', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (28,'SOUPE POTIRON/CHATAIGNE LIEBIG 1L', to_timestamp('11 Jun 2012', 'DD Mon YYYY'), 3.04, 40, 'potages', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (29,'KETCHUP BIO TOP DOWN AUCHAN 282G', to_timestamp('11 Jun 2012', 'DD Mon YYYY'),1.74, 40, 'sauce condiment', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (30,'CONFIPOTE ABRICOTS MATERNE 350G', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 1.84, 60, 'confiture', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (31,'PATE A TARTINER NUTELLA 750G', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 3.99, 60, 'pate a tartiner', 0, 'Nouveautes');
--~Boissons sans alcool&nouveaute&bio
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (32,'EAU MINERALE NATURELLE EVIAN 6X1L', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 2.94, 80, 'eaux plates', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (33,'EAU DE SOURCE CRISTALINE 1.5L', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 0.22, 120, 'eaux plates', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (34,'JUS DE RAISIN AUCHAN 1L', to_timestamp('11 Jun 2012', 'DD Mon YYYY'), 1.99, 40, 'jus de fruits frais', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (35,'JUS MULTIVITAMINE AUCHAN 1L', to_timestamp('11 Jun 2012', 'DD Mon YYYY'),2.27, 40, 'jus de fruits frais', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (36,'EAU MINERALE NATURELLE GAZEUSE BADOIT ROUGE 6X1L', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 4.08, 60, 'eaux gazeuzes', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (37,'JUS DE CAROTTE AUCHAN BIO 1L', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 2.41, 60, 'jus de fruits frais', 0, 'Nouveautes');
--~Vins et Spiritueux&nouveaute
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (38,'WHISKY JAMESON 40% 70CL ', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 18.41, 30, 'whiskies bourbons', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (39,'BASE IRISH COFFEE .BAILEYS 17% 70CL', to_timestamp('31 Jan 2014', 'DD Mon YYYY'), 14.61, 30, 'whiskies bourbons', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (40,'GRAVES P.CHANAU 10 75CL', to_timestamp('11 Jun 2012', 'DD Mon YYYY'),4.29, 40, 'vin rouge', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (41,'BORDEAUX BLAISSAC 3L', to_timestamp('11 Jun 2012', 'DD Mon YYYY'),6.99, 40, 'vin rouge', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (42,'BORDEAUX BLAISSAC 1.5L', to_timestamp('11 Jun 2012', 'DD Mon YYYY'),13.29, 40, 'vin rouge', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (43,'BORDEAUX CHATEAU TALMONT 10 75CL', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 3.55, 60, 'vin rouge', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (44,'CHATEAU TALUSSON 11 75CL', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 3.25, 50, 'vin blanc', 0, 'Nouveautes');
--~Hygiene parfumerie&nouveaute
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (45,'DENTIFRICE HALEINE PURE SIGNAL 75ML', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 1.93, 100, 'soins dentaires', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (46,'BROSSE A DENTS EXTRA CLEAN MEDIUM X4 COLGATE', to_timestamp('31 Jan 2016', 'DD Mon YYYY'), 3.01, 100, 'soins dentaires', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (47,'GEL DOUCHE LAIT ET VANILLE AUCHAN 300ML', to_timestamp('31 Jun 2016', 'DD Mon YYYY'), 1.61, 50, 'la toilette', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (48,'SAVON LAVANDE LE PETIT OLIVIER 250G', to_timestamp('31 Jan 2016', 'DD Mon YYYY'), 2.46, 80, 'la toilette', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (49,'ESSUIE TOUT DECOREE AUCHAN X3', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 2.93, 100, 'essuie', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (50,'ESSUIE TOUT DECORE X3 AUCHAN', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 3.65, 100, 'essuie', 0, 'Nouveautes');
--~Entretien&nouveaute&bio
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (51,'PASTILLES LAVE VAISSELLE X45', to_timestamp('31 Jan 2016', 'DD Mon YYYY'), 4.59, 60, 'produits vaisselle', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (52,'RENOV LAVE VAISSELLE AUCHAN 250ML', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 2.86, 30, 'produits vaisselle', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (53,'MANCHE + 5 PLUMEAUX DEPOUSSIERANTS AUCHAN', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 3.15, 60, 'brosserie', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (54,'ENSEMBLE PELLE BALAYETTE', to_timestamp('01 Jun 2015', 'DD Mon YYYY'), 2.09, 10, 'brosserie', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (55,'FRANGES COTON 100G', to_timestamp('31 Jan 2015', 'DD Mon YYYY'), 1.20, 10, 'brosserie', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (56,'NETTOYANT VITRE RECHARGE AUCHAN 500ML', to_timestamp('19 Jun 2012', 'DD Mon YYYY'), 1.14, 10, 'nettoyants menagers', 0, 'Nouveautes');
--~Mayson&nouveaute
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (57,'AMPOULE ECOCLASSIC 42W PHILIPS', to_timestamp('31 Jan 2017', 'DD Mon YYYY'), 3.50, 10, 'electriceite', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (58,'LINOLITE 310X38 OPALE 60W S19', to_timestamp('31 Jan 2017', 'DD Mon YYYY'), 4.34, 10, 'electriceite', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (59,'CARAFE MARELLA COOL BLANC BRITA', to_timestamp('31 Jan 2017', 'DD Mon YYYY'), 22.10, 10, 'accessoires de cuisine', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (60,'LOT 3 USTENSILES DE CUISINE EN BOIS', to_timestamp('31 Jan 2017', 'DD Mon YYYY'), 2.69, 10, 'accessoires de cuisine', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (61,'PETITES CUILLERES X24 TRANSPARENTES AUCHAN', to_timestamp('31 Jan 2017', 'DD Mon YYYY'), 2.09, 10, 'art de la table', 0, 'Nouveautes');
--~Produit BIO et ecologique
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (62,'COURGETTE BIO 1KG', to_timestamp('19 Jun 2012', 'DD Mon YYYY'), 2.95, 10, 'fruits et legumes', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (63,'POIVRON PANACHE BIO 250G', to_timestamp('19 Jun 2012', 'DD Mon YYYY'), 2.59, 10, 'fruits et legumes', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (64,'ACTIVIA NATURE DANONE 4X125G', to_timestamp('12 Jun 2012', 'DD Mon YYYY'), 1.41, 20, 'Yaourts', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (65,'LE PUR BOEUF X10 CHARAL 1KG', to_timestamp('23 Aug 2012', 'DD Mon YYYY'), 8.17, 30, ' viande hachee', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (66,'SANDWICH JAMBON/EMMENTAL AUCHAN 145G', to_timestamp('01 Jul 2012', 'DD Mon YYYY'), 1.22, 20, 'Sandwiches snacks', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (67,'JUS DE CAROTTE AUCHAN BIO 1L', to_timestamp('31 Jul 2012', 'DD Mon YYYY'), 2.41, 60, 'jus de fruits frais', 0, 'Nouveautes');
INSERT INTO tProduit (id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (68,'NETTOYANT VITRE RECHARGE AUCHAN 500ML', to_timestamp('19 Jun 2012', 'DD Mon YYYY'), 1.14, 10, 'nettoyants menagers', 0, 'Nouveautes');

INSERT INTO tAssociation (id, theme) VALUES (1, 'Frais libre service');
INSERT INTO tAssociation (id, theme) VALUES (2, 'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES (3, 'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (4, 'Frais libre service');
INSERT INTO tAssociation (id, theme) VALUES (5, 'Epicerie');

INSERT INTO tAssociation (id, theme) VALUES (6, 'Cremerie');
INSERT INTO tAssociation (id, theme) VALUES (7, 'Cremerie');
INSERT INTO tAssociation (id, theme) VALUES (8, 'Cremerie');
INSERT INTO tAssociation (id, theme) VALUES (9, 'Cremerie');
INSERT INTO tAssociation (id, theme) VALUES (10,'Cremerie');

INSERT INTO tAssociation (id, theme) VALUES (11, 'Charcuterie');
INSERT INTO tAssociation (id, theme) VALUES (12, 'Charcuterie');
INSERT INTO tAssociation (id, theme) VALUES (13, 'Charcuterie');
INSERT INTO tAssociation (id, theme) VALUES (14, 'Charcuterie');
INSERT INTO tAssociation (id, theme) VALUES (15, 'Charcuterie');

INSERT INTO tAssociation (id, theme) VALUES (16, 'Traiteur');
INSERT INTO tAssociation (id, theme) VALUES (17, 'Traiteur');
INSERT INTO tAssociation (id, theme) VALUES (18, 'Traiteur');
INSERT INTO tAssociation (id, theme) VALUES (19, 'Traiteur');
INSERT INTO tAssociation (id, theme) VALUES (20, 'Traiteur');

INSERT INTO tAssociation (id, theme) VALUES (21,'Surgeles');
INSERT INTO tAssociation (id, theme) VALUES (22,'Surgeles');
INSERT INTO tAssociation (id, theme) VALUES (23,'Surgeles');
INSERT INTO tAssociation (id, theme) VALUES (24,'Surgeles');
INSERT INTO tAssociation (id, theme) VALUES (25,'Surgeles');

INSERT INTO tAssociation (id, theme) VALUES  (26,'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES  (27,'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES  (28,'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES  (29,'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES  (30,'Epicerie');
INSERT INTO tAssociation (id, theme) VALUES  (31,'Epicerie');

INSERT INTO tAssociation (id, theme) VALUES (32,'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (33,'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (34,'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (35,'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (36,'Boissons sans alcool');
INSERT INTO tAssociation (id, theme) VALUES (37,'Boissons sans alcool');

INSERT INTO tAssociation (id, theme) VALUES  (38,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (39,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (40,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (41,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (42,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (43,'Vins et Spiritueux');
INSERT INTO tAssociation (id, theme) VALUES  (44,'Vins et Spiritueux');

INSERT INTO tAssociation (id, theme) VALUES (45,'Hygiene parfumerie');
INSERT INTO tAssociation (id, theme) VALUES (46,'Hygiene parfumerie');
INSERT INTO tAssociation (id, theme) VALUES (47,'Hygiene parfumerie');
INSERT INTO tAssociation (id, theme) VALUES (48,'Hygiene parfumerie');
INSERT INTO tAssociation (id, theme) VALUES (49,'Hygiene parfumerie');
INSERT INTO tAssociation (id, theme) VALUES (50,'Hygiene parfumerie');

INSERT INTO tAssociation (id, theme) VALUES (51,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (52,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (53,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (54,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (55,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (56,'Entretien');
INSERT INTO tAssociation (id, theme) VALUES (57,'Entretien');

INSERT INTO tAssociation (id, theme) VALUES  (58,'Mayson');
INSERT INTO tAssociation (id, theme) VALUES  (59,'Mayson');
INSERT INTO tAssociation (id, theme) VALUES  (60,'Mayson');
INSERT INTO tAssociation (id, theme) VALUES  (61,'Mayson');

INSERT INTO tAssociation (id, theme) VALUES  (62,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (63,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (64,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (65,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (66,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (67,'Produit BIO et ecologique');
INSERT INTO tAssociation (id, theme) VALUES  (68,'Produit BIO et ecologique');

INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Florian', 'azerty', 'Dambrine', 'Florian', '18 residence Jean Audegond 80470 Ailly/Sur/Somme', 21, 514);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Tudor', 'azerty', 'Luchiancenco', 'Tudor', '5 rue Pierre Sauvage 60200 Compiegne', 21, 245);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Pierre', 'azerty', 'Fayolle', 'Pierre', '10 rue Leon Blum 60200 Compiegne', 21, 33);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Qifan', 'azerty', 'Zheng', 'Qifan', '92 rue Pierre Guillaumat 60200 Compiegne', 20, 0);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Mickael', 'azerty', 'Mickael', 'Macquet', '3bis rue Clement Bayard 60200 Compiegne', 22, 1048);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Olivia', 'azerty', 'Olivia', 'Reaney', '114 avenue de la Marne 60200 Compiegne', 23, 687);
INSERT INTO tClient (login, mdp, nom, prenom, adresse, age, pointFidelite) VALUES ('Vanessa', 'azerty', 'Vanessa', 'Wolinne', '22 rue de Vignacourt 80420 Flixecourt', 22, 15);

INSERT INTO tPanier (id, datePanier, login) VALUES (1, to_timestamp('12 May 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (2, to_timestamp('28 Apr 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (3, to_timestamp('26 Apr 2012', 'DD Mon YYYY'), 'Florian');
INSERT INTO tPanier (id, datePanier, login) VALUES (4, to_timestamp('21 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (5, to_timestamp('11 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (6, to_timestamp('08 Apr 2012', 'DD Mon YYYY'), 'Tudor');
INSERT INTO tPanier (id, datePanier, login) VALUES (7, to_timestamp('26 May 2012', 'DD Mon YYYY'), 'Pierre');
INSERT INTO tPanier (id, datePanier, login) VALUES (8, to_timestamp('06 May 2012', 'DD Mon YYYY'), 'Pierre');
INSERT INTO tPanier (id, datePanier, login) VALUES (9, to_timestamp('17 Mar 2012', 'DD Mon YYYY'), 'Pierre');
INSERT INTO tPanier (id, datePanier, login) VALUES (10, to_timestamp('23 May 2012', 'DD Mon YYYY'), 'Qifan');
INSERT INTO tPanier (id, datePanier, login) VALUES (11, to_timestamp('09 Mar 2012', 'DD Mon YYYY'), 'Qifan');
INSERT INTO tPanier (id, datePanier, login) VALUES (12, to_timestamp('27 Feb 2012', 'DD Mon YYYY'), 'Mickael');
INSERT INTO tPanier (id, datePanier, login) VALUES (13, to_timestamp('8 Feb 2012', 'DD Mon YYYY'), 'Olivia');

INSERT INTO tContient VALUES (5,1,3,2.96);
INSERT INTO tContient VALUES (15,1,3,4.41);
INSERT INTO tContient VALUES (25,1,1,6.36);
INSERT INTO tContient VALUES (35,1,2,2.27);
INSERT INTO tContient VALUES (45,1,3,1.93);

--1--26
INSERT INTO tContient VALUES (1,2,3,2.64);
INSERT INTO tContient VALUES (6,2,1,1.41);
INSERT INTO tContient VALUES (11,2,1,1.6);
INSERT INTO tContient VALUES (16,2,3,1.22);
INSERT INTO tContient VALUES (21,2,2,5.58);
INSERT INTO tContient VALUES (26,2,1,1.05);

--3--33
INSERT INTO tContient VALUES (3,3,3,4.12);
INSERT INTO tContient VALUES (13,3,5,2.00);
INSERT INTO tContient VALUES (23,3,6,3.90);
INSERT INTO tContient VALUES (33,3,3,0.22);

--9--49
INSERT INTO tContient VALUES (9,4,3,0.71);
INSERT INTO tContient VALUES (49,4,7,2.93);

--4--39
INSERT INTO tContient VALUES (4,5,3,3.08);
INSERT INTO tContient VALUES (9,5,3,0.71);
INSERT INTO tContient VALUES (14,5,9,3.79);
INSERT INTO tContient VALUES (19,5,10,2.49);
INSERT INTO tContient VALUES (24,5,3,5.99);
INSERT INTO tContient VALUES (29,5,3,1.74);
INSERT INTO tContient VALUES (34,5,15,1.99);
INSERT INTO tContient VALUES (39,5,3,14.61);

--17--47
INSERT INTO tContient VALUES (17,7,3,5.21);
INSERT INTO tContient VALUES (27,7,3,0.76);
INSERT INTO tContient VALUES (37,7,3,2.41);
INSERT INTO tContient VALUES (47,7,3,1.61);

INSERT INTO tContient VALUES (57,8,7,3.5);
INSERT INTO tContient VALUES (67,8,1,2.41);

INSERT INTO tContient VALUES (27,9,3,0.76);

INSERT INTO tContient VALUES (2,10,3,1.81);
INSERT INTO tContient VALUES (7,10,3,4.06);
INSERT INTO tContient VALUES (12,10,3,2.95);
INSERT INTO tContient VALUES (17,10,3,5.21);
INSERT INTO tContient VALUES (47,10,3,1.61);

INSERT INTO tContient VALUES (22,12,3,8.17);
INSERT INTO tContient VALUES (32,12,3,2.94);
INSERT INTO tContient VALUES (42,12,3,6.99);

INSERT INTO tResponsableLivraison(login,mdp) VALUES ('Simon','Ladmin');
INSERT INTO tResponsableLivraison(login,mdp) VALUES ('Laurent','Ladmin');

INSERT INTO tResponsableCatalogue(login,mdp) VALUES ('Michel','Cadmin');
INSERT INTO tResponsableCatalogue(login,mdp) VALUES ('David','Cadmin');

INSERT INTO tLivreur(login,mdp) VALUES ('Legrand','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Robin','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Chevalier','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Fontaine','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Lopez','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Dumont','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Gauthier','Livreur');
INSERT INTO tLivreur(login,mdp) VALUES ('Clement','Livreur');

INSERT INTO tResponsableMarketing(login,mdp,baremePoint) VALUES ('Thomas','Madmin',50.0);
INSERT INTO tResponsableMarketing(login,mdp,baremePoint) VALUES ('Moreau','Madmin',50.0);

INSERT INTO tTournee(id,dateTournee) VALUES (1, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (2, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (3, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (4, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (5, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (6, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));
INSERT INTO tTournee(id,dateTournee) VALUES (7, to_timestamp('12 May 2012 00:30:00', 'DD Mon YYYY HH24:MI:SS '));


INSERT INTO tRealise(idTournee,idLivreur) VALUES (1, 'Legrand');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (2, 'Chevalier');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (3, 'Fontaine');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (4, 'Dumont');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (5, 'Dumont');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (6, 'Clement');
INSERT INTO tRealise(idTournee,idLivreur) VALUES (7, 'Clement');


INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (1, to_timestamp('12 May 2012 12:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'18 residence Jean Audegond 80470 Ailly/Sur/Somme',1);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (2, to_timestamp('12 May 2012 12:30:06', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'18 residence Jean Audegond 80470 Ailly/Sur/Somme',2);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (4, to_timestamp('12 May 2012 01:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'5 rue Pierre Sauvage 60200 Compiegne',2);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (7, to_timestamp('12 May 2012 15:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'10 rue Leon Blum 60200 Compiegne',3);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (8, to_timestamp('12 May 2012 22:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'10 rue Leon Blum 60200 Compiegne',3);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (10, to_timestamp('12 May 2012 19:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'92 rue Pierre Guillaumat 60200 Compiegne',3);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (11, to_timestamp('12 May 2012 10:00:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'92 rue Pierre Guillaumat 60200 Compiegne',4);
INSERT INTO tCommande(idPanier,dateValidation,etatCmd,heureLivraison,lieuLivraison,idTournee) VALUES (12, to_timestamp('12 May 2012 23:30:00', 'DD Mon YYYY HH24:MI:SS '),'en preparation',to_timestamp('14:30:00', 'HH24:MI:SS'),'3bis rue Clement Bayard 60200 Compiegne',1);
