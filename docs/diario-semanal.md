# Documento de Seguimiento Técnico y Bitácora de Desarrollo: Laboratorio Web3

## Semana 1: Configuración de la Infraestructura y Aislamiento del Entorno
* Objetivos del Periodo: Definición formal de la arquitectura del repositorio y diseño de la contenedorización para garantizar un entorno homogéneo.
* Actividades y Avances Desarrollados:
  * Configuración exhaustiva del archivo de control foundry.toml, especificando los mapeos de ruta adecuados para la gestión de dependencias en lib/ y los archivos fuente en src/.
  * Diseño del entorno aislado multiplataforma mediante archivos de configuración Docker para asegurar la reproducibilidad de los resultados de auditoría, mitigando discrepancias por versiones de compiladores locales.
  * Inicialización e integración de los submódulos de Git requeridos por la suite de pruebas, enraizandolos con las librerías estándar de forge-std para aserciones avanzadas.

## Semana 2: Modelado de Contratos Inteligentes y Simulación de Vectores de Ataque
* Objetivos del Periodo: Implementación de la lógica de negocio maliciosa y desarrollo de las contrapartidas de seguridad basadas en buenas prácticas.
* Actividades y Avances Desarrollados:
  * Escritura del contrato base Vulnerable.sol, forzando de manera intencionada una transferencia externa mediante call que precede a la mutación de estados y saldos de los usuarios.
  * Desarrollo del contrato Attacker.sol, programando la función de redirección transaccional dentro del método fallback de recepción de Ether para estructurar el bucle recursivo de extracción de fondos.
  * Codificación y despliegue de la solución segura en Secure.sol, reestructurando las funciones críticas bajo el estricto cumplimiento del patrón Checks-Effects-Interactions para neutralizar cualquier vector de reentrada.

## Semana 3: Automatización del Pipeline de Auditoría y Persistencia de Hallazgos
* Objetivos del Periodo: Conexión de las herramientas de análisis estático con sistemas de almacenamiento relacional para el control de vulnerabilidades.
* Actividades y Avances Desarrollados:
  * Diseño del script maestro run-audit.sh para orquestar secuencialmente la compilación de contratos inteligentes, la ejecución de tests operativos y la invocación de Slither.
  * Configuración de flags específicas en el analizador estático para forzar la exportación de resultados crudos en un archivo estructurado de intercambio JSON dentro de la ruta de reportes.
  * Desarrollo del script de ingesta en Python para parsear el árbol del archivo JSON, extraer los identificadores de impacto, severidad y descripción de vulnerabilidades, e insertarlos de forma automatizada en una base de datos relacional SQLite localizada en database/lab_web3.db.
