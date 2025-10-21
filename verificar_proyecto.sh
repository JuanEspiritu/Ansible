#!/bin/bash
# =============================================================================
# SCRIPT DE VERIFICACIÓN PRE-EJECUCIÓN
# =============================================================================
# Este script verifica que todo esté listo antes de ejecutar Ansible

echo "🔍 VERIFICANDO CONFIGURACIÓN DEL PROYECTO ANSIBLE"
echo "================================================="

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para verificar archivos
check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅ $1${NC}"
        return 0
    else
        echo -e "${RED}❌ $1 - NO ENCONTRADO${NC}"
        return 1
    fi
}

# Función para verificar conectividad
check_connectivity() {
    local host=$1
    local name=$2
    
    if timeout 5 bash -c "</dev/tcp/$host/22"; then
        echo -e "${GREEN}✅ $name ($host) - SSH disponible${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠️  $name ($host) - SSH no disponible (VM apagada?)${NC}"
        return 1
    fi
}

echo ""
echo "📁 VERIFICANDO ESTRUCTURA DEL PROYECTO"
echo "--------------------------------------"

# Verificar archivos principales
check_file "site.yml"
check_file "inventory/hosts.yml"
check_file "ansible.cfg"

# Verificar roles
echo ""
echo "🎭 VERIFICANDO ROLES"
echo "-------------------"
check_file "roles/sistema/tasks/main.yml"
check_file "roles/servicios/tasks/main.yml"  
check_file "roles/usuarios/tasks/main.yml"
check_file "roles/aplicaciones/tasks/main.yml"

# Verificar variables
echo ""
echo "📊 VERIFICANDO VARIABLES"
echo "------------------------"
check_file "group_vars/all.yml"
check_file "group_vars/academico.yml"
check_file "group_vars/gaming.yml"
check_file "group_vars/servidores.yml"

# Verificar sintaxis
echo ""
echo "🔧 VERIFICANDO SINTAXIS DE ANSIBLE"
echo "----------------------------------"
if ansible-playbook site.yml --syntax-check >/dev/null 2>&1; then
    echo -e "${GREEN}✅ Sintaxis correcta${NC}"
else
    echo -e "${RED}❌ Error de sintaxis - ejecuta: ansible-playbook site.yml --syntax-check${NC}"
fi

# Verificar conectividad a VMs
echo ""
echo "🌐 VERIFICANDO CONECTIVIDAD A VMs"
echo "--------------------------------"
check_connectivity "172.17.25.48" "Ubuntu Server"
check_connectivity "172.17.25.88" "Pop Gaming"  
check_connectivity "172.17.25.89" "Pop Académico"

# Verificar comandos necesarios
echo ""
echo "🛠️  VERIFICANDO HERRAMIENTAS"
echo "----------------------------"
if command -v ansible >/dev/null 2>&1; then
    echo -e "${GREEN}✅ Ansible instalado${NC}"
    ansible --version | head -n 1
else
    echo -e "${RED}❌ Ansible no encontrado${NC}"
fi

if command -v ansible-playbook >/dev/null 2>&1; then
    echo -e "${GREEN}✅ ansible-playbook disponible${NC}"
else
    echo -e "${RED}❌ ansible-playbook no encontrado${NC}"
fi

echo ""
echo "📋 RESUMEN"
echo "=========="
echo -e "${BLUE}Para ejecutar el playbook completo:${NC}"
echo "  ansible-playbook site.yml --ask-pass"
echo ""
echo -e "${BLUE}Para ejecutar solo una máquina:${NC}" 
echo "  ansible-playbook site.yml --limit ubuntu_server --ask-pass"
echo ""
echo -e "${BLUE}Para modo prueba (no hace cambios):${NC}"
echo "  ansible-playbook site.yml --check --ask-pass"
echo ""
echo -e "${YELLOW}💡 Recuerda: Las VMs deben estar encendidas y configuradas con IPs estáticas${NC}"
echo "📖 Ver GUIA_EJECUCION.md para instrucciones completas"
echo ""