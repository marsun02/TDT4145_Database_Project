SELECT
    g.dato,
    g.start_tid,
    g.slutt_tid,
    t.navn AS treningssenter,
    s.navn AS sal,
    p.program_navn,
    tg.type_ AS treningstype,
    a.f_navn AS instruktør,
    g.kapasitet
FROM gruppetrening_okt g
JOIN treningsenter t
    ON t.id = g.treningsenter_id
JOIN sal s
    ON s.id = g.sal_id
JOIN ansatt a
    ON a.id = g.ansatt_id
JOIN type_gruppetrening tg
    ON tg.id = g.type_id
JOIN program p
    ON p.id = tg.program_id
WHERE g.dato BETWEEN ? AND date(?, '+6 days')
ORDER BY g.dato ASC, g.start_tid ASC, t.navn ASC;