SELECT u1.epost, u2.epost, COUNT(*) AS antall_felles_treninger
FROM booking b1
JOIN booking b2 ON b1.okt_id = b2.okt_id AND b1.bruker_id < b2.bruker_id
JOIN bruker u1 ON b1.bruker_id = u1.id
JOIN bruker u2 ON b2.bruker_id = u2.id
WHERE b1.status = 'deltatt' AND b2.status = 'deltatt'
GROUP BY u1.epost, u2.epost
ORDER BY antall_felles_treninger DESC;