SELECT g.id
FROM gruppetrening_okt g
JOIN treningsenter ts ON g.treningsenter_id = ts.id
WHERE g.type_ = ?
  AND g.dato = ?
  AND g.start_tid = ?
  AND ts.navn = ?;