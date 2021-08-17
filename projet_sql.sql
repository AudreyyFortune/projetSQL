DROP TABLE IF EXISTS Type_artiste;	
DROP TABLE IF EXISTS Nationalite;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Type_contrat;
DROP TABLE IF EXISTS Contrat;
DROP TABLE IF EXISTS Artiste;
DROP TABLE IF EXISTS Ville;
DROP TABLE IF EXISTS Localisation;
DROP TABLE IF EXISTS Type_evenement;
DROP TABLE IF EXISTS Time_stamp;
DROP TABLE IF EXISTS Evenement;
DROP TABLE IF EXISTS Participe; 


CREATE TABLE Type_artiste (
id_type_artiste INTEGER PRIMARY KEY NOT NULL,	
type_artiste VARCHAR NOT NULL
);

INSERT INTO Type_artiste(id_type_artiste, type_artiste) VALUES 
(1, 'mannequin'),
(2, 'acteur'),
(3, 'chanteur'),
(4, 'footballeur');


CREATE TABLE Nationalite (
id_nationalite INTEGER PRIMARY KEY NOT NULL,	
pays VARCHAR NOT NULL
);

INSERT INTO Nationalite(id_nationalite, pays) VALUES
(1, 'FRANCE'),
(2, 'ALLEMAGNE'),
(3, 'ANGLETERRE'),
(4, 'MEXIQUE'),
(5, 'BRESIL'),
(6, 'USA'),
(7, 'JAPON'),
(8, 'COLOMBIE'),
(9, 'AUSTRALIE'),
(10, 'ITALIE'),
(11, 'RUSSIE'),
(12, 'AFRIQUE DU SUD'),
(13, 'PORTUGAL');


CREATE TABLE Adresse (
id_adresse SERIAL PRIMARY KEY NOT NULL,
numero_rue VARCHAR,
rue VARCHAR(100),
ville VARCHAR(50) NOT NULL,
pays VARCHAR(50) NOT NULL
);

INSERT INTO Adresse(numero_rue, rue, ville, pays) VALUES 
(NULL, NULL, 'Paris', 'FRANCE'),
('45', 'calle de Jose Abascal', 'Madrid', 'ESPAGNE'),
(NULL, 'calle de Rios Rosas', 'Madrid', 'ESPAGNE'),
('2', 'rue de la Piscine', 'Montpellier', 'FRANCE'),
('56', 'avenue des arenes', 'Bellegarde', 'FRANCE'),
(NULL, NULL, 'Rome', 'ITALIE'),
(NULL, 'rue Princesse', 'Paris', 'FRANCE'),
(NULL, 'Victoria street', 'Londres', 'ANGLETERRE'),
(NULL, 'East street', 'Londres', 'ANGLETERRE'),
(NULL, NULL, 'New York', 'USA'),
('32', 'Nishi-Ikebukuro', 'Tosima-ku', 'JAPON');



CREATE TABLE Artiste (
id_artiste SERIAL PRIMARY KEY NOT NULL,
id_type_artiste INTEGER NOT NULL REFERENCES Type_artiste,		
nom VARCHAR NOT NULL,
prenom VARCHAR NOT NULL,
sexe CHAR(1),	
id_nationalite INTEGER NOT NULL REFERENCES Nationalite,
date_de_naissance DATE, 	
id_adresse INTEGER REFERENCES Adresse,
email VARCHAR,
taille INTEGER
);

INSERT INTO Artiste(id_type_artiste, nom, prenom, sexe, id_nationalite, date_de_naissance, id_adresse, email, taille) VALUES 
(1, 'LUIS', 'Naelle', 'F', 10, '1997-07-13', 6, 'naelle-luis@gmail.com', 175),
(3, 'SHEERAN', 'Ed', 'M', 3, '1991-02-17', 9, 'ed-sheeran@gmail.com', 168),
(4, 'MBAPPE', 'Killian', 'M', 1, '1998-12-20', 1, 'killian-mbappe@gmail.com', 178),
(1, 'PUICVER', 'Maria', 'F', 5, '2000-05-23', 2, NULL, 182),
(2, 'DE VIRA', 'Robert', 'M', 8, '1974-01-22', 10, NULL, 169),
(2, 'SONGUI', 'Kano', 'M', 7, '1965-08-05', 11, 'kano-songui@gmail.com', 183),
(4, 'RONALDO', 'Cristiano', 'M', 13, '1885-02-05', 3,'christiano-ronaldo@gmail.com', 185),
(1, 'HANKS', 'Christiana', 'F', 1, '2003-04-12', 7, 'christina-hanks@gmail.com', 176),
(1, 'HOLDEN', 'Monica', 'F', 4, '1999-12-09', 8, 'monica-holden@gmail.com', 178),
(1, 'LEWIS', 'Lila', 'F', 1, '2002-07-22', 4, 'lila-lewis@gmail.com', 183),
(1, 'BRUHL', 'Katjia', 'F', 2, '2001-06-24', 5, 'katjia-bruhl@gmail.com', 185),
(1, 'LI', 'Jenni', 'F', 1, '1999-12-23', 7, 'jenni-li@gmail.com', 172),
(3, 'BAD', 'Bunny', 'M', 8, '1994-03-10', NULL, 'bunny-bad@gmail.com', NULL);


CREATE TABLE Type_contrat(
id_type_contrat INTEGER PRIMARY KEY NOT NULL,	
nom_type_contrat VARCHAR NOT NULL
);

INSERT INTO Type_contrat(id_type_contrat,nom_type_contrat) VALUES 
(1,'Cachet'), 
(2,'Comission');


CREATE TABLE Contrat(
id_contrat SERIAL PRIMARY KEY NOT NULL,
montant INTEGER NOT NULL,
id_type_contrat INTEGER NOT NULL REFERENCES Type_contrat,
id_artiste INTEGER NOT NULL REFERENCES Artiste
);

INSERT INTO Contrat(montant, id_type_contrat, id_artiste) VALUES 
(2500, 1,1),
(20000, 2,2), 
(10000,1,2),
(4000, 1,3), 
(15000,2,3),
(50000, 2,4), 
(2500, 1,5),
(20000, 2,6),
(54000, 1,7), 
(100000, 2,7),
(50000, 2,8),
(20000, 2,9),
(4000, 1,10),
(50000, 2,11), 
(2500, 1,12),
(2000, 1,13),
(20000, 2,13);


CREATE TABLE Ville(
id_ville SERIAL PRIMARY KEY,
ville VARCHAR NOT NULL);

INSERT INTO Ville(ville) VALUES 
('Paris'), 
('Marseilles'), 
('Cannes'), 
('New York'),
('Mexico City'), 
('Hong Kong'),
('Sao Paulo'), 
('Manille'), 
('Los Angeles'), 
('Tianjin'), 
('Buenos Aires'), 
('Londres'), 
('Kinshasa'), 
('Lima'), 
('Chigaco'), 
('Milan'), 
('Miami'), 
('Madrid'), 
('Dubai'), 
('Rome');


CREATE TABLE Localisation(
id_localisation SERIAL PRIMARY KEY NOT NULL,
id_ville INTEGER NOT NULL REFERENCES Ville,
nom_lieu VARCHAR, 
nombre_max INTEGER
);

INSERT INTO Localisation(id_ville, nom_lieu, nombre_max) VALUES
(1, 'accor hotel arena', 20300),
(1, 'stade de France', 81338),
(18, 'stade Santiago-Bernabeu', 81044), 
(4, 'fashion week', 15000),
(11, 'la boca', 20),
(1, 'tour eiffel', 250),
(19, 'the dubai fountain', NULL), 	
(17, 'wynwood walls', NULL), 	
(12, 'stade de Wembley', 89874),
(4, 'Madison Square Garden', 20000), 
(7,'UnimedHall', 7000), 
(19,'Burj Khalifa',NULL),  
(3, 'La croisette', NULL), 
(9,'Hollywood Boolevard', NULL), 
(16, 'Giuseppe-Meazza',80018);

CREATE TABLE Type_evenement(
id_type_evenement SERIAL PRIMARY KEY NOT NULL,
type_evenement VARCHAR,
nombre_max INTEGER,
nombre_min INTEGER
);

INSERT INTO Type_evenement (id_type_evenement, type_evenement) VALUES 
(1, 'concert en stade'),
(2, 'concert en pleine air'), 
(3, 'défilé'),
(4, 'conference'), 
(5, 'buffet dinatoire'),
(6, 'tournage'), 
(7, 'match'),
(8, 'festival'),
(9, 'promotion film'),
(10, 'audition'),
(11, 'shooting');

CREATE TABLE Time_stamp(
id_plage SERIAL PRIMARY KEY NOT NULL,
plage_date_debut TIMESTAMP,
plage_date_fin TIMESTAMP);

INSERT INTO Time_stamp(plage_date_debut,plage_date_fin) VALUES 
('2019-10-21 10:00:00','2019-10-21 12:00:00'), 
('2019-04-06 15:30:00','2019-04-06 16:00:00'),
('2019-05-30 21:00:00','2019-05-30 23:00:00'),
('2019-11-02 08:00:00','2020-11-02 23:00:00'),
INSERT INTO Time_stamp(plage_date_debut,plage_date_fin) VALUES
('2019-07-14 08:00:00','2019-08-15 23:00:00');


CREATE TABLE Evenement(
id_evenement SERIAL PRIMARY KEY NOT NULL,
nom_evenement VARCHAR, 
id_localisation INTEGER NOT NULL REFERENCES Localisation, 
id_type_evenement INTEGER NOT NULL REFERENCES Type_evenement, 
id_plage INTEGER REFERENCES Time_stamp,
chiffre_affaire INTEGER
);

INSERT INTO Evenement(nom_evenement, id_localisation, id_type_evenement, id_plage, chiffre_affaire) VALUES 
('tournage scène',6,6,1,NULL),
('shooting photo',4,11,2,NULL),
('match PSG-Liverpool',3,7,3,NULL),
('tournée 2019-2020', 1, 1, 4, 4000567),
('festival coachella',15,8, 5, 1434752);


CREATE TABLE Participe ( 	
id_contrat INTEGER NOT NULL REFERENCES Contrat, 
id_evenement INTEGER NOT NULL REFERENCES Evenement
);

INSERT INTO Participe (id_contrat, id_evenement) VALUES 
(2,1),
(3,2),
(5,3),
(2,4);


-- Requetes demandées:  1/ Prochain jour libre pour un artiste particulier. 

--						2/ Artiste ayant un cachet superieur à 10000 euros. 
						SELECT nom,prenom FROM Artiste NATURAL JOIN Contrat NATURAL JOIN Type_contrat WHERE Contrat.montant>10000 AND Type_contrat.id_type_contrat=1;
--						3/ Rentabilite moyenne d'artistes particulier sur le mois. 
						SELECT AVG(montant) AS rent_moyen FROM Contrat NATURAL JOIN Artiste WHERE Artiste.nom = 'MBAPPE' AND (EXTRACT (YEAR FROM Time_stamp.plage_date_fin)- EXTRACT (YEAR FROM Time_stamp.plage_date_debut))=00 AND (EXTRACT (MONTH FROM Time_stamp.plage_date_fin)-EXTRACT (MONTH FROM Time_stamp.plage_date_debut))=01 ; 
--						4/ Temps de travail d'un artiste particulier sur l'annee ecoulee. 
						SELECT SUM(plage_date_fin - plage_date_debut) FROM Time_stamp NATURAL JOIN Evenement NATURAL JOIN Participe NATURAL JOIN Contrat NATURAL JOIN Artiste NATURAL JOIN Type_artiste WHERE Type_artiste.id_type_artiste=3  ;
--						5/ Prix moyen d'un artiste particulier. 
						SELECT AVG(montant) AS Prix_moyen FROM Contrat JOIN  Artiste ON (Contrat.id_artiste= Artiste.id_artiste) WHERE Artiste.nom = 'MBAPPE' ; 
-- 						6/ Chiffre d'affaire genere au cours du mois dernier par tous les artistes.

-- Requetes personnelles: 	1/ Nombre de mannequins, de sexe 'F', de nationalité Francaise, mesurant entre 1m775 et 1m85.
							SELECT COUNT(id_artiste) FROM Artiste NATURAL JOIN Nationalite WHERE Nationalite.id_nationalite = 1 AND Artiste.sexe= 'F' AND Artiste.taille>175 AND Artiste.taille<185;
--							2/ Nom de l'artiste le plus lucratif. 
							SELECT DISTINCT nom, chiffre_affaire FROM Artiste NATURAL JOIN Contrat NATURAL JOIN Participe NATURAL JOIN Evenement WHERE chiffre_affaire != 0 GROUP BY nom, chiffre_affaire ORDER BY chiffre_affaire asc ; 
--							3/ Nom et taille du dernier artiste ayant fait un shooting photo à New York. 
							SELECT nom ,taille FROM Artiste NATURAL JOIN Contrat NATURAL JOIN Participe NATURAL JOIN Evenement NATURAL JOIN Localisation WHERE Evenement.nom_evenement='shooting photo' AND Localisation.id_ville = 4;
--							4/ Mise à jour de montant dans la table Contrat.
							UPDATE Contrat SET  montant = 10000 WHERE id_contrat=17;
-- 							5/ Afficher le email de n'importe quel artiste.
							PREPARE recherche_nom  (VARCHAR) as
							SELECT email
							FROM Artiste
							WHERE nom = $1;
	
							EXECUTE recherche_nom ('MBAPPE');



--							6/ Récuperer les évenements pour une ville choisis par entrée clavier.
\prompt ' taper le nom de ville ->' nom_ville
SELECT Evenement.nom_evenement FROM Evenement NATURAL JOIN Ville WHERE Ville.ville=:nom_ville;

