import sqlite3
from pathlib import Path

base = Path(__file__).resolve().parent
db_fil = base / "sit.db"
sql_fil = base / "sql/finn_timeplan.sql"

# Står i forumet at det holder å legge inn startdato som parameter. Vi legger altså ikke inn ukenummer.
start_dato = "2026-03-16"

with open(sql_fil, "r", encoding="utf-8") as f:
    query = f.read()

conn = sqlite3.connect(db_fil)
conn.row_factory = sqlite3.Row
cursor = conn.cursor()

cursor.execute(query, (start_dato, start_dato))
resultater = cursor.fetchall()

print("Ukeplan for alle treninger")
print("-" * 110)

# Går gjennom alle øktene
for rad in resultater:
    print(
        f"{rad['dato']} | {rad['start_tid']}-{rad['slutt_tid']} | "
        f"{rad['treningssenter']:<9} | {rad['sal']:<12} | "
        f"{rad['program_navn']:<10} | {rad['treningstype']:<10} | "
        f"{rad['instruktør']:<20} | kapasitet: {rad['kapasitet']}"
    )

cursor.close()
conn.close()

# Står i ed-forumet at det holder å printe øktene som er lagt inn i perioden 16.-18-mars.
