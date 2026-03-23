import os
import subprocess

def run_use_case(folder, script):
    print(f"\n=== Kjører {folder} ===")
    script_path = os.path.join(folder, script)
    result = subprocess.run(["python", script_path], capture_output=True, text=True, cwd=os.getcwd())
    print(result.stdout)
    if result.stderr:
        print("Feil:", result.stderr)

if __name__ == "__main__":
    # Kjør alle brukstilfellene
    run_use_case("brukstilfelle-1", "data_insertion.py")
    run_use_case("brukstilfelle-2", "booking.py")
    run_use_case("brukstilfelle-3", "attendance.py")
    run_use_case("brukstilfelle-4", "weekly_schedule.py")
    run_use_case("brukstilfelle-5", "history.py")
    run_use_case("brukstilfelle-6", "svarteliste.py")
    run_use_case("brukstilfelle-7", "flest_treninger.py")
    run_use_case("brukstilfelle-8", "common.py")