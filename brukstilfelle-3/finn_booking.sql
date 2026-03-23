SELECT b.id
FROM booking b
JOIN bruker u ON b.bruker_id = u.id
WHERE b.okt_id = ?
  AND u.epost = ?
  AND b.kansellert_tid IS NULL;