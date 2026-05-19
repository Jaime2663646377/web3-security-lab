# 1. Usar una base oficial de Python sobre Ubuntu
FROM python:3.10-slim

# 2. Instalar dependencias del sistema necesarias para Foundry y Slither
RUN apt-get update && apt-get install -y \
    curl \
    git \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Instalar Slither (herramienta de seguridad) via pip
RUN pip install slither-analyzer

# 4. Instalar Foundry (Forge y Cast)
RUN curl -L https://foundry.paradigm.xyz | bash
ENV PATH="/root/.foundry/bin:${PATH}"
RUN foundryup

# 5. Configurar el directorio de trabajo dentro del contenedor
WORKDIR /app

# 6. Copiar los archivos de nuestro repositorio al contenedor
COPY . .

# 7. Comando por defecto al iniciar el contenedor (abre una terminal)
CMD ["/bin/bash"]
