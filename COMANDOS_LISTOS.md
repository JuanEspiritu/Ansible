# 🚀 COMANDOS LISTOS PARA COPIAR Y PEGAR

## 📋 **1. Verificar que todo está listo:**
```bash
cd /Users/sebastiandefray413outlook.com/Documents/Ansible/ansible-proyecto
./verificar_proyecto.sh
```

## 🔧 **2. Comandos de configuración de VMs:**

### Ubuntu Server (172.17.25.48):
```bash
# Configurar IP estática
sudo nano /etc/netplan/00-installer-config.yaml
# (Copiar configuración de GUIA_EJECUCION.md)
sudo netplan apply

# Instalar SSH
sudo apt update && sudo apt install -y openssh-server
sudo systemctl enable ssh && sudo systemctl start ssh
```

### Pop OS VMs:
```bash
# En ambas máquinas Pop OS
sudo apt update && sudo apt install -y openssh-server
sudo systemctl enable ssh && sudo systemctl start ssh
```

## ⚡ **3. Comandos de ejecución de Ansible:**

### Verificar conectividad:
```bash
cd /Users/sebastiandefray413outlook.com/Documents/Ansible/ansible-proyecto

# Ping a todas las máquinas
ansible all -m ping --ask-pass

# Listar máquinas detectadas
ansible all --list-hosts
```

### Ejecutar paso a paso:
```bash
# 1. Verificar sintaxis (debe decir "playbook: site.yml")
ansible-playbook site.yml --syntax-check

# 2. Modo prueba (simula sin hacer cambios)
ansible-playbook site.yml --check --ask-pass

# 3. Ejecutar de verdad
ansible-playbook site.yml --ask-pass
```

### Ejecutar por máquinas específicas:
```bash
# Solo Ubuntu Server
ansible-playbook site.yml --limit ubuntu_server --ask-pass

# Solo Pop Gaming
ansible-playbook site.yml --limit pop_gaming --ask-pass

# Solo Pop Académico  
ansible-playbook site.yml --limit pop_academico --ask-pass
```

### Ejecutar por grupos:
```bash
# Solo servidores
ansible-playbook site.yml --limit servidores --ask-pass

# Solo estaciones
ansible-playbook site.yml --limit estaciones --ask-pass

# Solo lab gaming
ansible-playbook site.yml --limit gaming --ask-pass

# Solo lab académico
ansible-playbook site.yml --limit academico --ask-pass
```

## 🔍 **4. Comandos de verificación post-ejecución:**

```bash
# Verificar que se instalaron los paquetes básicos
ansible all -m command -a "which htop" --ask-pass

# Verificar usuarios creados
ansible all -m command -a "id ansible" --ask-pass

# Verificar zona horaria
ansible all -m command -a "timedatectl" --ask-pass

# Verificar servicios
ansible servidores -m command -a "systemctl status ssh" --ask-pass
```

## 🚨 **5. Comandos de solución de problemas:**

```bash
# Ver logs detallados
ansible-playbook site.yml --ask-pass -vvv

# Ejecutar solo tareas específicas
ansible-playbook site.yml --tags "sistema" --ask-pass

# Saltar verificación de host SSH
ansible-playbook site.yml --ask-pass -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"'

# Usar otro usuario
ansible-playbook site.yml --ask-pass --user ubuntu

# Forzar contraseña de sudo
ansible-playbook site.yml --ask-pass --ask-become-pass
```

## 📊 **6. Comandos útiles de información:**

```bash
# Ver configuración actual
ansible-config dump

# Ver inventario completo
ansible-inventory --list

# Ver variables de un host
ansible-inventory --host ubuntu_server

# Probar conexión manual
ssh ubuntu@172.17.25.48
ssh gamer@172.17.25.88
ssh student@172.17.25.89
```

---
**💡 Consejo:** Siempre ejecuta primero con `--check` para ver qué va a hacer antes de aplicar cambios reales.