import sqlite3
import os
import sys

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

DB = "sit.db"

def les_sql(filnavn):
    with open(filnavn, "r") as f:
        return f.read()

def kjør_sql_fil(filnavn):
    conn = sqlite3.connect(DB)
    cur = conn.cursor()
    with open(filnavn, "r") as f:
        sql = f.read()
    try:
        cur.execute(sql)
        if sql.strip().upper().startswith("SELECT"):
            resultater = cur.fetchall()
            for rad in resultater:
                print(rad)
        else:
            conn.commit()
            print("SQL utført.")
    except Exception as e:
        print(f"Feil: {e}")
    conn.close()

def brukstilfelle_1():
    print("Brukstilfelle 1: Data insertion")
    print("Data er allerede lagt inn via sit_data.sql")
    # Kjør data insertion hvis nødvendig, men det er allerede gjort

def brukstilfelle_2():
    print("Brukstilfelle 2: Booking av trening")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-2"))
    os.system(f'"{sys.executable}" booking.py')
    os.chdir(BASE_DIR)

def brukstilfelle_3():
    print("Brukstilfelle 3: Registrering av oppmøte")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-3"))
    os.system(f'"{sys.executable}" attendance.py')
    os.chdir(BASE_DIR)

def brukstilfelle_4():
    print("Brukstilfelle 4: Ukeplan")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-4"))
    os.system(f'"{sys.executable}" brukstilfelle-4.py')
    os.chdir(BASE_DIR)

def brukstilfelle_5():
    print("Brukstilfelle 5: Personlig besøkshistorie")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-5"))
    os.system(f'"{sys.executable}" history.py')
    os.chdir(BASE_DIR)

def brukstilfelle_6():
    print("Brukstilfelle 6: Svartelisting")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-6"))
    os.system(f'"{sys.executable}" svarteliste.py')
    os.chdir(BASE_DIR)

def brukstilfelle_7():
    print("Brukstilfelle 7: Flest treninger i måned")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-7"))
    os.system(f'"{sys.executable}" flest_treninger.py 03 2026')
    os.chdir(BASE_DIR)

def brukstilfelle_8():
    print("Brukstilfelle 8: Felles treninger")
    os.chdir(os.path.join(BASE_DIR, "brukstilfelle-8"))
    os.system(f'"{sys.executable}" common.py')
    os.chdir(BASE_DIR)

def main():
    while True:
        print("\nVelg brukstilfelle (1-8) eller 'q' for å avslutte:")
        valg = input("> ").strip()
        if valg == 'q':
            break
        elif valg == '1':
            brukstilfelle_1()
        elif valg == '2':
            brukstilfelle_2()
        elif valg == '3':
            brukstilfelle_3()
        elif valg == '4':
            brukstilfelle_4()
        elif valg == '5':
            brukstilfelle_5()
        elif valg == '6':
            brukstilfelle_6()
        elif valg == '7':
            brukstilfelle_7()
        elif valg == '8':
            brukstilfelle_8()
        else:
            print("Ugyldig valg.")

if __name__ == "__main__":
    main()