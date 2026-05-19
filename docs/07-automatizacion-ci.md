# Documentación de Automatización e Integración Continua (CI)

## 1. Flujo Automatizado del Pipeline (run-audit.sh)
El script maestro actúa como el orquestador central del laboratorio, asegurando un pipeline libre de intervenciones manuales que consta de cuatro fases lógicas bien definidas:

* Fase de Inicialización: Compilación limpia de los artefactos del proyecto con soporte nativo de dependencias.
* Fase de Validación Dinámica: Ejecución de las pruebas de Forge en Foundry para verificar aserciones y comportamiento de los exploits en tiempo de ejecución.
* Fase de Análisis Estático: Invocación de Slither configurado para omitir interrupciones del sistema operativo y exportar directamente el reporte técnico estructurado en formato JSON.
* Fase de Ingesta Automatizada: Ejecución del script extractor en Python que parsea el JSON, crea de forma autónoma la base de datos relacional SQLite si no existiera y migra la data de manera inmediata.

## 2. Extensibilidad hacia Plataformas de Integración Continua
Este diseño modular permite que tanto el script bash como el Dockerfile asociado sean exportables a plataformas de CI como GitHub Actions o GitLab CI, requiriendo únicamente la definición de disparadores ante eventos de push o pull request.
