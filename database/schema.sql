CREATE TABLE IF NOT EXISTS findings (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    contract_name TEXT,
    vulnerability_type TEXT,
    severity TEXT,
    description TEXT,
    detected_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
