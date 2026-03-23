import sqlite3
from datetime import datetime

DB = "sit.db"

def les_sql(filnavn):
    with open(filnavn, "r", encoding="utf-8") as f:
        return f.read()

def sjekk_inn_trening(aktivitet, dato, start_tid, senter):
    conn. = sqlite3.connect(DB)
    conn.row_factory = sqlite3.row
    cur = conn.cursor()

    sql_okt = les_sql("sql/finn_okt.sql")
    cur.execute(sql_okt, (aktivitet, dato, start_tid, senter))
    okt = cur.fetchone()

    if okt is None:
        print("Fant ikke treningsøkten.")
        conn.close()
        return
    
    okt_id = okt["id"]
    now = datetime.now()

    sql_update = les_sql(gruppetime_sjekk_inn.sql)

    try:
        cur.execute(sql_update, (okt_id, now))
        conn.commit()
        print("Booking gjennomført!")
        print(f"Bruker: {epost}")
        print(f"Økt ID: {okt_id}")
    except sqlite3.IntegrityError as e:
        print("Kunne ikke booke:", e)


def book_trening(epost, aktivitet, dato, start_tid, senter):
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    # Sjekk bruker
    sql_bruker = les_sql("sql/finn_bruker.sql")
    cur.execute(sql_bruker, (epost,))
    bruker = cur.fetchone()

    if bruker is None:
        print("Bruker finnes ikke.")
        conn.close()
        return

    bruker_id = bruker["id"]

    # Sjekk økt
    sql_okt = les_sql("sql/finn_okt.sql")
    cur.execute(sql_okt, (aktivitet, dato, start_tid, senter))
    okt = cur.fetchone()

    if okt is None:
        print("Fant ikke treningsøkten.")
        conn.close()
        return

    okt_id = okt["id"]

    # sette opp booking id
    cur.execute("SELECT COALESCE(MAX(id), 0) + 1 AS ny_id FROM booking")
    booking_id = cur.fetchone()["ny_id"]

    # Opprett booking
    sql_insert = les_sql("sql/opprett_booking.sql")

    try:
        cur.execute(sql_insert, (booking_id, okt_id, bruker_id))
        conn.commit()
        print("Booking gjennomført!")
        print(f"Bruker: {epost}")
        print(f"Økt ID: {okt_id}")
    except sqlite3.IntegrityError as e:
        print("Kunne ikke booke:", e)

    conn.close()


# Tester usecasen
if __name__ == "__main__":
    book_trening(
        epost="johnny@stud.ntnu.no",
        aktivitet="Spin60",
        dato="2025-03-17",
        start_tid="18:30:00",
        senter="Øya"
    )