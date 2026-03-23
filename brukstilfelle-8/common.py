import sqlite3

DB = "../sit.db"

def kjør_sql_fil(filnavn):
    conn = sqlite3.connect(DB)
    cur = conn.cursor()
    with open(filnavn, "r") as f:
        sql = f.read()
    cur.execute(sql)
    resultater = cur.fetchall()
    for rad in resultater:
        print(rad)
    conn.close()

if __name__ == "__main__":
    kjør_sql_fil("antall_trener_sammen.sql")