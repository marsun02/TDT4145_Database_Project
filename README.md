# TDT4145 – Group 190

## How to Run the Project

Follow these steps to set up and run the project:

### 1. Clone the rapository
Open a terminal and clone the project:
```bash
git clone https://git.ntnu.no/martiasu/TDT4145-group-190.git
cd TDT4145-group-190
```

### 2. Install Required Extensions
Make sure you have the following VS Code extensions installed:
- SQLite Viewer
- SQLTools SQLite

### 3. Navigate to the Project Directory
Open a terminal and move into the project folder:

cd TDT4145-group-190

### 4. Set Up the Database
Run the following commands in a terminal to create and populate the database:
```bash
sqlite3 treningDB.db < sit_schema.sql
sqlite3 treningDB.db < sit_data.sql
```
### 5. Run the Application
Go back to the root project directory (if needed), then run:
```bash
python main.py
```
### 6. Use the Program
After running the program, you will be prompted to choose a use case.

Enter a number between 1 and 8 to test the desired functionality (number of the usecases).

## Notes
- Make sure you have Python installed on your system.
- Ensure sqlite3 is available in your terminal.
- If you use mac or linux you have to use python3 instead of python to run the main.py file.