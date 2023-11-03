-- Affichez les entrepôts qui ont envoyé au moins une expédition en transit.
-- exemple de sortit de requete = requeteAvance1.png
SELECT DISTINCT e.id,
    e.nom_entrepot
FROM entrepots e
    INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.statut = 'En transit';
-- Affichez les entrepôts qui ont reçu au moins une expédition en transit.
-- exemple de sortit de requete = requeteAvance2.png
SELECT DISTINCT e.id,
    e.nom_entrepot
FROM entrepots e
    INNER JOIN expeditions exp ON e.id = exp.id_entrepot_destination
WHERE exp.statut = 'En transit';
-- Affichez les expéditions qui ont un poids supérieur à 100 kg et qui sont en transit.
-- exemple de sortit de requete = requeteAvance3.png
SELECT *
FROM expeditions
WHERE statut = 'En transit'
    AND poids > 100;
-- Affichez le nombre d'expéditions envoyées par chaque entrepôt.
-- exemple de sortit de requete = requeteAvance4.png
SELECT e.id,
    e.nom_entrepot,
    COUNT(exp.id) AS nombre_expeditions_envoyees
FROM entrepots e
    LEFT JOIN expeditions exp ON e.id = exp.id_entrepot_source
GROUP BY e.id,
    e.nom_entrepot;
-- Affichez le nombre total d'expéditions en transit.
-- exemple de sortit de requete = requeteAvance5.png
SELECT COUNT(*) AS nombre_expeditions_en_transit
FROM expeditions
WHERE statut = 'En transit';
-- Affichez le nombre total d'expéditions livrées.
-- exemple de sortit de requete = requeteAvance6.png
SELECT COUNT(*) AS nombre_expeditions_livrees
FROM expeditions
WHERE statut = 'Livré';
-- Affichez le nombre total d'expéditions pour chaque mois de l'année en cours.
-- exemple de sortit de requete = requeteAvance7.png
SELECT DATE_FORMAT(date_expedition, '%Y-%m') AS mois,
    COUNT(*) AS nombre_expeditions
FROM expeditions
GROUP BY mois;
-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours.
-- exemple de sortit de requete = requeteAvance8.png
SELECT DISTINCT e.id,
    e.nom_entrepot
FROM entrepots e
    INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY;
-- Affichez les entrepôts qui ont reçu des expéditions au cours des 30 derniers jours.
-- exemple de sortit de requete = requeteAvance9.png
SELECT DISTINCT e.id,
    e.nom_entrepot
FROM entrepots e
    INNER JOIN expeditions exp ON e.id = exp.id_entrepot_destination
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY;
-- Ajouter une colone date de reception et entrer des données dedans 
ALTER TABLE expeditions
ADD COLUMN date_de_reception DATE;
UPDATE expeditions
SET date_de_reception = DATE_ADD(date_expedition, INTERVAL 2 DAY)
WHERE id > 5;
UPDATE expeditions
SET date_de_reception = DATE_ADD(date_expedition, INTERVAL 8 DAY)
WHERE id <= 5;
-- Affichez les expéditions qui ont été livrées dans un délai de moins de 5 jours ouvrables.
-- exemple de sortit de requete = requeteAvance10.png
SELECT *
FROM expeditions
WHERE statut = 'Livré'
    AND DATEDIFF(date_de_reception, date_expedition) <= 5;