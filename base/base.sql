-- script de construction de la base

------------------------------------------------------------------------
-- convention
------------------------------------------------------------------------

--- 1) les noms de tables
-- 		a) les noms de tables se note précédé d'un "t"
--
-- 		exemple:
-- 			tetudiant
--		b) pas de pluriel!
--		c) reprendre les noms donnés dans le mld*
--
--		* pour identifiant on pourra se permettre id
---

--- 2) les noms d'attributs
-- 		a) les noms de d'attibuts commencent par une minuscule
--
-- 		exemple:
-- 			nom
--			identifiant
--		b) si nom composé alors mettre majuscule au deuxième
--
--		exemple:
--			nomcomposequiestunpeulong
---

------------------------------------------------------------------------

------------------------------------------------------------------------
-- note
------------------------------------------------------------------------

--- 1)
-- on préférera le type int au lieu du type date & heure, 
-- ce qui facilitera les calculs
---

------------------------------------------------------------------------
--drop database supermarche

--create database supermarche

create table if not exists trayon(
	theme varchar(200) primary key
);

create table if not exists tproduit(
	id int primary key,
	nom varchar(200),
	dateperemption timestamp,
	prixdebase float,
	stock int,
	categorie varchar(200),
	baremepromo float default 0,
	idrayon varchar(200) not null,
	pointfidelite int default 0,
	foreign key (idrayon) references trayon (theme),
	check (prixdebase>=0),
	check (stock>=0),
	check (baremepromo>=0),
	check (baremepromo<=100),
	check (pointfidelite>=0)
);
create sequence seq_tproduit;

create table if not exists tassociation(
	id int not null,
	theme varchar(50) not null,
	foreign key (id) references tproduit (id),
	foreign key (theme) references trayon (theme),
	primary key (id, theme) -- clé binaire
);

create table if not exists tclient(
	login varchar(50) primary key,
	mdp varchar(50) not null,
	nom varchar(100) not null,
	prenom varchar(100) not null,
	adresse varchar(200),
	age int,
	pointfidelite int
	
);

create table if not exists tpanier(
	id int primary key,
	datepanier timestamp,
	login varchar(50),
	foreign key (login) references tclient (login)
);

create table if not exists tcontient(
	idproduit int not null,
	idpanier int not null,
	quantite int,
	prixpublicunitaire float,
	foreign key (idproduit) references tproduit (id),
	foreign key (idpanier) references tpanier (id),
	primary key (idproduit, idpanier), -- clé binaire
	check (quantite>=0)
);

create table if not exists tresponsablelivraison(
	login varchar(50) primary key,
	mdp varchar(50) not null
);

create table if not exists tresponsablecatalogue(
	login varchar(50) primary key,
	mdp varchar(50) not null
);

create table if not exists tlivreur(
	login varchar(50) primary key,
	mdp varchar(50) not null
);

create table if not exists tresponsablemarketing(
	login varchar(50) primary key,
	mdp varchar(50) not null,
	baremepoint float,
	check (baremepromo<=100)
);

create table if not exists ttournee(
	id int primary key, -- check (id in tlivreur), contrainte impossible
	datetournee timestamp not null
);

create table if not exists trealise(
	idtournee int not null,
	idlivreur varchar(50) not null,
	foreign key (idtournee) references ttournee (id),
	foreign key (idlivreur) references tlivreur (login),
	primary key (idtournee, idlivreur)
);

-- création d'un type enum pour tcommande.etat

create type eetat as enum ('en préparation', 'disponible', 'traitée');

-- exemple de requete:
-- 	select e.enumlabel 
--	from pg_enum e 
--	join pg_type t on (t.oid=e.enumtypid) 
--	where t.typname='eetat';

create table if not exists tcommande(
	idpanier int primary key,
	datevalidation timestamp not null,
	etat eetat not null,
	heurelivraison int not null,
	lieulivraison varchar(200) not null,
	idtournee int,
	foreign key (idpanier) references tpanier (id),
	foreign key (idtournee) references ttournee (id)
);

------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------

create or replace view
			vcommande (	idpanier, 
						datepanier, 
						login,
						datevalidation, 
						etat, 
						heurelivraison,
						lieulivraison, 
						idtournee
					  )
			as 
				select  tpanier.id,
						tpanier.datepanier,
						tpanier.login,
						tcommande.datevalidation,
						e.enumlabel,
						tcommande.heurelivraison,
						tcommande.lieulivraison,
						tcommande.idtournee
				from tpanier, tcommande, pg_enum e
				--jointure enum
				join pg_type t on (t.oid=e.enumtypid) 
				-- restriction enum
				where t.typname='eetat'
				--condition de jointure vue
				and tpanier.id = tcommande.idpanier;

create or replace view
			vstatistiqueproduit(id,
								nom,
								dateperemption,
								prixdebase,
								prixmoyen,
								stock,
								qtevendue,
								categorie,
								baremepromo,
								pointfidelite,
								idrayon
								)
			as
				select  tproduit.id,
						tproduit.nom,
						tproduit.dateperemption,
						tproduit.prixdebase,
						avg(tcontient.prixpublicunitaire*tcontient.quantite)/sum(tcontient.quantite),
						tproduit.stock,
						sum(tcontient.quantite),
						tproduit.categorie,
						tproduit.baremepromo,
						tproduit.pointfidelite,
						tproduit.idrayon
				from tproduit, tcontient
				where tproduit.id = tcontient.idproduit
				group by tproduit.id;
				

create or replace view
			vstatistiqueclient( login,
								nom,
								prenom,
								adresse,
								age,
								pointfidelite,
								nombredepanierachete,
								prixmoyenpanier
							)
			as
				select  tclient.login,
						tclient.nom,
						tclient.prenom,
						tclient.adresse,
						tclient.age,
						tclient.pointfidelite,
						count(distinct tpanier.id),
						sum(tcontient.prixpublicunitaire*tcontient.quantite)
				from tclient, tpanier, tcontient
				where tpanier.id = tcontient.idpanier and
					tpanier.login=tclient.login
				group by tclient.login;

create or replace view
			vproduitclient( id,
					nom,
					dateperemption,
					prix,
					categorie,
					baremepromo,
					pointfidelite,
					idrayon)
			as
				select  tproduit.id,
						tproduit.nom,
						tproduit.dateperemption,
						tproduit.prixdebase * (1 - baremePromo/100),
						tproduit.categorie,
						tproduit.baremepromo,
						tproduit.pointfidelite,
						tproduit.idrayon
				from tproduit
				where stock > 0;
				
	
CREATE FUNCTION trig_contient() RETURNS trigger AS $trig_contient$			
    BEGIN
		update tproduit set stock = stock-NEW.quantite where id=NEW.idproduit;
		update tclient set pointfidelite = pointfidelite+(NEW.quantite*
															(select pointfidelite from tproduit where id=NEW.idproduit))
 					where login=(select login from tpanier where id=NEW.idpanier);
        RETURN NEW;
    END;
$trig_contient$ LANGUAGE plpgsql;

CREATE TRIGGER trig_contient BEFORE INSERT OR UPDATE ON tContient
    FOR EACH ROW EXECUTE PROCEDURE trig_contient();