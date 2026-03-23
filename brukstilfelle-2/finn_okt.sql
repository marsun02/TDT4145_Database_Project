SELECT g.id
FROM gruppetrening_okt g
JOIN treningsenter ts ON g.treningsenter_id = ts.id
JOIN type_gruppetrening tg ON g.type_id = tg.id
JOIN program p ON tg.program_id = p.id
WHERE p.program_navn = ?
  AND g.dato = ?
  AND g.start_tid = ?
  AND ts.navn = ?;