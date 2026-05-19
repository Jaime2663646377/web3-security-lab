# Web3 Security Lab: Entorno de Auditoría y Detección de Reentrancia

Este repositorio contiene un entorno de laboratorio contenedorizado diseñado para compilar, probar y analizar la seguridad de contratos inteligentes en Solidity. El objetivo principal es simular un ataque de reentrancia clásico, ejecutar pruebas unitarias y fuzzing mediante Foundry, y automatizar el análisis estático de vulnerabilidades para almacenar los hallazgos en una base de datos relacional.

## Arquitectura del Proyecto
El laboratorio se estructura en los siguientes componentes estratégicos:
* src/: Contratos inteligentes core que contienen las lógicas de negocio vulnerables, seguras y los scripts del atacante.
* test/: Suite de pruebas operativas de Foundry encargadas de la validación de estados y la explotación controlada.
* script/: Scripts de despliegue automatizado y simulación transaccional en la red local.
* scripts/: Herramientas auxiliares de automatización en Python encargadas del formateo e ingesta de datos.
* database/: Componente de almacenamiento persistente para el histórico de reportes generados durante las auditorías.

## Requisitos Previos del Sistema
* Docker Engine y Docker Compose para el aislamiento total del entorno.
* Foundry CLI si se opta por el desarrollo o ejecución de pruebas en el entorno local.
* Python 3.x para la ejecución nativa de scripts de migración de datos.

## Instrucciones de Despliegue y Flujo de Trabajo

1. Construcción del Contenedor Integrado
Para levantar el entorno completo automatizado mediante el archivo de configuración de Docker y ejecutar los servicios en segundo plano: docker-compose up --build

2. Ejecución Manual de la Suite de Auditoría
Si se desea ejecutar el pipeline de análisis directamente dentro del contenedor o en un entorno local previamente configurado: chmod +x run-audit.sh && ./run-audit.sh

El script automatizado ejecutará de forma secuencial la compilación de artefactos, la suite de tests unitarios, el análisis estático profundo con Slither y la posterior migración de resultados estructurados hacia la base de datos SQLite.

## Componentes de Seguridad Analizados

### El Vector de Ataque por Reentrancia
El propósito fundamental de este laboratorio es demostrar el vector de ataque basado en la violación del patrón Checks-Effects-Interactions (Controles-Efectos-Interacciones). El contrato Vulnerable.sol realiza una transferencia de fondos externa mediante llamadas de bajo nivel antes de actualizar el estado interno del balance del usuario. Esto introduce una vulnerabilidad crítica que permite al contrato Attacker.sol interceptar el flujo de ejecución a través de su función de callback receive(), reentrando al contrato original de manera iterativa hasta drenar la totalidad de sus fondos.

La mitigación correspondiente se implementa y valida en el archivo Secure.sol, aplicando el orden correcto de operaciones y, como medida de defensa en profundidad, utilizando el modificador de exclusión mutua nonReentrant.
