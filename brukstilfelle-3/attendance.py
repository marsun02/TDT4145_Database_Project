import sqlite3
from datetime import datetime
import os

DB = "../sit.db"

def les_sql(filnavn):
    with open(filnavn, "r") as f:
        return f.read()

def sjekk_inn_trening(epost, aktivitet, dato, start_tid, senter):
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    sql_okt = les_sql("finn_okt.sql")
    cur.execute(sql_okt, (aktivitet, dato, start_tid, senter))
    okt = cur.fetchone()

    if okt is None:
        print("Fant ikke treningsøkten.")
        conn.close()
        return
    
    okt_id = okt["id"]

    sql_booking = les_sql("finn_booking.sql")
    cur.execute(sql_booking, (okt_id, epost))
    booking = cur.fetchone()

    if booking is None:
        print("Fant ingen aktiv booking for denne brukeren.")
        conn.close()
        return
        
    booking_id = booking["id"]
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    sql_update = les_sql("gruppetime_sjekk_inn.sql")

    try:
        cur.execute(sql_update, (now, booking_id))
        conn.commit()
        print("Sjekk inn gjennomført!")
        print(f"Bruker: {epost}")
        print(f"Økt ID: {okt_id}")
    except sqlite3.IntegrityError as e:
        print("Kunne ikke sjekke inn:", e)

    conn.close()

if __name__ == "__main__":
    sjekk_inn_trening("johnny@stud.ntnu.no", "Spin60", "2026-03-17", "18:30:00", "Øya")