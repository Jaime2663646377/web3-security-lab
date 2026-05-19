# Gestión y Configuración de Herramientas de Auditoría

## 1. Analizador Estático: Slither
Slither es una herramienta de análisis estático basada en Python que convierte el código fuente de Solidity en una representación intermedia llamada SlithIR. Esto permite la ejecución de detectores de vulnerabilidades con alta precisión y bajo índice de falsos positivos.

* Mecanismo de Integración: Compilación previa del proyecto mediante Foundry para generar los artefactos (AST).
* Foco de Detección: Identificación de la violación del patrón Checks-Effects-Interactions, reentrancia en llamadas externas, variables no inicializadas y sombreado de variables de estado.

## 2. Entorno de Ejecución y Pruebas: Foundry
Foundry es un entorno de desarrollo para contratos inteligentes escrito en Rust, caracterizado por su velocidad de ejecución y su capacidad para gestionar pruebas unitarias de manera nativa en Solidity.

* Herramientas Core Utilizadas:
  * Forge: Compilación de contratos, administración de dependencias y ejecución de pruebas de aserción.
  * Fuzzing Integrado: Inyección automatizada de valores pseudoaleatorios en variables críticas de los tests para evaluar la robustez de los tipos de datos (como uint256).
