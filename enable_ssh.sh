#!/bin/bash
# =============================================================================
# SCRIPT PARA EJECUTAR EN UBUNTU SERVER (VIA CONSOLA vCenter)
# =============================================================================
echo "🚀 Configurando SSH en Ubuntu Server..."

# Instalar y habilitar SSH
sudo apt update
sudo apt install -y openssh-server

# Habilitar SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Verificar status
sudo systemctl status ssh --no-pager

# Mostrar IP actual
echo "📡 IP actual:"
ip a | grep 'inet.*ens' || ip a | grep 'inet.*eth'

echo "✅ SSH configurado. Probando desde Mac..."
echo "Ejecuta: ansible-playbook site.yml --ask-pass"