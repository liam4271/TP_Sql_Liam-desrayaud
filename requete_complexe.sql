-- ajout d'une colone continent et insertion des données à l'interieur 
ALTER TABLE entrepots
ADD COLUMN continent VARCHAR(50);
UPDATE entrepots
SET continent = CASE
    WHEN pays IN ('France', 'Germany', 'Spain') THEN 'Europe'
    WHEN pays IN ('China', 'Japan', 'India') THEN 'Asia' -- Ajout d'autres correspondances pays-continent au besoin
    ELSE 'Unknown' -- Gérez les cas non répertoriés
  END;
-- Affichez les expéditions en transit initiées par un entrepôt en Europe et à destination d'un entrepôt en Asie.
-- exemple de sortit de requete = requeteComplexe1.png
SELECT exp.*
FROM expeditions exp
  INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
  INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE source.continent = 'Europe'
  AND destination.continent = 'Asia'
  AND exp.statut = 'En transit';
-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans le même pays.
-- exemple de sortit de requete = requeteComplexe2.png
SELECT DISTINCT e.id,
  e.nom_entrepot
FROM entrepots e
  INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
  INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE e.pays = destination.pays;
-- Affichez les entrepôts qui ont envoyé des expéditions à destination d'un entrepôt situé dans un pays différent.
-- exemple de sortit de requete = requeteComplexe3.png
SELECT DISTINCT e.id,
  e.nom_entrepot
FROM entrepots e
  INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
  INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
WHERE e.pays != destination.pays;
-- Affichez les expéditions en transit initiées par un entrepôt situé dans un pays dont le nom commence par la lettre "F" et qui pèsent plus de 500 kg.
-- exemple de sortit de requete = requeteComplexe4.png
SELECT exp.*
FROM expeditions exp
  INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
WHERE LEFT(source.pays, 1) = 'F'
  AND exp.poids > 500
  AND exp.statut = 'En transit';
-- Affichez le nombre total d'expéditions pour chaque combinaison de pays d'origine et de destination.
-- exemple de sortit de requete = requeteComplexe5.png
SELECT source.pays AS pays_origine,
  destination.pays AS pays_destination,
  COUNT(*) AS nombre_expeditions
FROM expeditions exp
  INNER JOIN entrepots source ON exp.id_entrepot_source = source.id
  INNER JOIN entrepots destination ON exp.id_entrepot_destination = destination.id
GROUP BY source.pays,
  destination.pays;
-- Affichez les entrepôts qui ont envoyé des expéditions au cours des 30 derniers jours et dont le poids total des expéditions est supérieur à 1000 kg.
-- exemple de sortit de requete = requeteComplexe6.png
SELECT e.id,
  e.nom_entrepot
FROM entrepots e
  INNER JOIN expeditions exp ON e.id = exp.id_entrepot_source
WHERE exp.date_expedition >= CURDATE() - INTERVAL 30 DAY
GROUP BY e.id,
  e.nom_entrepot
HAVING SUM(exp.poids) > 1000;
-- Ajouter une colone livraison prevu et entrer des données dedans 
ALTER TABLE expeditions
ADD COLUMN livraison_prevu DATE;
UPDATE expeditions
SET livraison_prevu = DATE_ADD(date_expedition, INTERVAL 2 DAY) -- Affichez les expéditions qui ont été livrées avec un retard de plus de 2 jours ouvrables.
  -- exemple de sortit de requete = requeteComplexe7.png
SELECT *
FROM expeditions
WHERE statut = 'Livré'
  AND DATEDIFF(date_de_reception, livraison_prevu) > 2;
-- Affichez le nombre total d'expéditions pour chaque jour du mois en cours, trié par ordre décroissant.
-- exemple de sortit de requete = requeteComplexe8.png
SELECT DATE_FORMAT(date_expedition, '%Y-%m-%d') AS jour,
  COUNT(*) AS nombre_expeditions
FROM expeditions
WHERE MONTH(date_expedition) = MONTH(CURDATE())
GROUP BY jour
ORDER BY jour DESC;