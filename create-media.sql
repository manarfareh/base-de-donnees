
CREATE TABLE album (
	 codealb INT,
    titre VARCHAR(20),
    date_sortie date,
    maison_prod VARCHAR(20),
    PRIMARY KEY (codealb));
CREATE TABLE film_album(CODE_F INT,
                         codealb INT,
                         PRIMARY KEY (CODE_F,codealb),
                         FOREIGN KEY (codealb) REFERENCES album(codealb),
                         FOREIGN key (CODE_F) REFERENCES Film(CODE_F));

CREATE TABLE groupe (nom_grp VARCHAR(20),
                    date_creation date,
                    PRIMARY KEY (nom_grp));  
                        
CREATE TABLE musicien (
                matricule_mus VARCHAR (20),
                nom VARCHAR (20),
                prenom VARCHAR (20),
                adresse VARCHAR (20),
                nationnalite VARCHAR (20),
                date_naissance date,
                url_chainey VARCHAR (20),
                nom_grp VARCHAR (20),
                PRIMARY KEY (matricule_mus),
                FOREIGN KEY (nom_grp) REFERENCES groupe(nom_grp));             
 
 CREATE TABLE album_solo (
                   codealb INT,
                   matricule_mus VARCHAR (20),
                   PRIMARY KEY (codealb,matricule_mus),
                   FOREIGN KEY (codealb) REFERENCES album(codealb),
                   FOREIGN KEY (matricule_mus) REFERENCES musicien(matricule_mus));

CREATE TABLE album_grp (codealb INT,
                    nom_grp VARCHAR (20),
                    PRIMARY KEY (codealb),
                    FOREIGN KEY (codealb) REFERENCES album(codealb),
                    FOREIGN KEY (nom_grp) REFERENCES groupe (nom_grp)); 
 
CREATE TABLE Etage (num_etage DECIMAL(5),
                  PRIMARY KEY (num_etage));

CREATE TABLE Rayon (num_rayon DECIMAL(5),
                    theme VARCHAR (50),
                    num_etage DECIMAL(5) ,
                    PRIMARY KEY (num_rayon),
                    FOREIGN KEY (num_etage) REFERENCES Etage(num_etage));

CREATE TABLE Presentoir (num_presentoir DECIMAL(5),
                        nbre_oeuvre_pre DECIMAL(5),
                        num_rayon DECIMAL(5),
                        PRIMARY KEY (num_presentoir),
                        FOREIGN KEY (num_rayon) REFERENCES Rayon(num_rayon));

CREATE TABLE Etagere (  num_etagere DECIMAL(5),
                        nbre_oeuvre DECIMAL(5),
                        categorie  VARCHAR (50),
                        num_rayon DECIMAL(5),
                        PRIMARY KEY (num_etagere),
                        FOREIGN KEY (num_rayon) REFERENCES Rayon(num_rayon));
  

create table editeur (
	nom_maison_edition VARCHAR(50) ,
	site_url VARCHAR(1000),
	adresse VARCHAR(50),
	PRIMARY key (nom_maison_edition)
);


create table oeuvre (
	code INT NOT NULL ,
	id_etagere INT  ,
	id_presentoir INT ,
   PRIMARY KEY(code),
   FOREIGN KEY (id_etagere) REFERENCES Etagere(num_etagere),             
   FOREIGN KEY (id_presentoir) REFERENCES Presentoir(num_presentoir)
   );             

create table auteur (
	matricule INT ,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50),
	date_naissance DATE,
	nationalite VARCHAR(50),
	PRIMARY KEY (matricule)
);

create table livre (
	code  INT ,
	nbpages INT,
	ISBN VARCHAR(50),
	titre VARCHAR(50) NOT NULL,
	date_sortie DATE,
	matricule_aut INT NOT NULL,
	nom_maison_edition VARCHAR(50),
	PRIMARY key (code),
	FOREIGN key (code) REFERENCES oeuvre(code) ON DELETE CASCADE ,
	FOREIGN key (nom_maison_edition) REFERENCES editeur(nom_maison_edition) ON DELETE CASCADE ,
	FOREIGN key (matricule_aut) REFERENCES auteur(matricule) 
   );

 create table ARTISTE (
	MATRICULE INT ,
	NOM  VARCHAR(50),
	PRENOM VARCHAR(50),
	DATE_NAISSANCE DATE,
	NATIONALITE VARCHAR(50),
   PRIMARY KEY (MATRICULE)
);

 create table Film (
	CODE_F INT,
	titre  VARCHAR(70),
	annee  VARCHAR(50),
	MATRICULE_REAL INT,
   PRIMARY KEY (CODE_F),
   FOREIGN key (MATRICULE_REAL) REFERENCES ARTISTE(MATRICULE)
   );

create table film_adapte_livre (
    CODE_F int,
	 codeL  INT ,
    PRIMARY KEY (codeL),
    FOREIGN key (CODE_F) REFERENCES Film(CODE_F),
    FOREIGN key (codeL) REFERENCES livre (CODE)

);

create table Rolee (
	ROLEE_NAME  VARCHAR(50),
   CODE_F_R int ,
	MATRICULE_ACT  INT ,
   PRIMARY KEY (ROLEE_NAME, CODE_F_R, MATRICULE_ACT),
   FOREIGN key (CODE_F_R) REFERENCES Film(CODE_F),
   FOREIGN key (MATRICULE_ACT) REFERENCES ARTISTE(MATRICULE)

);

create table adherent (
	matricule_adh INT PRIMARY KEY NOT NULL,
	email_adh VARCHAR(50)  NOT NULL,
	phone_adh VARCHAR(50),
	NATIONALITE VARCHAR(50),
	nom_adh VARCHAR(50),
	prenom_adh VARCHAR(50),
	date_naiss_ad DATE,
	adress_adh VARCHAR(50),
	date_Debadh DATE,
	date_Finadh DATE
);

CREATE TABLE Emprunt (
                      code INT,
                      date_debut date NOT NULL ,
                      matricule_adh int,
                      date_fin date,
                      PRIMARY KEY (code , date_debut),
                      FOREIGN KEY (code) REFERENCES oeuvre(code),
                      FOREIGN KEY (matricule_adh) REFERENCES adherent(matricule_adh)

                      );
                 
