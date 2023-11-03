-- Sélection de la base de données
USE transport_logistique;
-- Ajout de données à la table "entrepots"
INSERT INTO entrepots (nom_entrepot, adresse, ville, pays) VALUES
    ('Entrepôt A', '123 Rue de l''Entrepôt', 'Paris', 'France'),
    ('Entrepôt B', '456 Warehouse Street', 'New York', 'USA'),
    ('Entrepôt C', '789 Lagerstrasse', 'Berlin', 'Germany'),
    ('Entrepôt D', '321 Warehouse Road', 'London', 'UK'),
    ('Entrepôt E', '987 Almacén Calle', 'Barcelona', 'Spain');
    ('Entrepôt F', '123 Warehouse Lane', 'Paris', 'France'),
    ('Entrepôt G', '456 Magazinestraße', 'Berlin', 'Germany'),
    ('Entrepôt H', '789 Stock Street', 'Tokyo', 'Japan');
-- Ajout de données à la table "expeditions"
INSERT INTO expeditions (date_expedition, id_entrepot_source, id_entrepot_destination, poids, statut) VALUES
    ('2023-10-15', 1, 2, 500.00, 'En transit'),
    ('2023-10-16', 2, 1, 750.50, 'Livré'),
    ('2023-10-17', 3, 4, 300.25, 'En transit'),
    ('2023-10-18', 4, 5, 900.75, 'En transit'),
    ('2023-10-19', 5, 3, 600.20, 'Livré'),
    ('2023-10-20', 1, 4, 400.10, 'En transit'),
    ('2023-10-21', 2, 5, 200.30, 'Livré'),
    ('2023-10-22', 4, 3, 350.00, 'En transit'),
    ('2023-10-23', 5, 1, 800.50, 'En transit'),
    ('2023-10-24', 3, 2, 550.25, 'Livré');
    ('2023-10-26', 6, 1, 1200.00, 'En transit'),
    ('2023-10-27', 1, 6, 2350.50, 'En transit'),
    ('2023-10-28', 7, 6, 10.75, 'Livré'),
    ('2023-10-29', 3, 8, 900.20, 'En transit'),
    ('2023-10-30', 8, 4, 10400.10, 'Livré'),
    ('2023-10-31', 5, 8, 5700.30, 'En transit');





