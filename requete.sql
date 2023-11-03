-- Affichez tous les entrepôts
-- exemple de sortit de requete = requete1.png
SELECT *
FROM entrepots;
-- Affichez toutes les expéditions
-- exemple de sortit de requete = requete2.png
SELECT *
FROM expeditions;
-- Affichez toutes les expéditions en transit
-- exemple de sortit de requete = requete3.png
SELECT *
FROM expeditions
WHERE statut = 'En transit';
-- Affichez toutes les expéditions livrées
-- exemple de sortit de requete = requete4.png
SELECT *
FROM expeditions
WHERE statut = 'Livré';