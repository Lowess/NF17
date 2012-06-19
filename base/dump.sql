--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: eetat; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE eetat AS ENUM (
    'en préparation',
    'disponible',
    'traitée'
);


ALTER TYPE public.eetat OWNER TO root;

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

SELECT pg_catalog.setval('seq_tproduit', 8, true);


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
    etat eetat NOT NULL,
    heurelivraison integer NOT NULL,
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
    prixpublicunitaire double precision
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
    baremepromo double precision,
    idrayon character varying(200) NOT NULL
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
-- Name: tresponsablemarketing; Type: TABLE; Schema: public; Owner: supermarche; Tablespace: 
--

CREATE TABLE tresponsablemarketing (
    login character varying(50) NOT NULL,
    mdp character varying(50) NOT NULL,
    baremepoint double precision
);


ALTER TABLE public.tresponsablemarketing OWNER TO supermarche;

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
    SELECT tpanier.id AS idpanier, tpanier.datepanier, tpanier.login, tcommande.datevalidation, e.enumlabel AS etat, tcommande.heurelivraison, tcommande.lieulivraison, tcommande.idtournee FROM tpanier, tcommande, (pg_enum e JOIN pg_type t ON ((t.oid = e.enumtypid))) WHERE ((t.typname = 'eEtat'::name) AND (tpanier.id = tcommande.idpanier));


ALTER TABLE public.vcommande OWNER TO supermarche;

--
-- Data for Name: tassociation; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tclient; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tclient VALUES ('Florian', 'azerty', 'Dambrine', 'Florian', '18 résidence Jean Audegond 80470 Ailly/Sur/Somme', 21, 514);
INSERT INTO tclient VALUES ('Tudor', 'azerty', 'Luchiancenco', 'Tudor', '5 rue Pierre Sauvage 60200 Compiègne', 21, 245);
INSERT INTO tclient VALUES ('Pierre', 'azerty', 'Fayolle', 'Pierre', '10 rue Leon Blum 60200 Compiègne', 21, 33);
INSERT INTO tclient VALUES ('Qifan', 'azerty', 'Qifan', 'Zheng', '92 rue Pierre Guillaumat 60200 Compiègne', 20, 0);
INSERT INTO tclient VALUES ('Mickael', 'azerty', 'Mickael', 'Macquet', '3bis rue Clément Bayard 60200 Compiègne', 22, 1048);
INSERT INTO tclient VALUES ('Olivia', 'azerty', 'Olivia', 'Reaney', '114 avenue de la Marne 60200 Compiègne', 23, 687);
INSERT INTO tclient VALUES ('Vanessa', 'azerty', 'Vanessa', 'Wolinne', '22 rue de Vignacourt 80420 Flixecourt', 22, 15);


--
-- Data for Name: tcommande; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tcontient; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tlivreur; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tpanier; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tproduit; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO tproduit VALUES (3, 'Pack de lait Paturage de France', '2012-08-11 00:00:00', 4.12000000000000011, 40, 'Produits laitiers et similaires', 0, 'Frais libre service');
INSERT INTO tproduit VALUES (2, 'Spaghetti Panzani 3min', '2012-12-31 00:00:00', 1.81000000000000005, 100, 'Oeufs et produits à base d oeufs', 0, 'Frais libre service');
INSERT INTO tproduit VALUES (1, 'Jambon Herta x4', '2012-06-12 00:00:00', 2.64000000000000012, 40, 'Produits laitiers et similaires', 0, 'Epicerie');
INSERT INTO tproduit VALUES (5, 'Curry Ducros 250ml', '2014-01-31 00:00:00', 2.95999999999999996, 5, 'Produits laitiers et similaires', 0, 'Frais traditionnel');
INSERT INTO tproduit VALUES (4, 'La laiti&egrave;re mousse au chocolat x4', '2012-07-21 00:00:00', 3.08000000000000007, 100, 'Produits laitiers et similaires', 0, 'Frais libre service');


--
-- Data for Name: trayon; Type: TABLE DATA; Schema: public; Owner: supermarche
--

INSERT INTO trayon VALUES ('Frais libre service');
INSERT INTO trayon VALUES ('Frais traditionnel');
INSERT INTO trayon VALUES ('Liquides');
INSERT INTO trayon VALUES ('Loisirs');
INSERT INTO trayon VALUES ('Textile');
INSERT INTO trayon VALUES ('Epicerie');
INSERT INTO trayon VALUES ('Droguerie Hygiène');
INSERT INTO trayon VALUES ('Surgelés');
INSERT INTO trayon VALUES ('Equipement de la maison');


--
-- Data for Name: trealise; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tresponsablecatalogue; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tresponsablelivraison; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: tresponsablemarketing; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Data for Name: ttournee; Type: TABLE DATA; Schema: public; Owner: supermarche
--



--
-- Name: tassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tassociation
    ADD CONSTRAINT tassociation_pkey PRIMARY KEY (id, theme);


--
-- Name: tclient_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tclient
    ADD CONSTRAINT tclient_pkey PRIMARY KEY (login);


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
-- Name: tproduit_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tproduit
    ADD CONSTRAINT tproduit_pkey PRIMARY KEY (id);


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
-- Name: tresponsablemarketing_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY tresponsablemarketing
    ADD CONSTRAINT tresponsablemarketing_pkey PRIMARY KEY (login);


--
-- Name: ttournee_pkey; Type: CONSTRAINT; Schema: public; Owner: supermarche; Tablespace: 
--

ALTER TABLE ONLY ttournee
    ADD CONSTRAINT ttournee_pkey PRIMARY KEY (id);


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

