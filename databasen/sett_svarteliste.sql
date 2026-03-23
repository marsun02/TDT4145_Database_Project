INSERT INTO svarteliste (bruker_id, start_dato, slutt_dato)
VALUES (?, DATE('now'), DATE('now', '+30 days'));