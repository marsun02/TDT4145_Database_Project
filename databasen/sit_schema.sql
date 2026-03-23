CREATE TABLE ansatt (
  id              INT NOT NULL,
  f_navn          VARCHAR(50) NOT NULL,
  m_navn          VARCHAR(50),
  e_navn          VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE bruker(
  id              INT NOT NULL,
  f_navn          VARCHAR(50) NOT NULL,
  m_navn          VARCHAR(50),
  e_navn          VARCHAR(50) NOT NULL,
  epost           VARCHAR(110) NOT NULL UNIQUE,
  mobil           VARCHAR(25) NOT NULL UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE idrettslag(
  id                INT NOT NULL        ,
  navn              VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE program(
  id              INT NOT NULL,
  program_navn    VARCHAR(100) NOT NULL,
  beskrivelse     VARCHAR(250),
  PRIMARY KEY (id)
);

CREATE TABLE type_gruppetrening(
  id              INT NOT NULL,
  type_           VARCHAR(50) NOT NULL,
  program_id      INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY(program_id) REFERENCES program(id)
);

CREATE TABLE adresse (
  id INT PRIMARY KEY,
  gate VARCHAR(100) NOT NULL,
  nr INT NOT NULL,
  postnr VARCHAR(20) NOT NULL,
  poststed VARCHAR(100) NOT NULL
);

CREATE TABLE apningstid(
  id              INT NOT NULL,
  dag             VARCHAR(15) NOT NULL,
  start_tid       TIME        NOT NULL,
  slutt_tid       TIME        NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE treningsenter(
  id            INT NOT NULL,
  apningstid_id   INT NOT NULL,
  adresse_id       INT NOT NULL,
  navn            VARCHAR(50) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(apningstid_id)  REFERENCES apningstid(id),
  FOREIGN KEY(adresse_id) REFERENCES adresse(id)
);

CREATE TABLE bemanningstid(
  id              INT NOT NULL,
  treningsenter_id              INT NOT NULL,
  dag             VARCHAR(15) NOT NULL,
  start_tid       TIME        NOT NULL,
  slutt_tid       TIME        NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY(treningsenter_id) REFERENCES treningsenter(id)

);

-- Koblingstabell mellom treningssenter og bemanningstid
CREATE TABLE treningsenter_bemanningstid(
  treningsenter_id INT,
  bemanningstid_id INT,
  PRIMARY KEY (treningsenter_id, bemanningstid_id),
  FOREIGN KEY (treningsenter_id) REFERENCES treningsenter(id),
  FOREIGN KEY (bemanningstid_id) REFERENCES bemanningstid(id)
);

CREATE TABLE sal(
  id            INT NOT NULL,
  treningsenter_id  INT NOT NULL,
  navn          VARCHAR(50) NOT NULL,
  type_rom      VARCHAR(50),
  kapasitet     INT        ,
  PRIMARY KEY (id)         ,
  FOREIGN KEY (treningsenter_id) REFERENCES treningsenter(id)
);

CREATE TABLE sykkel(
  id            INT NOT NULL,
  sal_id        INT NOT NULL,
  bodybike      BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (id)          ,
  FOREIGN KEY (sal_id) REFERENCES sal(id)
);

CREATE TABLE tredemolle(
  id            INT NOT NULL,
  sal_id        INT NOT NULL,
  produsent     VARCHAR(50),
  maksfart      INT        ,
  maks_stigning INT        ,
  PRIMARY KEY (id),
  FOREIGN KEY (sal_id) REFERENCES sal(id)
);

CREATE TABLE fasilitet(
  id                INT NOT NULL,
  type_             VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tilbyr(
  treningsenter_id  INT NOT NULL,
  fasilitet_id      INT NOT NULL,
  PRIMARY KEY (treningsenter_id, fasilitet_id),
  FOREIGN KEY (treningsenter_id) REFERENCES treningsenter(id),
  FOREIGN KEY (fasilitet_id) REFERENCES fasilitet(id)
);

CREATE TABLE gruppetrening_okt(
  id              INT NOT NULL,
  ansatt_id       INT NOT NULL,
  type_id           INT NOT NULL,
  treningsenter_id  INT NOT NULL,
  sal_id          INT NOT NULL,
  dato            DATE NOT NULL,
  start_tid       TIME NOT NULL,
  slutt_tid       TIME NOT NULL,
  publisert_tid   DATETIME NOT NULL,
  kapasitet       INT NOT NULL CHECK (kapasitet > 0),
  PRIMARY KEY (id),
  FOREIGN KEY (ansatt_id) REFERENCES ansatt(id),
  FOREIGN KEY (type_id) REFERENCES type_gruppetrening(id),
  FOREIGN KEY (treningsenter_id) REFERENCES treningsenter(id),
  FOREIGN KEY (sal_id) REFERENCES sal(id)
);

CREATE TABLE booking(
  id               INT NOT NULL,
  okt_id           INT NOT NULL,
  bruker_id        INT NOT NULL,
  opprettet_tid     DATETIME   ,
  kansellert_tid     DATETIME   ,
  status           VARCHAR(50), 
  tidspunkt_sjekketinn DATETIME,
  PRIMARY KEY(id)             ,
  FOREIGN KEY(okt_id) REFERENCES gruppetrening_okt(id),
  FOREIGN KEY(bruker_id) REFERENCES bruker(id)
);

CREATE TABLE prikk(
  id             INT NOT NULL ,
  bruker_id      INT NOT NULL ,
  dato           DATE         ,
  slutt_dato     DATE NOT NULL,
  grunn          VARCHAR(250) ,
  PRIMARY KEY (id),
  FOREIGN KEY (bruker_id) REFERENCES bruker(id)
);

CREATE TABLE medlem(
  bruker_id         INT NOT NULL,
  idrettslag_id     INT NOT NULL,
  PRIMARY KEY (bruker_id, idrettslag_id),
  FOREIGN KEY (bruker_id) REFERENCES bruker(id),
  FOREIGN KEY (idrettslag_id) REFERENCES idrettslag(id)
);

CREATE TABLE idrettslag_gruppe(
  gruppenavn       VARCHAR(80) NOT NULL,
  idrettslag_id    INT NOT NULL        ,
  PRIMARY KEY (gruppenavn, idrettslag_id),
  FOREIGN KEY (idrettslag_id) REFERENCES idrettslag(id)
);

CREATE TABLE reservasjon(
  dag              VARCHAR(15) NOT NULL,
  start_tid        TIME NOT NULL       ,
  slutt_tid        TIME NOT NULL       ,
  sal_id           INT NOT NULL        ,
  gruppenavn       VARCHAR(80) NOT NULL,
  idrettslag_id    INT NOT NULL        ,
  PRIMARY KEY (dag, start_tid, slutt_tid, sal_id),
  FOREIGN KEY (sal_id) REFERENCES sal(id),
  FOREIGN KEY (gruppenavn, idrettslag_id)
  REFERENCES idrettslag_gruppe(gruppenavn, idrettslag_id)
);

CREATE TABLE selvtrening(
  dato        DATE NOT NULL,
  tid_sjekket_inn   TIME NOT NULL,
  epost              VARCHAR(110) NOT NULL,
  treningsenter_id  INT NOT NULL,
  PRIMARY KEY (dato, tid_sjekket_inn, epost),
  FOREIGN KEY (epost) REFERENCES bruker(epost),
  FOREIGN KEY (treningsenter_id) REFERENCES treningsenter(id)
)
