SELECT 
    b1.f_navn || ' ' || b1.e_navn AS navn1,
    b2.f_navn || ' ' || b2.e_navn AS navn2,
    COUNT(*) AS antall_felles_selvtreninger
FROM selvtrening s1
JOIN selvtrening s2
    ON s1.dato = s2.dato
   AND s1.tid_sjekket_inn = s2.tid_sjekket_inn
   AND s1.treningsenter_id = s2.treningsenter_id
   AND s1.epost < s2.epost
JOIN bruker b1 ON s1.epost = b1.epost
JOIN bruker b2 ON s2.epost = b2.epost
GROUP BY b1.id, b2.id
ORDER BY antall_felles_selvtreninger DESC, navn1, navn2;