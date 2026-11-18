-- =========================================================================
-- PopCorn - Données de test
--
-- Comptes de test : mot de passe « motdepasse123 » pour tous.
-- Ce sont des comptes de développement, à ne jamais utiliser en production.
--
-- Les images sont des images de remplacement (placehold.co).
-- Les identifiants TMDB sont à vérifier sur https://www.themoviedb.org.
-- =========================================================================

-- -------------------------------------------------------------------------
-- Utilisateurs (dont un administrateur)
-- -------------------------------------------------------------------------

INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe, est_admin)
VALUES ('seed_admin', 'admin@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i', TRUE);
SET @admin = LAST_INSERT_ID();

INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe)
VALUES ('seed_alice', 'alice@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i');
SET @alice = LAST_INSERT_ID();

INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe)
VALUES ('seed_bob', 'bob@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i');
SET @bob = LAST_INSERT_ID();

INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe)
VALUES ('seed_chloe', 'chloe@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i');
SET @chloe = LAST_INSERT_ID();

INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe)
VALUES ('seed_david', 'david@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i');
SET @david = LAST_INSERT_ID();

-- Utilisatrice avec une photo de profil
INSERT INTO utilisateurs (nom_utilisateur, email, mot_de_passe, photo_utilisateur)
VALUES ('seed_emma', 'emma@seed.popcorn.test', '$2y$12$rkUWux2T5Ptnlrf1rd7Un.9jdUvJr7UHLoKH7GY/oY3STiyxeT4.i', 'https://placehold.co/100x100?text=E');
SET @emma = LAST_INSERT_ID();

-- -------------------------------------------------------------------------
-- Œuvres : films (saison 0) et séries (saison >= 1)
-- -------------------------------------------------------------------------

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (550, 'Fight Club', '1999-10-15', 'Un employé de bureau insomniaque rencontre un vendeur de savon charismatique et fonde avec lui un club de combat clandestin.', 'film', 'https://placehold.co/300x450?text=Fight+Club', 0);
SET @fight_club = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (652, 'Troie', '2004-05-13', 'L''enlèvement d''Hélène par Pâris déclenche la guerre entre les Grecs et Troie.', 'film', 'https://placehold.co/300x450?text=Troie', 0);
SET @troie = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (466272, 'Once Upon a Time… in Hollywood', '2019-07-24', 'Un acteur sur le déclin et sa doublure tentent de se faire une place dans le Hollywood de 1969.', 'film', 'https://placehold.co/300x450?text=Once+Upon+a+Time', 0);
SET @hollywood = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (346698, 'Barbie', '2023-07-19', 'Barbie quitte Barbieland pour le monde réel, accompagnée de Ken.', 'film', 'https://placehold.co/300x450?text=Barbie', 0);
SET @barbie = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (106646, 'Le Loup de Wall Street', '2013-12-25', 'L''ascension et la chute d''un courtier new-yorkais.', 'film', 'https://placehold.co/300x450?text=Le+Loup', 0);
SET @loup = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (693134, 'Dune : Deuxième partie', '2024-02-28', 'Paul Atréides s''allie aux Fremen pour venger sa famille.', 'film', 'https://placehold.co/300x450?text=Dune+2', 0);
SET @dune = LAST_INSERT_ID();

-- Cas H4 : œuvre sans date de sortie, sans synopsis et sans affiche
INSERT INTO oeuvres (id_tmdb, titre, type, saison)
VALUES (27205, 'Inception', 'film', 0);
SET @inception = LAST_INSERT_ID();

-- Une même série avec deux saisons : même id_tmdb, saison différente
INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (85552, 'Euphoria', '2019-06-16', 'Un groupe de lycéens face à la drogue, l''amour et l''identité.', 'serie', 'https://placehold.co/300x450?text=Euphoria+S1', 1);
SET @euphoria_s1 = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (85552, 'Euphoria', '2022-01-09', 'Rue tente de rester sobre tandis que les relations de ses amis se compliquent.', 'serie', 'https://placehold.co/300x450?text=Euphoria+S2', 2);
SET @euphoria_s2 = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (66732, 'Stranger Things', '2016-07-15', 'La disparition d''un garçon révèle des expériences secrètes et une fillette aux pouvoirs étranges.', 'serie', 'https://placehold.co/300x450?text=Stranger+Things', 1);
SET @stranger = LAST_INSERT_ID();

INSERT INTO oeuvres (id_tmdb, titre, date_sortie, synopsis, type, affiche, saison)
VALUES (1396, 'Breaking Bad', '2008-01-20', 'Un professeur de chimie atteint d''un cancer se lance dans la fabrication de méthamphétamine.', 'serie', 'https://placehold.co/300x450?text=Breaking+Bad', 1);
SET @breaking_bad = LAST_INSERT_ID();

-- -------------------------------------------------------------------------
-- Acteurs (avec et sans date de naissance, biographie, photo)
-- -------------------------------------------------------------------------

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (287, 'Brad Pitt', '1963-12-18', 'Américaine', 'Acteur et producteur américain, connu pour Fight Club, Troie et Once Upon a Time… in Hollywood.', 'https://placehold.co/300x300?text=Brad+Pitt');
SET @pitt = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (6193, 'Leonardo DiCaprio', '1974-11-11', 'Américaine', 'Acteur américain, oscarisé pour The Revenant.', 'https://placehold.co/300x300?text=DiCaprio');
SET @dicaprio = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (234352, 'Margot Robbie', '1990-07-02', 'Australienne', 'Actrice et productrice australienne.', 'https://placehold.co/300x300?text=Robbie');
SET @robbie = LAST_INSERT_ID();

-- Cas H4 : acteur sans photo
INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie)
VALUES (30614, 'Ryan Gosling', '1980-11-12', 'Canadienne', 'Acteur canadien, connu pour Drive et La La Land.');
SET @gosling = LAST_INSERT_ID();

-- Cas H4 : nom de scène sans prénom
INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (505710, 'Zendaya', '1996-09-01', 'Américaine', 'Actrice et chanteuse américaine.', 'https://placehold.co/300x300?text=Zendaya');
SET @zendaya = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (1190668, 'Timothée Chalamet', '1995-12-27', 'Franco-américaine', 'Acteur franco-américain.', 'https://placehold.co/300x300?text=Chalamet');
SET @chalamet = LAST_INSERT_ID();

-- Cas H4 : acteur sans biographie ni photo
INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite)
VALUES (819, 'Edward Norton', '1969-08-18', 'Américaine');
SET @norton = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (1356210, 'Millie Bobby Brown', '2004-02-19', 'Britannique', 'Actrice britannique révélée par Stranger Things.', 'https://placehold.co/300x300?text=MBB');
SET @mbb = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, biographie, photo)
VALUES (17419, 'Bryan Cranston', '1956-03-07', 'Américaine', 'Acteur américain, connu pour Breaking Bad.', 'https://placehold.co/300x300?text=Cranston');
SET @cranston = LAST_INSERT_ID();

-- Cas H4 : acteur sans date de naissance ni nationalité
INSERT INTO acteurs (id_tmdb, nom, biographie)
VALUES (84497, 'Aaron Paul', 'Acteur américain, connu pour Breaking Bad.');
SET @paul = LAST_INSERT_ID();

INSERT INTO acteurs (id_tmdb, nom, date_naissance, nationalite, photo)
VALUES (115440, 'Sydney Sweeney', '1997-09-12', 'Américaine', 'https://placehold.co/300x300?text=Sweeney');
SET @sweeney = LAST_INSERT_ID();

-- Cas H4 : acteur sans aucune information facultative
INSERT INTO acteurs (id_tmdb, nom)
VALUES (2034418, 'Jacob Elordi');
SET @elordi = LAST_INSERT_ID();

-- -------------------------------------------------------------------------
-- Rôles (performances)
-- -------------------------------------------------------------------------

INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Tyler Durden', @fight_club, @pitt);
SET @r_tyler = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Le narrateur', @fight_club, @norton);
SET @r_narrateur = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Achille', @troie, @pitt);
SET @r_achille = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Cliff Booth', @hollywood, @pitt);
SET @r_cliff = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Rick Dalton', @hollywood, @dicaprio);
SET @r_rick = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Sharon Tate', @hollywood, @robbie);
SET @r_sharon = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Barbie', @barbie, @robbie);
SET @r_barbie = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Ken', @barbie, @gosling);
SET @r_ken = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Jordan Belfort', @loup, @dicaprio);
SET @r_belfort = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Naomi Lapaglia', @loup, @robbie);
SET @r_naomi = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Paul Atréides', @dune, @chalamet);
SET @r_paul = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Chani', @dune, @zendaya);
SET @r_chani = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Dom Cobb', @inception, @dicaprio);
SET @r_cobb = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Rue Bennett', @euphoria_s1, @zendaya);
SET @r_rue_s1 = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Cassie Howard', @euphoria_s1, @sweeney);
SET @r_cassie = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Nate Jacobs', @euphoria_s1, @elordi);
SET @r_nate = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Rue Bennett', @euphoria_s2, @zendaya);
SET @r_rue_s2 = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Eleven', @stranger, @mbb);
SET @r_eleven = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Walter White', @breaking_bad, @cranston);
SET @r_walter = LAST_INSERT_ID();
INSERT INTO roles (personnage, id_oeuvre, id_acteur) VALUES ('Jesse Pinkman', @breaking_bad, @paul);
SET @r_jesse = LAST_INSERT_ID();

-- Sans critique (cas H4) : Sharon Tate, Naomi Lapaglia, Dom Cobb,
-- Cassie Howard, Nate Jacobs, Jesse Pinkman

-- -------------------------------------------------------------------------
-- Critiques
--
-- Cas de test prévus :
-- - G2 : Cliff Booth a les notes 5, 4 et 3 (une sans commentaire) → 4,00 / 3 critiques
-- - G3 : Tyler Durden (4 critiques) et Achille (2 critiques) ont tous deux 4,50 :
--        Tyler Durden doit être classé avant Achille
-- - Égalité exacte : Barbie et Walter White ont 14/3 avec 3 critiques chacun
--        → départagés par l'identifiant du rôle
-- - Rue Bennett S1 (5,00 / 5 critiques) doit passer devant Ken (5,00 / 2 critiques)
-- - Rick Dalton n'a qu'une critique
-- - Une critique contient du HTML, pour vérifier l'échappement à l'affichage
-- - Une critique a été modifiée (date_modification renseignée)
-- - Deux critiques ont exactement la même date (départage par identifiant)
-- -------------------------------------------------------------------------

INSERT INTO critiques (note, commentaire, date_creation, date_modification, id_role, id_utilisateur) VALUES
-- Tyler Durden : 5, 5, 4, 4 → 4,50
(5, 'Charismatique et inquiétant à la fois. Une performance culte.', '2026-10-02 18:30:00', NULL, @r_tyler, @alice),
(5, NULL, '2026-10-03 21:15:00', NULL, @r_tyler, @bob),
(4, 'Très bon, même si le personnage est parfois trop caricatural.', '2026-10-10 09:05:00', NULL, @r_tyler, @chloe),
(4, NULL, '2026-10-12 14:40:00', NULL, @r_tyler, @david),
-- Achille : 5, 4 → 4,50
(5, 'Une présence physique impressionnante.', '2026-10-05 20:00:00', NULL, @r_achille, @alice),
(4, 'Convaincant dans les scènes de combat, moins dans les dialogues.', '2026-10-06 11:20:00', NULL, @r_achille, @emma),
-- Cliff Booth : 5, 4, 3 → 4,00 (G2)
(5, 'Décontracté et drôle, il vole chaque scène.', '2026-10-08 19:45:00', NULL, @r_cliff, @bob),
(4, 'Très juste.', '2026-10-09 22:10:00', NULL, @r_cliff, @chloe),
(3, NULL, '2026-10-11 08:30:00', NULL, @r_cliff, @emma),
-- Barbie : 5, 5, 4 → 14/3
(5, 'Drôle et touchante, elle porte tout le film.', '2026-10-15 17:00:00', NULL, @r_barbie, @alice),
(5, NULL, '2026-10-16 12:00:00', NULL, @r_barbie, @david),
(4, 'Très bien, mais le scénario la limite parfois.', '2026-10-17 10:30:00', '2026-10-18 09:00:00', @r_barbie, @emma),
-- Ken : 5, 5 → 5,00 avec 2 critiques
(5, 'Hilarant, la meilleure surprise du film.', '2026-10-20 20:20:00', NULL, @r_ken, @bob),
(5, '<b>Ken</b> mérite tout. (Ce commentaire contient du HTML pour tester l''échappement.)', '2026-10-21 13:45:00', NULL, @r_ken, @chloe),
-- Rick Dalton : une seule critique
(3, 'Bon, mais moins marquant que ses autres rôles.', '2026-10-22 16:00:00', NULL, @r_rick, @david),
-- Jordan Belfort : 4, 4 → 4,00
(4, 'Une énergie folle du début à la fin.', '2026-10-23 21:30:00', NULL, @r_belfort, @alice),
(4, NULL, '2026-10-24 18:10:00', NULL, @r_belfort, @bob),
-- Chani : 2, 3 → 2,50
(2, 'Trop peu présente pour vraiment marquer.', '2026-10-25 15:00:00', NULL, @r_chani, @chloe),
(3, NULL, '2026-10-26 09:45:00', NULL, @r_chani, @david),
-- Paul Atréides : une critique
(4, 'Le personnage gagne enfin en épaisseur.', '2026-10-27 19:00:00', NULL, @r_paul, @emma),
-- Rue Bennett S1 : 5 × 5 → 5,00 avec 5 critiques
(5, 'Bouleversante. Une interprétation d''une rare justesse sur l''addiction.', '2026-10-28 22:00:00', NULL, @r_rue_s1, @alice),
(5, NULL, '2026-10-29 08:15:00', NULL, @r_rue_s1, @bob),
(5, 'Incroyable de bout en bout.', '2026-10-30 12:30:00', NULL, @r_rue_s1, @chloe),
(5, NULL, '2026-10-31 17:45:00', NULL, @r_rue_s1, @david),
(5, 'La raison principale de regarder la série.', '2026-11-01 20:00:00', NULL, @r_rue_s1, @emma),
-- Rue Bennett S2 : une critique
(4, 'Toujours excellente, même si la saison est plus inégale.', '2026-11-02 21:10:00', NULL, @r_rue_s2, @alice),
-- Eleven : 4, 5 → 4,50 (même date : départage par identifiant)
(4, 'Impressionnante pour son âge.', '2026-11-03 18:00:00', NULL, @r_eleven, @bob),
(5, 'Presque sans dialogue, et pourtant tout passe par le regard.', '2026-11-03 18:00:00', NULL, @r_eleven, @emma),
-- Walter White : 5, 5, 4 → 14/3 (égalité exacte avec Barbie)
(5, 'Une transformation fascinante.', '2026-11-04 20:30:00', NULL, @r_walter, @chloe),
(5, NULL, '2026-11-05 22:00:00', NULL, @r_walter, @david),
(4, 'La saison 1 n''est que le début de sa métamorphose.', '2026-11-06 10:00:00', NULL, @r_walter, @emma),
-- Le narrateur : une critique, par l'administrateur
(2, 'Effacé face à Tyler Durden, mais c''est le principe du rôle.', '2026-11-07 14:00:00', NULL, @r_narrateur, @admin);

-- =========================================================================
-- Pour SUPPRIMER ces données de test et recommencer, exécuter :
--
-- DELETE FROM oeuvres WHERE id_tmdb IN (550, 652, 466272, 346698, 106646, 693134, 27205, 85552, 66732, 1396);
-- DELETE FROM acteurs WHERE id_tmdb IN (287, 6193, 234352, 30614, 505710, 1190668, 819, 1356210, 17419, 84497, 115440, 2034418);
-- DELETE FROM utilisateurs WHERE email LIKE '%@seed.popcorn.test';
--
-- (La suppression des œuvres supprime aussi leurs rôles et leurs critiques.)
-- =========================================================================
