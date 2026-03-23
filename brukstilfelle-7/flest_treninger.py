import sqlite3
import sys

DB = "../sit.db"

def les_sql(filnavn):
    with open(filnavn, "r") as f:
        return f.read()

def flest_treninger(maaned, aar):
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    cur = conn.cursor()

    sql = les_sql("flest_treninger.sql")

    # NB: måned må være '03', '04' osv
    maaned_str = f"{int(maaned):02d}"

    cur.execute(sql, (maaned_str, str(aar), maaned_str, str(aar)))
    resultater = cur.fetchall()

    if not resultater:
        print("Ingen treninger funnet.")
    else:
        print(f"Flest treninger i {maaned_str}/{aar}:")
        for rad in resultater:
            navn = f"{rad['f_navn']} {rad['e_navn']}"
            print(f"{navn} - {rad['antall']} økter")

    conn.close()

if __name__ == "__main__":
    if len(sys.argv) == 3:
        flest_treninger(sys.argv[1], sys.argv[2])
    else:
        # Default: mars 2026
        flest_treninger("03", "2026")