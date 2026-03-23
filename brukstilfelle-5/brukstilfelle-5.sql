SELECT DISTINCT
    p.program_navn AS aktivitet,
    'gruppetrening' AS type,
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

UNION ALL

SELECT DISTINCT
    'Egentrening' AS aktivitet,
    'selvtrening' AS type,
    t.navn AS treningssenter,
    s.dato,
    s.tid_sjekket_inn AS start_tid,
    '-' AS slutt_tid
FROM selvtrening s
JOIN bruker u
    ON u.epost = s.epost
JOIN treningsenter t
    ON t.id = s.treningsenter_id
WHERE u.epost = 'johnny@stud.ntnu.no'
  AND s.dato >= '2026-01-01'

ORDER BY dato ASC, start_tid ASC;