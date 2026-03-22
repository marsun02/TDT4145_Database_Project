SELECT DISTINCT -- Ønsker unike rader
    p.program_navn AS trening,
    t.navn AS treningssenter,
    g.dato,
    g.start_tid,
    g.slutt_tid
FROM booking b
JOIN bruker u
    ON u.id = b.bruker_id
JOIN gruppetrening_okt g
    ON g.id = b.okt_id
JOIN treningsenter t
    ON t.id = g.treningsenter_id
JOIN type_gruppetrening tg
    ON tg.id = g.type_id
JOIN program p
    ON p.id = tg.program_id
WHERE u.epost = 'johnny@stud.ntnu.no'
  AND g.dato >= '2026-01-01'
  AND b.status = 'deltatt'
ORDER BY g.dato ASC, g.start_tid ASC; -- For å gjøre det oversiktelig