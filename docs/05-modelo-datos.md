# Especificación Técnico-Estructural del Modelo de Datos

## 1. Arquitectura de Almacenamiento Relacional
Para garantizar la persistencia de las métricas de seguridad generadas en el laboratorio, se ha diseñado una base de datos SQLite ligera optimizada para operaciones de escritura secuencial desde entornos automatizados.

## 2. Esquema de la Tabla (Table Schema)
La estructura de persistencia se modela mediante la tabla findings descrita a continuación:

* id: Llave primaria (INTEGER PRIMARY KEY AUTOINCREMENT) encargada de indexar cada hallazgo de forma unívoca.
* contract_name: Tipo de datos TEXT. Almacena el identificador del contrato inteligente evaluado.
* vulnerability_type: Tipo de datos TEXT. Almacena el identificador del check específico de Slither que ha saltado.
* severity: Tipo de datos TEXT. Clasificación cualitativa del riesgo asociado al hallazgo (High, Medium, Low, Informational).
* description: Tipo de datos TEXT. Volcado analítico del reporte de vulnerabilidad que detalla las líneas de código afectadas.
