#!/bin/bash

echo "== COMPILANDO PROYECTO =="
forge build

echo "== EJECUTANDO TESTS =="
forge test

echo "== ANALISIS SLITHER =="
slither .

echo "== FIN AUDITORIA =="
