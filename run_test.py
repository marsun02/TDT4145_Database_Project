import subprocess
import os

os.chdir("databasen")
result = subprocess.run(["python", "test_all.py"], capture_output=True, text=True)
print(result.stdout)
if result.stderr:
    print("Feil:", result.stderr)