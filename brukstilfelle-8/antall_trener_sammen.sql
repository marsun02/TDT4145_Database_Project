SELECT 
    u1.f_navn || ' ' || u1.e_navn AS navn1,
    u2.f_navn || ' ' || u2.e_navn AS navn2,
    COUNT(*) AS antall_felles_treninger
FROM booking b1
JOIN booking b2 
    ON b1.okt_id = b2.okt_id 
    AND b1.bruker_id < b2.bruker_id
JOIN bruker u1 ON b1.bruker_id = u1.id
JOIN bruker u2 ON b2.bruker_id = u2.id
WHERE b1.status = 'deltatt' 
  AND b2.status = 'deltatt'
GROUP BY navn1, navn2
ORDER BY antall_felles_treninger DESC;