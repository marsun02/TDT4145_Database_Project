SELECT 1
FROM prikk
WHERE bruker_id = ?
AND slutt_dato >= dato('now');