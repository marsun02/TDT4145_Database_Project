SELECT b.f_navn, b.e_navn, b.epost, COUNT(*) AS antall
FROM booking bo
JOIN bruker b ON bo.bruker_id = b.id
JOIN gruppetrening_okt g ON bo.okt_id = g.id
WHERE strftime('%m', g.dato) = ?
AND strftime('%Y', g.dato) = ?
AND bo.status = 'deltatt'
GROUP BY b.id
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM booking bo2
        JOIN gruppetrening_okt g2 ON bo2.okt_id = g2.id
        WHERE strftime('%m', g2.dato) = ?
        AND strftime('%Y', g2.dato) = ?
        AND bo2.status = 'deltatt'
        GROUP BY bo2.bruker_id
    )
);