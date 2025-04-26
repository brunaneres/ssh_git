#!/bin/bash

# Caminho para o repositório
REPO_DIR="D:\Users\bruna\Documents\pyprojects"

# Muda para o diretório do repositório
cd $REPO_DIR

# Adiciona todos os arquivos modificados
git add .

# Cria um commit com uma mensagem automática (exemplo: data e hora)
git commit -m "Commit automático $(date)"

# Push para o repositório remoto
git push origin main
