SELECT 1
FROM svarteliste
WHERE bruker_id = ?
AND slutt_dato >= DATE('now');