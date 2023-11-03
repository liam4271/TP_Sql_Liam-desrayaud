-- Créez une vue pour afficher les informations pour chaque entrepôt
-- exemple de sortit de requete = requeteTsql1.png
CREATE VIEW infos_entrepots AS
SELECT e.id AS entrepot_id,
    e.nom_entrepot,
    CONCAT(e.adresse, ', ', e.ville, ', ', e.pays) AS adresse_complete,
    COUNT(exp.id) AS nombre_expeditions
FROM entrepots e
    LEFT JOIN expeditions exp ON e.id = exp.id_entrepot_source
GROUP BY e.id,
    e.nom_entrepot,
    adresse_complete;
SELECT *
FROM infos_entrepots;
-- Créez une procédure stockée pour renvoyer le nombre total d'expéditions envoyées par un entrepôt au cours du dernier mois
-- exemple de sortit de requete = requeteTsql2.png
DELIMITER $$ CREATE PROCEDURE GetNombreExpeditionsMoisDernier(IN entrepotID INT, OUT totalExpeditions INT) BEGIN
SELECT COUNT(id) INTO totalExpeditions
FROM expeditions
WHERE id_entrepot_source = entrepotID
    AND date_expedition >= CURDATE() - INTERVAL 30 DAY;
END $$ DELIMITER;
SHOW CREATE PROCEDURE GetNombreExpeditionsMoisDernier;
-- Créez une fonction qui renvoie le nombre total d'expéditions envoyées par un entrepôt au cours du dernier mois