CREATE DATABASE IF NOT EXISTS popcorn;

USE popcorn;

CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_utilisateur VARCHAR(50) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    est_admin BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS oeuvres (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tmdb INT NOT NULL,
    titre VARCHAR(255) NOT NULL,
    date_sortie DATE,
    synopsis TEXT,
    type ENUM('film', 'serie') NOT NULL,
    affiche VARCHAR(255),
    saison INT NOT NULL DEFAULT 0,

    CONSTRAINT uq_oeuvres_tmdb UNIQUE (id_tmdb, type, saison),
    CONSTRAINT ck_oeuvres_saison CHECK (
        (type = 'film' AND saison = 0) OR
        (type = 'serie' AND saison >= 1)
    ) 
);

CREATE TABLE IF NOT EXISTS acteurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tmdb INT NOT NULL UNIQUE,
    nom VARCHAR(255) NOT NULL,
    date_naissance DATE,
    nationalite VARCHAR(100),
    biographie TEXT,
    photo VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    personnage VARCHAR(255) NOT NULL,
    id_oeuvre INT NOT NULL,
    id_acteur INT NOT NULL,

    CONSTRAINT uq_roles UNIQUE (personnage, id_oeuvre, id_acteur),
    FOREIGN KEY (id_oeuvre) REFERENCES oeuvres (id) ON DELETE CASCADE,
    FOREIGN KEY (id_acteur) REFERENCES acteurs (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS critiques (
    id INT AUTO_INCREMENT PRIMARY KEY,
    note INT NOT NULL,
    commentaire TEXT,
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    id_role INT NOT NULL,
    id_utilisateur INT NOT NULL,

    CONSTRAINT uq_critiques UNIQUE (id_role, id_utilisateur),
    CONSTRAINT ck_critiques_note CHECK (note BETWEEN 1 AND 5),
    FOREIGN KEY (id_role) REFERENCES roles (id) ON DELETE CASCADE,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS reponses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT NOT NULL,
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    date_modification DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
    id_utilisateur INT NOT NULL,
    id_critique INT NOT NULL,

    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id) ON DELETE CASCADE,
    FOREIGN KEY (id_critique) REFERENCES critiques (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS signalements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    motif VARCHAR(500) NOT NULL,
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('en_attente', 'traite') NOT NULL DEFAULT 'en_attente',
    id_utilisateur INT NOT NULL,
    id_critique INT NOT NULL,

    CONSTRAINT uq_signalements UNIQUE (id_utilisateur, id_critique),
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs (id) ON DELETE CASCADE,
    FOREIGN KEY (id_critique) REFERENCES critiques (id) ON DELETE CASCADE
);