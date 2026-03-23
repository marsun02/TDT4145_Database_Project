INSERT INTO booking (
  id,
  okt_id,
  bruker_id,
  opprettet_tid,
  status
)
VALUES (?, ?, ?, CURRENT_TIMESTAMP, 'booket');