# Registro de Logs de Auditoría e Incidencias Detectadas

## 1. Registro de Ejecución del Analizador Estático
Durante el pipeline de ejecución, Slither parsea el árbol de sintaxis abstracta. Las incidencias críticas detectadas se estructuran de la siguiente manera en el archivo JSON crudo:

* Identificador del Detector: reentrancy-eth
* Impacto Asignado: Alto (High)
* Confianza del Hallazgo: Alta (High)
* Ubicación del Vector: Función withdraw() del contrato Vulnerable.sol. La instrucción call precede a la actualización del mapeo de balances del remitente.

## 2. Logs de Pruebas Unitarias (Forge Test)
El motor de pruebas de Foundry reporta la ejecución de la suite de la siguiente forma:

* testDepositVulnerable(): Exitoso (Success). El balance del contrato se incrementa de forma lineal ante depósitos válidos.
* testDepositSecure(): Exitoso (Success). Validación de estados coherente.
* testReentrancyAttack(): Exitoso (Success). El contrato Atacante intercepta el flujo de fondos y vacía con éxito el almacenamiento del contrato vulnerable mediante llamadas iterativas, confirmando empíricamente la vulnerabilidad.
