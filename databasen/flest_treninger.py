import sqlite3
import sys

DB = "sit.db"

def les_sql(filnavn):
    with open(filnavn, "r", encoding="utf-8") as f:
        return f.read()

def flest_treninger(maaned, aar):
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    sql = les_sql("sql/flest_treninger.sql")

    # NB: måned må være '03', '04' osv
    maaned_str = f"{int(maaned):02d}"

    cur.execute(sql, (maaned_str, str(aar), maaned_str, str(aar)))
    resultater = cur.fetchall()

    if not resultater:
        print("Ingen treninger funnet.")
    else:
        print(f"Flest treninger i {maaned_str}/{aar}:")
        for rad in resultater:
            print(f"{rad['epost']} - {rad['antall']} økter")

    conn.close()

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python flest_treninger.py <maaned> <aar>")
    else:
        flest_treninger(sys.argv[1], sys.argv[2])