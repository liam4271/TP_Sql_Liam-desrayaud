-- Création de la base de données transport_logistique
CREATE DATABASE transport_logistique;
-- Sélection de la base de données
USE transport_logistique;
-- Création de la table "entrepots"
CREATE TABLE entrepots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_entrepot VARCHAR(255),
    adresse VARCHAR(255),
    ville VARCHAR(255),
    pays VARCHAR(255)
);
-- Création de la table "expeditions"
CREATE TABLE expeditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_expedition DATE,
    id_entrepot_source INT,
    id_entrepot_destination INT,
    poids DECIMAL(10, 2),
    statut VARCHAR(255),
    FOREIGN KEY (id_entrepot_source) REFERENCES entrepots(id),
    FOREIGN KEY (id_entrepot_destination) REFERENCES entrepots(id)
);

-- image exmple = Creation bdd.png, la capture as été prise à la fin des requetes donc des colones suplementaires sont présentes 