-- Numero de findings por severidad
SELECT severity, COUNT(*) AS total
FROM findings
GROUP BY severity;

-- Findings de severidad alta
SELECT title, severity, description
FROM findings
WHERE severity = 'High';

-- Listar todas las herramientas usadas
SELECT name, version
FROM tools;
