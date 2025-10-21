# 🎯 LABORATORIO ACADÉMICO Y GAMING - ANSIBLE

## ✅ ESTADO ACTUAL DEL PROYECTO

### 🎉 **LOGRADO HASTA AHORA:**
- ✅ **VMs CREADAS EN VCENTER** - ¡3 máquinas virtuales funcionando!
- ✅ **ARQUITECTURA ANSIBLE COMPLETA** - Todo automatizado
- ✅ **ESTRUCTURA SIMPLIFICADA** - Organización perfecta
- ✅ **ROLES MODULARES** - 4 roles principales listos
- ✅ **INVENTARIO CONFIGURADO** - Hosts organizados por función

### 🏗️ **INFRAESTRUCTURA CREADA:**

#### 🖥️ **VMs en vCenter (168.121.48.254:10123):**
1. **Pop_OS_LTS_With_Nvidia** 
   - 🎮 **Para Gaming** - 4 CPU, 6GB RAM, 70GB disco
   - 🌐 MAC: 00:0c:29:c7:ad:2d
   - ✅ Estado: ENCENDIDA y lista

2. **Pop_OS_LTS**
   - 📚 **Para Académico** - 2 CPU, 4GB RAM, 30GB disco  
   - 🌐 MAC: 00:0c:29:fd:e9:4d
   - ✅ Estado: ENCENDIDA y lista

3. **Ubuntu_Server**
   - ⚙️ **Servidor Central** - 2 CPU, 2GB RAM, 30GB disco
   - 🌐 MAC: 00:0c:29:a8:a5:23
   - ✅ Estado: ENCENDIDA y lista

## 📁 Estructura del Proyecto SIMPLIFICADA

```
ansible-proyecto/
├── 📄 site.yml                       # ¡PLAYBOOK PRINCIPAL! (Solo ejecutar este)
├── ⚙️ ansible.cfg                    # Configuración principal
├── 📁 inventory/
│   └── 🎯 hosts.yml                  # INVENTARIO (3 VMs definidas)
├── 📁 group_vars/                    # Variables por grupos
│   ├── ubuntu_servers.yml            # Variables Ubuntu Server
│   ├── pop_gaming.yml                # Variables Pop OS Gaming
│   └── pop_academico.yml             # Variables Pop OS Académico
├── 📁 roles/                         # 4 ROLES PRINCIPALES
│   ├── 1️⃣ sistema/                  # Configuración base
│   ├── 2️⃣ servicios/                # Servicios del sistema
│   ├── 3️⃣ usuarios/                 # Gestión de usuarios
│   └── 4️⃣ aplicaciones/             # Software y apps
├── 📁 playbooks/
│   └── 🏗️ crear_vms.yml             # ✅ USADO - Crear VMs (YA EJECUTADO)
└── 📁 templates/                     # Plantillas de configuración
    └── netplan-config.j2             # Configuración de red
```

## 🚀 COMANDOS PRINCIPALES

### **🎯 Crear VMs (YA EJECUTADO):**
```bash
✅ ansible-playbook playbooks/crear_vms.yml -e "ansible_become=false"
# ✅ ¡3 VMs ya creadas exitosamente!
```

### **⚙️ Configurar TODO el laboratorio:**
```bash
ansible-playbook site.yml
# Ejecuta los 4 roles en las 3 VMs
```

### **🔧 Configurar solo una VM:**
```bash
# Solo Ubuntu Server
ansible-playbook site.yml --limit ubuntu_server

# Solo Pop OS Gaming  
ansible-playbook site.yml --limit pop_gaming

# Solo Pop OS Académico
ansible-playbook site.yml --limit pop_academico
```

### **📋 Configurar solo un rol:**
```bash
# Solo configuración del sistema
ansible-playbook site.yml --tags sistema

# Solo servicios
ansible-playbook site.yml --tags servicios

# Solo usuarios
ansible-playbook site.yml --tags usuarios

# Solo aplicaciones
ansible-playbook site.yml --tags aplicaciones
```

## 🎯 MÁQUINAS VIRTUALES CREADAS

| VM | Función | Especificaciones | Estado |
|---|---|---|---|
| **Ubuntu_Server** | Servidor central | 2 CPU, 2GB RAM, 30GB | ✅ ENCENDIDA |
| **Pop_OS_LTS_With_Nvidia** | Gaming | 4 CPU, 6GB RAM, 70GB | ✅ ENCENDIDA |
| **Pop_OS_LTS** | Académico | 2 CPU, 4GB RAM, 30GB | ✅ ENCENDIDA |

## 📋 PRÓXIMOS PASOS

### **1️⃣ Instalar OS en vCenter:**
- Acceder a https://168.121.48.254:10123
- Instalar Ubuntu Server en la VM Ubuntu_Server
- Instalar Pop OS en las otras 2 VMs
- Configurar red y SSH en cada VM

### **2️⃣ Ejecutar configuración automática:**
```bash
# Una vez que las VMs tengan OS instalado y SSH configurado:
ansible-playbook site.yml
```

## 🔧 CONFIGURACIÓN ACTUAL

### **VMware vCenter:**
- **URL:** https://168.121.48.254:10123
- **Usuario:** root
- **Password:** qwe123$
- **Puerto:** 10123

### **Red configurada:**
- Las VMs están en la red "VM Network"
- Cada VM tiene su MAC address única
- Se configurará DHCP/IP estática durante la instalación del OS

### **ISOs disponibles en datastore:**
- `[datastore1] JuanEspiritu/ubuntu-24.04.3-live-server-amd64.iso`
- `[datastore1] JuanEspiritu/pop-os_22.04_amd64_nvidia_56.iso`
- `[datastore1] JuanEspiritu/pop-os_22.04_amd64_intel_56.iso`

## 📚 ROLES IMPLEMENTADOS

### **1️⃣ sistema (Base del sistema)**
- Actualización del sistema
- Configuración básica de red
- Servicios esenciales
- SSH y seguridad

### **2️⃣ servicios (Servicios específicos)**
- DHCP, DNS (Ubuntu Server)
- Steam, gaming tools (Pop OS Gaming)
- Software educativo (Pop OS Académico)

### **3️⃣ usuarios (Gestión de usuarios)**
- Usuarios del laboratorio
- Grupos y permisos
- Políticas de seguridad

### **4️⃣ aplicaciones (Software)**
- Aplicaciones gaming
- Software académico
- Herramientas de desarrollo

## 🏆 LOGROS DEL PROYECTO

### ✅ **AUTOMATIZACIÓN COMPLETA:**
- Un solo comando crea todas las VMs
- Un solo comando configura todo el laboratorio
- Arquitectura modular y escalable

### ✅ **ESTRUCTURA LIMPIA:**
- Solo archivos necesarios
- Organización lógica y simple
- Documentación clara

### ✅ **FLEXIBILIDAD:**
- Ejecutar todo o solo partes específicas
- Configurar todas las VMs o solo una
- Roles independientes y reutilizables

---

**🎉 ¡El laboratorio está funcionando y listo para la configuración final!**

**📋 Estado:** VMs creadas ✅ | OS installation 🔄 | Ansible config ⏳
