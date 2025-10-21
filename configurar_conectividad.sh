#!/bin/bash
# =============================================================================
# Script para configurar Ubuntu Server desde tu Mac
# =============================================================================

echo "🔧 CONFIGURACIÓN DE UBUNTU SERVER PARA ANSIBLE"
echo "=============================================="

# Crear archivo de configuración netplan
cat > /tmp/ubuntu-netplan.yaml << 'EOF'
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

echo "✅ Archivo de configuración creado: /tmp/ubuntu-netplan.yaml"
echo ""
echo "📋 PASOS PARA CONFIGURAR UBUNTU SERVER:"
echo "======================================"
echo ""
echo "1. En Ubuntu Server, ejecuta:"
echo "   sudo cp /tmp/ubuntu-netplan.yaml /etc/netplan/00-installer-config.yaml"
echo ""
echo "2. Aplica la configuración:"
echo "   sudo netplan apply"
echo ""
echo "3. Verifica la nueva IP:"
echo "   ip a"
echo ""
echo "4. Desde tu Mac, prueba la conexión:"
echo "   ping -c 3 192.168.0.48"
echo ""
echo "5. Si funciona, ejecuta Ansible:"
echo "   ansible-playbook site.yml --ask-pass"
echo ""

# Intentar transferir el archivo si es posible
echo "🚀 Intentando transferir archivo a Ubuntu Server..."
if scp -o ConnectTimeout=5 /tmp/ubuntu-netplan.yaml ubuntu@172.17.25.48:/tmp/ 2>/dev/null; then
    echo "✅ Archivo transferido exitosamente!"
    echo "   Ahora solo ejecuta en Ubuntu Server:"
    echo "   sudo cp /tmp/ubuntu-netplan.yaml /etc/netplan/00-installer-config.yaml"
    echo "   sudo netplan apply"
else
    echo "⚠️  No se pudo transferir automáticamente (normal si no hay conectividad)"
    echo "   Copia manualmente el contenido del archivo /tmp/ubuntu-netplan.yaml"
fi

echo ""
echo "🎯 OBJETIVO: Ubuntu Server debe tener IP 192.168.0.48"
echo "📝 Tu Mac tiene IP: 192.168.0.170"
echo "🌐 Ambos estarán en la misma red: 192.168.0.x"