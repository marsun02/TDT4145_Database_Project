INSERT INTO apningstid (id, dag, start_tid, slutt_tid) VALUES
(1, 'Mandag-søndag', '05:00:00', '00:00:00'),
(2, 'Mandag–søndag', '05:00:00', '00:00:00');

INSERT INTO adresse (id, gate, nr, postnr, poststed) VALUES
(1, 'Vangslundsgate', 2, '7030', 'Trondheim'),
(2, 'Loholt allé', 81, '7049', 'Trondheim');

-- Øya treningssenter er ubemannet

INSERT INTO treningsenter (id, apningstid_id, adresse_id, navn, selvtrening) VALUES
(1, 1, 1, 'Øya', TRUE),
(2, 2, 2, 'Dragvoll', TRUE);

INSERT INTO bemanningstid (id, treningsenter_id, dag, start_tid, slutt_tid) VALUES
-- Dragvoll
-- Formiddag mandag, onsdag, fredag: 08:00–12:00
(2, 2, 'Mandag',  '08:00:00', '12:00:00'),
(3, 2, 'Onsdag',  '08:00:00', '12:00:00'),
(4, 2, 'Fredag',  '08:00:00', '12:00:00'),

-- Ettermiddag mandag–fredag: 15:00–22:00
(5, 2, 'Mandag',  '15:00:00', '22:00:00'),
(6, 2, 'Tirsdag', '15:00:00', '22:00:00'),
(7, 2, 'Onsdag',  '15:00:00', '22:00:00'),
(8, 2, 'Torsdag', '15:00:00', '22:00:00'),
(9, 2, 'Fredag',  '15:00:00', '22:00:00'),

-- Lørdag–søndag: 09:00–20:00
(10, 2, 'Lørdag', '09:00:00', '20:00:00'),
(11, 2, 'Søndag', '09:00:00', '20:00:00');


INSERT INTO ansatt (id, f_navn, m_navn, e_navn) VALUES
(1, 'Siri', 'M.', 'L'),
(2, 'Trine', 'R.', 'Nordmann'),
(3, 'Jorunn', 'B.', 'B.'),
(4, 'Eirin', 'M.', 'H.'),
(5, 'Ramona', 'L.', 'S.'),
(6, 'Nora', 'D.', 'Nordmann'),
(7, 'Håkon', 'W.', 'Nordmann'),
(8, 'Hanne', 'H.', 'Nordmann'),
(9, 'Ada', 'J.', 'R.'),
(10, 'Sindre', 'K.', 'S.'),
(11, 'Kaja', 'S.', 'Nordmann'),
(12, 'Amalie', 'M.', 'H.');

INSERT INTO bruker (id, f_navn, m_navn, e_navn, epost, mobil) VALUES
(1, 'Roy', 'Roger',  'Hansen', 'royrh@example.no', '90121212'),
(2, 'Maria', 'Elise',  'Johansen', 'maria.joh02@example.no','91255555'),
(3, 'Amalie', 'Olsen', 'Gjersøe', 'amalie.olsen@example.no', '92344444'),
(4, 'Krsitoffer', 'M.', 'Larsen', 'kristoffer53@example.no', '93498989'),
(5, 'Jon', 'Kristian', 'Nilsen', 'jon.nilsen@example.no', '94567676'),
(6, 'Birgit', 'T.', 'Berg', 'birgit.slay@example.no', '95699999'),
(7, 'Magnus', 'Eirik', 'Dahl', 'magnus.dahl@example.no', '96777777'),
(8, 'Eiril', 'Sofie', 'Sola', 'eirilsola@example.no', '97888888'),
(9,'Johnny', 'J.', 'Johansen', 'johnny@stud.ntnu.no', '90000001'); -- Spesifikk bruker vi skulle legge inn

INSERT INTO program(id, program_navn, beskrivelse) VALUES
(1, 'Spin45', 'En variert spinningtime med 2-3 arbeidsperioder som passer for alle. Perfekt for deg som er ny på spinning! Du styrer intensiteten selv, og vi bruker takta til å tråkke oss gjennom timen.'),
(2, 'Spin60', 'En variert spinningtime som er noe mer utfordrende enn Spin45 med lengre varighet og tidvis høyere tempo. Du styrer likevel intensiteten selv, og timen passer alle som liker å tråkke i takt! Timen inneholder 2-4 arbeidsperioder med variert løype.'),
(3, 'Spin 8x3', 'En forutsigbar intervalltime med 8 intervaller på 3 minutter hver, der du sitter og står annethvert drag. 90-120 sek pause mellom hvert intervall. God oppvarming og nedsykling inkludert.'),
(4, 'Spin 4x4', 'En forutsigbar intervalltime: 4 stående intervaller på 4 minutter hver, med ca 2 minutter aktiv pause mellom hvert drag. God oppvarming og nedsykling inkludert.');

INSERT INTO type_gruppetrening(id, type_, program_id) VALUES
(1, 'spinning', 1),
(2, 'spinning', 2),
(3, 'spinning', 3),
(4, 'spinning', 4);

INSERT INTO sal(id, treningsenter_id, navn, type_rom, kapasitet) VALUES
--  Saler på Øya
(101, 1, 'Flerbrukshall 1', 'Flerbrukshall', 50),
(102, 1, 'Flerbrukshall 2', 'Flerbrukshall', 50),
(202, 1, 'Sykkelsal', 'Spinningrom', 38),
-- Saler på Dragvoll
(701, 2, 'Sykkelsal', 'Spinningrom', 20);

INSERT INTO sykkel(id, sal_id, bodybike) VALUES
-- Sykler på Øya
(1,202,TRUE),
(2,202,TRUE),
(3,202,TRUE),
(4,202,TRUE),
(5,202,TRUE),
(6,202,TRUE),
(7,202,TRUE),
(8,202,FALSE),
(9,202,FALSE),
(10,202,FALSE); -- Legger ikke inn alle 38 syklene i sal 202
-- Skal ikke legge inn sykler for Dragvoll

INSERT INTO fasilitet (id, type_) VALUES
-- Kun de som er på Øya
(1,  'Gruppetrening'),
(2,  'Egentrening'),
(3,  'Utholdenhet'),
(4,  'Styrke'),
(5,  'Yoga'),
(6,  'Klatring'),
(7,  'Spinning'),
(8,  'Hall'),
(9,  'Garderober'),
(10, 'Badstue'),
(11, 'Dusj');

INSERT INTO tilbyr (treningsenter_id, fasilitet_id) VALUES
-- Øya
(1, 1),  -- Gruppetrening
(1, 2),  -- Egentrening
(1, 3),  -- Utholdenhet
(1, 4),  -- Styrke
(1, 5),  -- Yoga
(1, 6),  -- Klatring
(1, 7),  -- Spinning
(1, 8),  -- Hall
(1, 9),  -- Garderober
(1,10),  -- Badstue
(1,11);  -- Dusj


INSERT INTO gruppetrening_okt (id, ansatt_id, type_id, treningsenter_id, sal_id, dato, start_tid, slutt_tid, publisert_tid, kapasitet) VALUES
-- Alle spinningøktene, på Øya og Dragvoll, 16.-18.mars
(1, 4, 4, 1, 202, '2026-03-16', '07:00:00', '07:45:00', '2025-03-14 07:00:00', 38), -- Spin 4x4, Øya
(2, 1, 4, 2, 701, '2026-03-16', '16:30:00', '17:15:00', '2025-03-14 16:30:00', 20), -- Spin 4x4, Dragvoll
(3, 3, 1, 1, 202, '2026-03-16', '16:30:00', '17:15:00', '2025-03-14 16:30:00', 38), -- Spin 45, Øya
(4, 5, 3, 1, 202, '2026-03-16', '17:40:00', '18:35:00', '2025-03-14 17:40:00', 38), -- Spin 8x3, Øya
(5, 2, 2, 1, 202, '2026-03-16', '19:00:00', '20:00:00', '2025-03-14 19:00:00', 38), -- Spin60, Øya
(6, 6, 3, 1, 202, '2026-03-17', '07:00:00', '07:55:00', '2025-03-15 07:00:00', 38), -- Spin 8x3, Øya
(7, 7, 2, 1, 202, '2026-03-17', '18:30:00', '19:30:00', '2025-03-15 18:30:00', 38), -- Spin60, Øya
(8, 8, 4, 1, 202, '2026-03-17', '19:45:00', '20:30:00', '2025-03-15 19:45:00', 38), -- Spin 4x4, Øya
(9, 6, 2, 1, 202, '2026-03-18', '16:15:00', '17:15:00', '2025-03-16 16:15:00', 38), -- Spin60, Øya
(10, 9, 1, 2, 701, '2026-03-18', '16:30:00', '17:15:00', '2025-03-16 16:30:00', 20), -- Spin45, Dragvoll
(11, 10, 4, 1, 202, '2026-03-18', '17:30:00', '18:15:00', '2025-03-16 17:30:00', 38), -- Spin 4x4, Øya
(12, 11, 1, 1, 202, '2026-03-18', '18:30:00', '19:15:00', '2025-03-16 18:30:00', 38), -- Spin45, Øya
(13, 12, 3, 1, 202, '2026-03-18', '19:30:00', '20:25:00', '2025-03-16 19:30:00', 38); -- Spin 8x3, Øya

INSERT INTO selvtrening(dato, tid_sjekket_inn, epost, treningsenter_id) VALUES
-- 16. mars
('2026-03-16', '06:15:00', 'maria.joh02@example.no', 1),
('2026-03-16', '06:15:00', 'amalie.olsen@example.no', 1),
('2026-03-16', '09:00:00', 'magnus.dahl@example.no', 1),
('2026-03-16', '09:00:00', 'eirilsola@example.no', 1),
('2026-03-16', '14:30:00', 'royrh@example.no', 2),
('2026-03-16', '14:30:00', 'johnny@stud.ntnu.no', 2),
('2026-03-16', '18:45:00', 'jon.nilsen@example.no', 2),
('2026-03-16', '18:45:00', 'birgit.slay@example.no', 2),
('2026-03-16', '21:30:00', 'kristoffer53@example.no', 1),

-- 17. mars
('2026-03-17', '07:30:00', 'maria.joh02@example.no', 2),
('2026-03-17', '07:30:00', 'amalie.olsen@example.no', 2),
('2026-03-17', '10:00:00', 'magnus.dahl@example.no', 1),
('2026-03-17', '10:00:00', 'eirilsola@example.no', 1),
('2026-03-17', '15:00:00', 'jon.nilsen@example.no', 2),
('2026-03-17', '15:00:00', 'birgit.slay@example.no', 2),
('2026-03-17', '19:15:00', 'johnny@stud.ntnu.no', 1),
('2026-03-17', '19:15:00', 'royrh@example.no', 1),
('2026-03-17', '22:30:00', 'kristoffer53@example.no', 2),

-- 18. mars
('2026-03-18', '06:00:00', 'maria.joh02@example.no', 1),
('2026-03-18', '06:00:00', 'amalie.olsen@example.no', 1),
('2026-03-18', '08:30:00', 'magnus.dahl@example.no', 2),
('2026-03-18', '08:30:00', 'eirilsola@example.no', 2),
('2026-03-18', '16:00:00', 'jon.nilsen@example.no', 1),
('2026-03-18', '16:00:00', 'birgit.slay@example.no', 1),
('2026-03-18', '20:45:00', 'johnny@stud.ntnu.no', 2),
('2026-03-18', '20:45:00', 'royrh@example.no', 2),
('2026-03-18', '23:30:00', 'kristoffer53@example.no', 1);