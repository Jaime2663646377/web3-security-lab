import json
import sqlite3
import os

JSON_PATH = 'reports/slither/results.json'
DB_PATH = 'database/lab_web3.db'

def run():
    if not os.path.exists(JSON_PATH):
        print("Error: No se encuentra el reporte JSON.")
        return

    with open(JSON_PATH, 'r') as f:
        data = json.load(f)

    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()

    for detector in data.get('results', {}).get('detectors', []):
        name = detector.get('elements')[0].get('name') if detector.get('elements') else "Global"
        vuln_type = detector.get('check')
        severity = detector.get('impact')
        description = detector.get('description')

        cursor.execute('''
            INSERT INTO findings (contract_name, vulnerability_type, severity, description)
            VALUES (?, ?, ?, ?)
        ''', (name, vuln_type, severity, description))

    conn.commit()
    print(f"Exito: Se han insertado hallazgos en la DB.")
    conn.close()

if __name__ == "__main__":
    run()
