---
# =============================================================================
# CONFIGURAR UBUNTU SERVER - Via vCenter Console Commands
# =============================================================================

# Estos comandos se ejecutan EN UBUNTU SERVER (vía consola vCenter)
# para configurarlo y que Ansible pueda conectarse

sudo tee /etc/netplan/00-installer-config.yaml > /dev/null <<EOF
network:
  version: 2
  ethernets:
    ens192:
      dhcp4: false
      addresses:
        - 192.168.0.48/24
      gateway4: 192.168.0.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4
EOF

# Aplicar configuración
sudo netplan apply

# Reiniciar networking
sudo systemctl restart systemd-networkd

# Verificar nueva IP
ip a | grep 'inet.*ens192'

# Probar conectividad
ping -c 3 8.8.8.8
ping -c 3 192.168.0.170

echo "✅ Configuración completa. Probar desde Mac: ansible ubuntu_server -m ping --ask-pass"