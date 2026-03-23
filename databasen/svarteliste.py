import sqlite3

DB = "sit.db"

def les_sql(filnavn):
    with open(filnavn, "r", encoding="utf-8") as f:
        return f.read()

def svartelist_bruker(epost):
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    # Finn bruker
    sql_bruker = les_sql("sql/finn_bruker.sql")
    cur.execute(sql_bruker, (epost,))
    bruker = cur.fetchone()

    if bruker is None:
        print("Bruker finnes ikke.")
        conn.close()
        return

    bruker_id = bruker["id"]

    # Sjekk prikker siste 30 dager
    sql_prikker = les_sql("sql/sjekk_prikker.sql")
    cur.execute(sql_prikker, (bruker_id,))
    antall = cur.fetchone()["antall"]

    # Sjekk om allerede svartelistet
    sql_sjekk = les_sql("sql/sjekk_svarteliste.sql")
    cur.execute(sql_sjekk, (bruker_id,))
    allerede = cur.fetchone()

    if allerede:
        print("Bruker er allerede svartelistet.")
        conn.close()
        return

    # Hvis nok prikker → svartelist
    if antall >= 3:
        sql_insert = les_sql("sql/sett_svarteliste.sql")
        cur.execute(sql_insert, (bruker_id,))
        conn.commit()
        print("Bruker er nå svartelistet i 30 dager.")
    else:
        print(f"Ikke nok prikker ({antall}/3).")

    conn.close()

if __name__ == "__main__":
    svartelist_bruker("johnny@stud.ntnu.no")