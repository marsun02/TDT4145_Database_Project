SELECT COUNT(*) AS antall
FROM prikk
WHERE bruker_id = ?
AND dato >= DATE('now', '-30 days');