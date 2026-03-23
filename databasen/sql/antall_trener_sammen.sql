SELECT COUNT(*) AS antall_felles_treninger
FROM selvtrening AS f
WHERE f.epost = ?
  AND EXISTS (
    SELECT *
    FROM selvtrening AS s
    WHERE s.epost = ?
      AND f.treningsenter_id = s.treningsenter_id
      AND f.dato = s.dato
      AND f.tid_sjekket_inn = s.tid_sjekket_inn
  );