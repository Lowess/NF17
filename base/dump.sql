--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: eetat; Type: TYPE; Schema: public; Owner: supermarche
--

CREATE TYPE eetat AS ENUM (
    'en preparation',
    'disponible',
    'traitee'
);


ALTER TYPE public.eetat OWNER TO supermarche;

--
-- Name: trig_contient(); Type: FUNCTION; Schema: public; Owner: supermarche
--

CREATE FUNCTION trig_contient() RETURNS trigger
    LANGUAGE plpgsql
    AS $$			

    BEGIN

		update tproduit set stock = stock-NEW.quantite where id=NEW.idproduit;

		update tclient set pointfidelite = pointfidelite+(NEW.quantite*

															(select pointfidelite from tproduit where id=NEW.idproduit))

 					where login=(select login from tpanier where id=NEW.idpanier);

        RETURN NEW;

    END;

$$;


ALTER FUNCTION public.trig_contient() OWNER TO supermarche;

--
-- Name: seq_tpannier; Type: SEQUENCE; Schema: public; Owner: supermarche
--

CREATE SEQUENCE seq_tpannier
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_tpannier OWNER TO supermarche;

--
-- Name: seq_tpannier; Type: SEQUENCE SET; Schema: public; Owner: supermarche
--

SELECT pg_catalog.setval('seq_tpannier', 1, false);


--
-- Name: seq_tproduit; Type: SEQUENCE; Schema: public; Owner: supermarche
--

CREATE SEQUENCE seq_tproduit
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_tproduit OWNER TO supermarche;

--
-- Name: seq_tproduit; Type: SEQUENCE SET; Schema: public; Owner: supermarche
--

SELECT pg_catalog.setval('seq_tproduit', 1, false);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tassociation; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tassociation (
    id integer NOT NULL,
    theme character varying(50) NOT NULL
);


ALTER TABLE public.tassociation OWNER TO supermarche;

--
-- Name: tclient; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tclient (
    login character varying(50) NOT NULL,
    mdp character varying(50) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100) NOT NULL,
    adresse character varying(200),
    age integer,
    pointfidelite integer
);


ALTER TABLE public.tclient OWNER TO supermarche;

--
-- Name: tcommande; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tcommande (
    idpanier integer NOT NULL,
    datevalidation timestamp without time zone NOT NULL,
    etatcmd eetat NOT NULL,
    heurelivraison timestamp without time zone NOT NULL,
    lieulivraison character varying(200) NOT NULL,
    idtournee integer
);


ALTER TABLE public.tcommande OWNER TO supermarche;

--
-- Name: tcontient; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tcontient (
    idproduit integer NOT NULL,
    idpanier integer NOT NULL,
    quantite integer,
    prixpublicunitaire double precision,
    CONSTRAINT tcontient_quantite_check CHECK ((quantite >= 0))
);


ALTER TABLE public.tcontient OWNER TO supermarche;

--
-- Name: tlivreur; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tlivreur (
    login character varying(50) NOT NULL,
    mdp character varying(50) NOT NULL
);


ALTER TABLE public.tlivreur OWNER TO supermarche;

--
-- Name: tpanier; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tpanier (
    id integer NOT NULL,
    datepanier timestamp without time zone,
    login character varying(50)
);


ALTER TABLE public.tpanier OWNER TO supermarche;

--
-- Name: tproduit; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tproduit (
    id integer NOT NULL,
    nom character varying(200),
    dateperemption timestamp without time zone,
    prixdebase double precision,
    stock integer,
    categorie character varying(200),
    baremepromo double precision DEFAULT 0,
    idrayon character varying(200) NOT NULL,
    pointfidelite integer DEFAULT 0,
    CONSTRAINT tproduit_baremepromo_check CHECK ((baremepromo >= (0)::double precision)),
    CONSTRAINT tproduit_baremepromo_check1 CHECK ((baremepromo <= (100)::double precision)),
    CONSTRAINT tproduit_pointfidelite_check CHECK ((pointfidelite >= 0)),
    CONSTRAINT tproduit_prixdebase_check CHECK ((prixdebase >= (0)::double precision)),
    CONSTRAINT tproduit_stock_check CHECK ((stock >= 0))
);


ALTER TABLE public.tproduit OWNER TO supermarche;

--
-- Name: trayon; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE trayon (
    theme character varying(200) NOT NULL
);


ALTER TABLE public.trayon OWNER TO supermarche;

--
-- Name: trealise; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE trealise (
    idtournee integer NOT NULL,
    idlivreur character varying(50) NOT NULL
);


ALTER TABLE public.trealise OWNER TO supermarche;

--
-- Name: tresponsablecatalogue; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tresponsablecatalogue (
    login character varying(50) NOT NULL,
    mdp character varying(50) NOT NULL
);


ALTER TABLE public.tresponsablecatalogue OWNER TO supermarche;

--
-- Name: tresponsablelivraison; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tresponsablelivraison (
    login character varying(50) NOT NULL,
    mdp character varying(50) NOT NULL
);


ALTER TABLE public.tresponsablelivraison OWNER TO supermarche;

--
-- Name: ttournee; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE ttournee (
    id integer NOT NULL,
    datetournee timestamp without time zone NOT NULL
);


ALTER TABLE public.ttournee OWNER TO supermarche;

--
-- Name: vcommande; Type: VIEW; Schema: public; Owner: supermarche
--

CREATE VIEW vcommande AS
    SELECT tpanier.id AS idpanier, tpanier.datepanier, tpanier.login, tcommande.datevalidation, e.enumlabel AS etat, tcommande.heurelivraison, tcommande.lieulivraison, tcommande.idtournee FROM tpanier, tcommande, (pg_enum e JOIN pg_type t ON ((t.oid = e.enumtypid))) WHERE ((t.typname = 'eetat'::name) AND (tpanier.id = tcommande.idpanier));


ALTER TABLE public.vcommande OWNER TO supermarche;

--
-- Name: vproduitclient; Type: VIEW; Schema: public; Owner: supermarche
--

CREATE VIEW vproduitclient AS
    SELECT tproduit.id, tproduit.nom, tproduit.dateperemption, (tproduit.prixdebase * ((1)::double precision - (tproduit.baremepromo / (100)::double precision))) AS prix, tproduit.categorie, tproduit.baremepromo, tproduit.pointfidelite, tproduit.idrayon FROM tproduit WHERE (tproduit.stock > 0);


ALTER TABLE public.vproduitclient OWNER TO supermarche;

--
-- Name: tclient_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tclient
    ADD CONSTRAINT tclient_pkey PRIMARY KEY (login);


--
-- Name: vstatistiqueclient; Type: VIEW; Schema: public; Owner: supermarche
--

CREATE VIEW vstatistiqueclient AS
    SELECT tclient.login, tclient.nom, tclient.prenom, tclient.adresse, tclient.age, tclient.pointfidelite, count(DISTINCT tpanier.id) AS nombredepanierachete, sum((tcontient.prixpublicunitaire * (tcontient.quantite)::double precision)) AS prixmoyenpanier FROM tclient, tpanier, tcontient WHERE ((tpanier.id = tcontient.idpanier) AND ((tpanier.login)::text = (tclient.login)::text)) GROUP BY tclient.login;


ALTER TABLE public.vstatistiqueclient OWNER TO supermarche;

--
-- Name: tproduit_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tproduit
    ADD CONSTRAINT tproduit_pkey PRIMARY KEY (id);


--
-- Name: vstatistiqueproduit; Type: VIEW; Schema: public; Owner: supermarche
--

CREATE VIEW vstatistiqueproduit AS
    SELECT tproduit.id, tproduit.nom, tproduit.dateperemption, tproduit.prixdebase, (avg((tcontient.prixpublicunitaire * (tcontient.quantite)::double precision)) / (sum(tcontient.quantite))::double precision) AS prixmoyen, tproduit.stock, sum(tcontient.quantite) AS qtevendue, tproduit.categorie, tproduit.baremepromo, tproduit.pointfidelite, tproduit.idrayon FROM tproduit, tcontient WHERE (tproduit.id = tcontient.idproduit) GROUP BY tproduit.id;


ALTER TABLE public.vstatistiqueproduit OWNER TO supermarche;

--
-- Data for Name: tassociation; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tassociation VALUES (1, 'Nouveautes');
INSERT INTO tassociation VALUES (2, 'Nouveautes');
INSERT INTO tassociation VALUES (3, 'Nouveautes');
INSERT INTO tassociation VALUES (4, 'Nouveautes');
INSERT INTO tassociation VALUES (5, 'Nouveautes');
INSERT INTO tassociation VALUES (6, 'Frais libre service');
INSERT INTO tassociation VALUES (7, 'Frais libre service');
INSERT INTO tassociation VALUES (8, 'Frais libre service');
INSERT INTO tassociation VALUES (9, 'Frais libre service');
INSERT INTO tassociation VALUES (10, 'Frais libre service');
INSERT INTO tassociation VALUES (11, 'Charcuterie');
INSERT INTO tassociation VALUES (12, 'Charcuterie');
INSERT INTO tassociation VALUES (13, 'Charcuterie');
INSERT INTO tassociation VALUES (14, 'Charcuterie');
INSERT INTO tassociation VALUES (15, 'Charcuterie');
INSERT INTO tassociation VALUES (16, 'Traiteur');
INSERT INTO tassociation VALUES (17, 'Traiteur');
INSERT INTO tassociation VALUES (18, 'Traiteur');
INSERT INTO tassociation VALUES (19, 'Traiteur');
INSERT INTO tassociation VALUES (20, 'Traiteur');
INSERT INTO tassociation VALUES (21, 'Surgeles');
INSERT INTO tassociation VALUES (22, 'Surgeles');
INSERT INTO tassociation VALUES (23, 'Surgeles');
INSERT INTO tassociation VALUES (24, 'Surgeles');
INSERT INTO tassociation VALUES (25, 'Surgeles');
INSERT INTO tassociation VALUES (26, 'Epicerie');
INSERT INTO tassociation VALUES (27, 'Epicerie');
INSERT INTO tassociation VALUES (28, 'Epicerie');
INSERT INTO tassociation VALUES (29, 'Epicerie');
INSERT INTO tassociation VALUES (30, 'Epicerie');
INSERT INTO tassociation VALUES (31, 'Epicerie');
INSERT INTO tassociation VALUES (32, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (33, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (34, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (35, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (36, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (37, 'Boissons sans alcool');
INSERT INTO tassociation VALUES (38, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (39, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (40, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (41, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (42, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (43, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (44, 'Vins et Spiritueux');
INSERT INTO tassociation VALUES (45, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (46, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (47, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (48, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (49, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (50, 'Hygiene parfumerie');
INSERT INTO tassociation VALUES (51, 'Entretien');
INSERT INTO tassociation VALUES (52, 'Entretien');
INSERT INTO tassociation VALUES (53, 'Entretien');
INSERT INTO tassociation VALUES (54, 'Entretien');
INSERT INTO tassociation VALUES (55, 'Entretien');
INSERT INTO tassociation VALUES (56, 'Entretien');
INSERT INTO tassociation VALUES (57, 'Maison');
INSERT INTO tassociation VALUES (58, 'Maison');
INSERT INTO tassociation VALUES (59, 'Maison');
INSERT INTO tassociation VALUES (60, 'Maison');
INSERT INTO tassociation VALUES (61, 'Maison');
INSERT INTO tassociation VALUES (62, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (63, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (64, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (65, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (66, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (67, 'Produit BIO et ecologique');
INSERT INTO tassociation VALUES (68, 'Produit BIO et ecologique');


--
-- Data for Name: tclient; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tclient VALUES ('Olivia', 'azerty', 'Olivia', 'Reaney', '114 avenue de la Marne 60200 Compiegne', 23, 687);
INSERT INTO tclient VALUES ('Vanessa', 'azerty', 'Vanessa', 'Wolinne', '22 rue de Vignacourt 80420 Flixecourt', 22, 15);
INSERT INTO tclient VALUES ('Florian', 'azerty', 'Dambrine', 'Florian', '18 residence Jean Audegond 80470 Ailly Sur Somme', 21, 514);
INSERT INTO tclient VALUES ('Tudor', 'azerty', 'Luchiancenco', 'Tudor', '5 rue Pierre Sauvage 60200 Compiegne', 21, 245);
INSERT INTO tclient VALUES ('Pierre', 'azerty', 'Fayolle', 'Pierre', '10 rue Leon Blum 60200 Compiegne', 21, 33);
INSERT INTO tclient VALUES ('Qifan', 'azerty', 'Zheng', 'Qifan', '92 rue Pierre Guillaumat 60200 Compiegne', 20, 0);
INSERT INTO tclient VALUES ('Mickael', 'azerty', 'Mickael', 'Macquet', '3bis rue Clement Bayard 60200 Compiegne', 22, 1048);


--
-- Data for Name: tcommande; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tcommande VALUES (1, '2012-05-12 12:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '18 residence Jean Audegond 80470 Ailly/Sur/Somme', 1);
INSERT INTO tcommande VALUES (2, '2012-05-12 12:30:06', 'en preparation', '0001-01-01 14:30:00 BC', '18 residence Jean Audegond 80470 Ailly/Sur/Somme', 2);
INSERT INTO tcommande VALUES (4, '2012-05-12 01:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '5 rue Pierre Sauvage 60200 Compiegne', 2);
INSERT INTO tcommande VALUES (7, '2012-05-12 15:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '10 rue Leon Blum 60200 Compiegne', 3);
INSERT INTO tcommande VALUES (8, '2012-05-12 22:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '10 rue Leon Blum 60200 Compiegne', 3);
INSERT INTO tcommande VALUES (10, '2012-05-12 19:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '92 rue Pierre Guillaumat 60200 Compiegne', 3);
INSERT INTO tcommande VALUES (11, '2012-05-12 10:00:00', 'en preparation', '0001-01-01 14:30:00 BC', '92 rue Pierre Guillaumat 60200 Compiegne', 4);
INSERT INTO tcommande VALUES (12, '2012-05-12 23:30:00', 'en preparation', '0001-01-01 14:30:00 BC', '3bis rue Clement Bayard 60200 Compiegne', 1);


--
-- Data for Name: tcontient; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tcontient VALUES (5, 1, 3, 2.95999999999999996);
INSERT INTO tcontient VALUES (15, 1, 3, 4.41000000000000014);
INSERT INTO tcontient VALUES (25, 1, 1, 6.36000000000000032);
INSERT INTO tcontient VALUES (35, 1, 2, 2.27000000000000002);
INSERT INTO tcontient VALUES (45, 1, 3, 1.92999999999999994);
INSERT INTO tcontient VALUES (1, 2, 3, 2.64000000000000012);
INSERT INTO tcontient VALUES (6, 2, 1, 1.40999999999999992);
INSERT INTO tcontient VALUES (11, 2, 1, 1.60000000000000009);
INSERT INTO tcontient VALUES (16, 2, 3, 1.21999999999999997);
INSERT INTO tcontient VALUES (21, 2, 2, 5.58000000000000007);
INSERT INTO tcontient VALUES (26, 2, 1, 1.05000000000000004);
INSERT INTO tcontient VALUES (3, 3, 3, 4.12000000000000011);
INSERT INTO tcontient VALUES (13, 3, 5, 2);
INSERT INTO tcontient VALUES (23, 3, 6, 3.89999999999999991);
INSERT INTO tcontient VALUES (33, 3, 3, 0.220000000000000001);
INSERT INTO tcontient VALUES (9, 4, 3, 0.709999999999999964);
INSERT INTO tcontient VALUES (49, 4, 7, 2.93000000000000016);
INSERT INTO tcontient VALUES (4, 5, 3, 3.08000000000000007);
INSERT INTO tcontient VALUES (9, 5, 3, 0.709999999999999964);
INSERT INTO tcontient VALUES (14, 5, 9, 3.79000000000000004);
INSERT INTO tcontient VALUES (19, 5, 10, 2.49000000000000021);
INSERT INTO tcontient VALUES (24, 5, 3, 5.99000000000000021);
INSERT INTO tcontient VALUES (29, 5, 3, 1.73999999999999999);
INSERT INTO tcontient VALUES (34, 5, 15, 1.98999999999999999);
INSERT INTO tcontient VALUES (39, 5, 3, 14.6099999999999994);
INSERT INTO tcontient VALUES (17, 7, 3, 5.20999999999999996);
INSERT INTO tcontient VALUES (27, 7, 3, 0.760000000000000009);
INSERT INTO tcontient VALUES (37, 7, 3, 2.41000000000000014);
INSERT INTO tcontient VALUES (47, 7, 3, 1.6100000000000001);
INSERT INTO tcontient VALUES (57, 8, 7, 3.5);
INSERT INTO tcontient VALUES (67, 8, 1, 2.41000000000000014);
INSERT INTO tcontient VALUES (27, 9, 3, 0.760000000000000009);
INSERT INTO tcontient VALUES (2, 10, 3, 1.81000000000000005);
INSERT INTO tcontient VALUES (7, 10, 3, 4.05999999999999961);
INSERT INTO tcontient VALUES (12, 10, 3, 2.95000000000000018);
INSERT INTO tcontient VALUES (17, 10, 3, 5.20999999999999996);
INSERT INTO tcontient VALUES (47, 10, 3, 1.6100000000000001);
INSERT INTO tcontient VALUES (22, 12, 3, 8.16999999999999993);
INSERT INTO tcontient VALUES (32, 12, 3, 2.93999999999999995);
INSERT INTO tcontient VALUES (42, 12, 3, 6.99000000000000021);


--
-- Data for Name: tlivreur; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tlivreur VALUES ('Legrand', 'Livreur');
INSERT INTO tlivreur VALUES ('Robin', 'Livreur');
INSERT INTO tlivreur VALUES ('Chevalier', 'Livreur');
INSERT INTO tlivreur VALUES ('Fontaine', 'Livreur');
INSERT INTO tlivreur VALUES ('Lopez', 'Livreur');
INSERT INTO tlivreur VALUES ('Dumont', 'Livreur');
INSERT INTO tlivreur VALUES ('Gauthier', 'Livreur');
INSERT INTO tlivreur VALUES ('Clement', 'Livreur');


--
-- Data for Name: tpanier; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tpanier VALUES (1, '2012-05-12 00:00:00', 'Florian');
INSERT INTO tpanier VALUES (2, '2012-04-28 00:00:00', 'Florian');
INSERT INTO tpanier VALUES (3, '2012-04-26 00:00:00', 'Florian');
INSERT INTO tpanier VALUES (4, '2012-04-21 00:00:00', 'Tudor');
INSERT INTO tpanier VALUES (5, '2012-04-11 00:00:00', 'Tudor');
INSERT INTO tpanier VALUES (6, '2012-04-08 00:00:00', 'Tudor');
INSERT INTO tpanier VALUES (7, '2012-05-26 00:00:00', 'Pierre');
INSERT INTO tpanier VALUES (8, '2012-05-06 00:00:00', 'Pierre');
INSERT INTO tpanier VALUES (9, '2012-03-17 00:00:00', 'Pierre');
INSERT INTO tpanier VALUES (10, '2012-05-23 00:00:00', 'Qifan');
INSERT INTO tpanier VALUES (11, '2012-03-09 00:00:00', 'Qifan');
INSERT INTO tpanier VALUES (12, '2012-02-27 00:00:00', 'Mickael');
INSERT INTO tpanier VALUES (13, '2012-02-08 00:00:00', 'Olivia');


--
-- Data for Name: tproduit; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tproduit VALUES (8, 'KINDER CHOCO FRESH 5X21G', '2012-08-11 00:00:00', 1.69999999999999996, 40, 'Desserts', 0, 'Frais libre service', 0);
INSERT INTO tproduit VALUES (10, 'BEURRE DEMI-SEL GASTRONOMIQUE PRESIDENT 250G ', '2013-01-31 00:00:00', 1.75, 30, 'Beurre', 0, 'Frais libre service', 0);
INSERT INTO tproduit VALUES (18, 'COUSCOUS VIANDE 1KG', '2012-06-11 00:00:00', 6.99000000000000021, 20, 'Traiteur traditionnel', 0, 'Traiteur', 0);
INSERT INTO tproduit VALUES (20, 'PIZZA CAPRICCIOSA AUCHAN 450 ', '2012-07-31 00:00:00', 3.18999999999999995, 20, 'Pizzas', 0, 'Traiteur', 0);
INSERT INTO tproduit VALUES (28, 'SOUPE POTIRON/CHATAIGNE LIEBIG 1L', '2012-06-11 00:00:00', 3.04000000000000004, 40, 'potages', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (30, 'CONFIPOTE ABRICOTS MATERNE 350G', '2012-07-31 00:00:00', 1.84000000000000008, 60, 'confiture', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (31, 'PATE A TARTINER NUTELLA 750G', '2012-07-31 00:00:00', 3.99000000000000021, 60, 'pate a tartiner', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (36, 'EAU MINERALE NATURELLE GAZEUSE BADOIT ROUGE 6X1L', '2012-07-31 00:00:00', 4.08000000000000007, 60, 'eaux gazeuzes', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (38, 'WHISKY JAMESON 40% 70CL ', '2015-01-31 00:00:00', 18.4100000000000001, 30, 'whiskies bourbons', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (40, 'GRAVES P.CHANAU 10 75CL', '2012-06-11 00:00:00', 4.29000000000000004, 40, 'vin rouge', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (41, 'BORDEAUX BLAISSAC 3L', '2012-06-11 00:00:00', 6.99000000000000021, 40, 'vin rouge', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (43, 'BORDEAUX CHATEAU TALMONT 10 75CL', '2012-07-31 00:00:00', 3.54999999999999982, 60, 'vin rouge', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (44, 'CHATEAU TALUSSON 11 75CL', '2012-07-31 00:00:00', 3.25, 50, 'vin blanc', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (46, 'BROSSE A DENTS EXTRA CLEAN MEDIUM X4 COLGATE', '2016-01-31 00:00:00', 3.00999999999999979, 100, 'soins dentaires', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (48, 'SAVON LAVANDE LE PETIT OLIVIER 250G', '2016-01-31 00:00:00', 2.45999999999999996, 80, 'la toilette', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (50, 'ESSUIE TOUT DECORE X3 AUCHAN', '2015-01-31 00:00:00', 3.64999999999999991, 100, 'essuie', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (51, 'PASTILLES LAVE VAISSELLE X45', '2016-01-31 00:00:00', 4.58999999999999986, 60, 'produits vaisselle', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (52, 'RENOV LAVE VAISSELLE AUCHAN 250ML', '2015-01-31 00:00:00', 2.85999999999999988, 30, 'produits vaisselle', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (53, 'MANCHE + 5 PLUMEAUX DEPOUSSIERANTS AUCHAN', '2015-01-31 00:00:00', 3.14999999999999991, 60, 'brosserie', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (54, 'ENSEMBLE PELLE BALAYETTE', '2015-06-01 00:00:00', 2.08999999999999986, 10, 'brosserie', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (55, 'FRANGES COTON 100G', '2015-01-31 00:00:00', 1.19999999999999996, 10, 'brosserie', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (56, 'NETTOYANT VITRE RECHARGE AUCHAN 500ML', '2012-06-19 00:00:00', 1.1399999999999999, 10, 'nettoyants menagers', 0, 'Entretien', 0);
INSERT INTO tproduit VALUES (58, 'LINOLITE 310X38 OPALE 60W S19', '2017-01-31 00:00:00', 4.33999999999999986, 10, 'electriceite', 0, 'Maison', 0);
INSERT INTO tproduit VALUES (59, 'CARAFE MARELLA COOL BLANC BRITA', '2017-01-31 00:00:00', 22.1000000000000014, 10, 'accessoires de cuisine', 0, 'Maison', 0);
INSERT INTO tproduit VALUES (60, 'LOT 3 USTENSILES DE CUISINE EN BOIS', '2017-01-31 00:00:00', 2.68999999999999995, 10, 'accessoires de cuisine', 0, 'Maison', 0);
INSERT INTO tproduit VALUES (61, 'PETITES CUILLERES X24 TRANSPARENTES AUCHAN', '2017-01-31 00:00:00', 2.08999999999999986, 10, 'art de la table', 0, 'Maison', 0);
INSERT INTO tproduit VALUES (62, 'COURGETTE BIO 1KG', '2012-06-19 00:00:00', 2.95000000000000018, 10, 'fruits et legumes', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (63, 'POIVRON PANACHE BIO 250G', '2012-06-19 00:00:00', 2.58999999999999986, 10, 'fruits et legumes', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (64, 'ACTIVIA NATURE DANONE 4X125G', '2012-06-12 00:00:00', 1.40999999999999992, 20, 'Yaourts', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (15, 'QUART DE JAMBON SEC 10 TRANCHES AUCHAN 250G ', '2012-07-31 00:00:00', 4.41000000000000014, 47, 'Jambons', 0, 'Charcuterie', 0);
INSERT INTO tproduit VALUES (25, 'NOIX DE SAINT-JACQUES SANS CORAIL 300G', '2012-08-23 00:00:00', 6.36000000000000032, 29, 'poisson', 0, 'Surgeles', 0);
INSERT INTO tproduit VALUES (35, 'JUS MULTIVITAMINE AUCHAN 1L', '2012-06-11 00:00:00', 2.27000000000000002, 38, 'jus de fruits frais', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (45, 'DENTIFRICE HALEINE PURE SIGNAL 75ML', '2015-01-31 00:00:00', 1.92999999999999994, 97, 'soins dentaires', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (1, 'Jambon Herta x4', '2012-06-12 00:00:00', 2.64000000000000012, 37, 'Viandes', 0, 'Nouveautes', 0);
INSERT INTO tproduit VALUES (6, 'ACTIVIA NATURE DANONE 4X125G', '2012-06-12 00:00:00', 1.40999999999999992, 19, 'Yaourts', 0, 'Frais libre service', 0);
INSERT INTO tproduit VALUES (11, 'JAMBON 2 TRANCHES AUCHAN 90G', '2012-06-01 00:00:00', 1.60000000000000009, 49, 'Jambons', 0, 'Charcuterie', 0);
INSERT INTO tproduit VALUES (21, 'STEACK HACHE 100% PUR BOEUF X10 AUCHAN 1KG', '2012-08-23 00:00:00', 5.58000000000000007, 28, 'viande hachee', 0, 'Surgeles', 0);
INSERT INTO tproduit VALUES (26, 'PERSIL AUCHAN 10G ', '2014-01-31 00:00:00', 1.05000000000000004, 79, 'sauce condiment', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (3, 'Pack de lait Paturage de France', '2012-08-11 00:00:00', 4.12000000000000011, 37, 'Produits Laitiers', 0, 'Nouveautes', 0);
INSERT INTO tproduit VALUES (13, 'COPPA ITALIENNE 73G', '2012-06-11 00:00:00', 2, 35, 'Charcuterie tranchee', 0, 'Charcuterie', 0);
INSERT INTO tproduit VALUES (23, 'MOULES DECORTIQUEES CUITES 400G', '2012-08-23 00:00:00', 3.89999999999999991, 24, 'poisson', 0, 'Surgeles', 0);
INSERT INTO tproduit VALUES (33, 'EAU DE SOURCE CRISTALINE 1.5L', '2014-01-31 00:00:00', 0.220000000000000001, 117, 'eaux plates', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (14, 'JAMBON DE BAYONNE 6 TRANCHES DELPEYRAT 100G', '2012-07-21 00:00:00', 3.79000000000000004, 41, 'Jambons', 0, 'Charcuterie', 0);
INSERT INTO tproduit VALUES (49, 'ESSUIE TOUT DECOREE AUCHAN X3', '2015-01-31 00:00:00', 2.93000000000000016, 93, 'essuie', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (4, 'La laitre mousse au chocolat x4', '2012-07-21 00:00:00', 3.08000000000000007, 17, 'Produits Laitiers', 0, 'Nouveautes', 0);
INSERT INTO tproduit VALUES (9, 'LAIT DEMI ECREME LESCURE 1L', '2012-07-21 00:00:00', 0.709999999999999964, 74, 'Produits Laitiers', 0, 'Frais libre service', 0);
INSERT INTO tproduit VALUES (19, 'TOMATES CONFITES 150G', '2012-07-21 00:00:00', 2.49000000000000021, 10, 'Traiteur traditionnel', 0, 'Traiteur', 0);
INSERT INTO tproduit VALUES (24, 'CREVETTES BLACK TIGER ENTIERES CRUES 400G', '2012-08-23 00:00:00', 5.99000000000000021, 27, 'poisson', 0, 'Surgeles', 0);
INSERT INTO tproduit VALUES (29, 'KETCHUP BIO TOP DOWN AUCHAN 282G', '2012-06-11 00:00:00', 1.73999999999999999, 37, 'sauce condiment', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (34, 'JUS DE RAISIN AUCHAN 1L', '2012-06-11 00:00:00', 1.98999999999999999, 25, 'jus de fruits frais', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (39, 'BASE IRISH COFFEE .BAILEYS 17% 70CL', '2014-01-31 00:00:00', 14.6099999999999994, 27, 'whiskies bourbons', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (47, 'GEL DOUCHE LAIT ET VANILLE AUCHAN 300ML', '2016-07-01 00:00:00', 1.6100000000000001, 44, 'la toilette', 0, 'Hygiene parfumerie', 0);
INSERT INTO tproduit VALUES (2, 'Spaghetti Panzani 3min', '2012-12-31 00:00:00', 1.81000000000000005, 97, 'Pates', 0, 'Nouveautes', 0);
INSERT INTO tproduit VALUES (37, 'JUS DE CAROTTE AUCHAN BIO 1L', '2012-07-31 00:00:00', 2.41000000000000014, 57, 'jus de fruits frais', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (22, 'LE PUR BOEUF X10 CHARAL 1KG', '2012-08-23 00:00:00', 8.16999999999999993, 27, ' viande hachee', 0, 'Surgeles', 0);
INSERT INTO tproduit VALUES (57, 'AMPOULE ECOCLASSIC 42W PHILIPS', '2017-01-31 00:00:00', 3.5, 3, 'electriceite', 0, 'Maison', 0);
INSERT INTO tproduit VALUES (27, 'AIL SEMOULE AUCHAN 70G', '2014-01-31 00:00:00', 0.760000000000000009, 114, 'sauce condiment', 0, 'Epicerie', 0);
INSERT INTO tproduit VALUES (7, 'VELOUTE FRUIX DANONE 16X125G', '2012-07-01 00:00:00', 4.05999999999999961, 17, 'Yaourts', 0, 'Frais libre service', 0);
INSERT INTO tproduit VALUES (12, 'SAUCISSES FUMEES X4 COOPERL 360G', '2012-07-01 00:00:00', 2.95000000000000018, 47, 'Saucisses', 0, 'Charcuterie', 0);
INSERT INTO tproduit VALUES (17, 'CHEESE BURGER X2 CHARAL 145G', '2012-07-01 00:00:00', 5.20999999999999996, 14, 'Sandwiches snacks', 0, 'Traiteur', 0);
INSERT INTO tproduit VALUES (32, 'EAU MINERALE NATURELLE EVIAN 6X1L', '2014-01-31 00:00:00', 2.93999999999999995, 77, 'eaux plates', 0, 'Boissons sans alcool', 0);
INSERT INTO tproduit VALUES (42, 'BORDEAUX BLAISSAC 1.5L', '2012-06-11 00:00:00', 13.2899999999999991, 37, 'vin rouge', 0, 'Vins et Spiritueux', 0);
INSERT INTO tproduit VALUES (65, 'LE PUR BOEUF X10 CHARAL 1KG', '2012-08-23 00:00:00', 8.16999999999999993, 30, ' viande hachee', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (66, 'SANDWICH JAMBON/EMMENTAL AUCHAN 145G', '2012-07-01 00:00:00', 1.21999999999999997, 20, 'Sandwiches snacks', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (68, 'NETTOYANT VITRE RECHARGE AUCHAN 500ML', '2012-06-19 00:00:00', 1.1399999999999999, 10, 'nettoyants menagers', 0, 'Produit BIO et ecologique', 0);
INSERT INTO tproduit VALUES (5, 'Curry Ducros 250ml', '2014-01-31 00:00:00', 2.95999999999999996, 2, 'Epices', 0, 'Nouveautes', 0);
INSERT INTO tproduit VALUES (16, 'SANDWICH JAMBON/EMMENTAL AUCHAN 145G', '2012-07-01 00:00:00', 1.21999999999999997, 17, 'Sandwiches snacks', 0, 'Traiteur', 0);
INSERT INTO tproduit VALUES (67, 'JUS DE CAROTTE AUCHAN BIO 1L', '2012-07-31 00:00:00', 2.41000000000000014, 59, 'jus de fruits frais', 0, 'Produit BIO et ecologique', 0);


--
-- Data for Name: trayon; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO trayon VALUES ('Nouveautes');
INSERT INTO trayon VALUES ('Frais libre service');
INSERT INTO trayon VALUES ('Frais traditionnel');
INSERT INTO trayon VALUES ('Charcuterie');
INSERT INTO trayon VALUES ('Cremerie');
INSERT INTO trayon VALUES ('Traiteur');
INSERT INTO trayon VALUES ('Surgeles');
INSERT INTO trayon VALUES ('Epicerie');
INSERT INTO trayon VALUES ('Boissons sans alcool');
INSERT INTO trayon VALUES ('Vins et Spiritueux');
INSERT INTO trayon VALUES ('Hygiene parfumerie');
INSERT INTO trayon VALUES ('Entretien');
INSERT INTO trayon VALUES ('Maison');
INSERT INTO trayon VALUES ('Produit BIO et ecologique');


--
-- Data for Name: trealise; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO trealise VALUES (1, 'Legrand');
INSERT INTO trealise VALUES (2, 'Chevalier');
INSERT INTO trealise VALUES (3, 'Fontaine');
INSERT INTO trealise VALUES (4, 'Dumont');
INSERT INTO trealise VALUES (5, 'Dumont');
INSERT INTO trealise VALUES (6, 'Clement');
INSERT INTO trealise VALUES (7, 'Clement');


--
-- Data for Name: tresponsablecatalogue; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tresponsablecatalogue VALUES ('Michel', 'Cadmin');
INSERT INTO tresponsablecatalogue VALUES ('David', 'Cadmin');


--
-- Data for Name: tresponsablelivraison; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tresponsablelivraison VALUES ('Laurent', 'Ladmin');
INSERT INTO tresponsablelivraison VALUES ('Antoine', 'Ladmin');


--
-- Data for Name: ttournee; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO ttournee VALUES (1, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (2, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (3, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (4, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (5, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (6, '2012-05-12 00:30:00');
INSERT INTO ttournee VALUES (7, '2012-05-12 00:30:00');


--
-- Name: tassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tassociation
    ADD CONSTRAINT tassociation_pkey PRIMARY KEY (id, theme);


--
-- Name: tcommande_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tcommande
    ADD CONSTRAINT tcommande_pkey PRIMARY KEY (idpanier);


--
-- Name: tcontient_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tcontient
    ADD CONSTRAINT tcontient_pkey PRIMARY KEY (idproduit, idpanier);


--
-- Name: tlivreur_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tlivreur
    ADD CONSTRAINT tlivreur_pkey PRIMARY KEY (login);


--
-- Name: tpanier_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tpanier
    ADD CONSTRAINT tpanier_pkey PRIMARY KEY (id);


--
-- Name: trayon_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY trayon
    ADD CONSTRAINT trayon_pkey PRIMARY KEY (theme);


--
-- Name: trealise_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY trealise
    ADD CONSTRAINT trealise_pkey PRIMARY KEY (idtournee, idlivreur);


--
-- Name: tresponsablecatalogue_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tresponsablecatalogue
    ADD CONSTRAINT tresponsablecatalogue_pkey PRIMARY KEY (login);


--
-- Name: tresponsablelivraison_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tresponsablelivraison
    ADD CONSTRAINT tresponsablelivraison_pkey PRIMARY KEY (login);


--
-- Name: ttournee_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY ttournee
    ADD CONSTRAINT ttournee_pkey PRIMARY KEY (id);


--
-- Name: trig_contient; Type: TRIGGER; Schema: public; Owner: supermarche
--

CREATE TRIGGER trig_contient BEFORE INSERT OR UPDATE ON tcontient FOR EACH ROW EXECUTE PROCEDURE trig_contient();


--
-- Name: tassociation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tassociation
    ADD CONSTRAINT tassociation_id_fkey FOREIGN KEY (id) REFERENCES tproduit(id);


--
-- Name: tassociation_theme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tassociation
    ADD CONSTRAINT tassociation_theme_fkey FOREIGN KEY (theme) REFERENCES trayon(theme);


--
-- Name: tcommande_idpanier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tcommande
    ADD CONSTRAINT tcommande_idpanier_fkey FOREIGN KEY (idpanier) REFERENCES tpanier(id);


--
-- Name: tcommande_idtournee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tcommande
    ADD CONSTRAINT tcommande_idtournee_fkey FOREIGN KEY (idtournee) REFERENCES ttournee(id);


--
-- Name: tcontient_idpanier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tcontient
    ADD CONSTRAINT tcontient_idpanier_fkey FOREIGN KEY (idpanier) REFERENCES tpanier(id);


--
-- Name: tcontient_idproduit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tcontient
    ADD CONSTRAINT tcontient_idproduit_fkey FOREIGN KEY (idproduit) REFERENCES tproduit(id);


--
-- Name: tpanier_login_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tpanier
    ADD CONSTRAINT tpanier_login_fkey FOREIGN KEY (login) REFERENCES tclient(login);


--
-- Name: tproduit_idrayon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY tproduit
    ADD CONSTRAINT tproduit_idrayon_fkey FOREIGN KEY (idrayon) REFERENCES trayon(theme);


--
-- Name: trealise_idlivreur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY trealise
    ADD CONSTRAINT trealise_idlivreur_fkey FOREIGN KEY (idlivreur) REFERENCES tlivreur(login);


--
-- Name: trealise_idtournee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supermarche
--

ALTER TABLE ONLY trealise
    ADD CONSTRAINT trealise_idtournee_fkey FOREIGN KEY (idtournee) REFERENCES ttournee(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
