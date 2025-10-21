# 🎯 LABORATORIO ACADÉMICO Y GAMING - ANSIBLE

## � Estructura del Proyecto

```
ansible-proyecto/
├── ansible.cfg                    # Configuración principal de Ansible
├── inventory/                     # Inventarios organizados por entorno
│   └── production/
│       ├── hosts.yml             # Definición de hosts
│       └── group_vars/           # Variables por grupos
├── roles/                        # Roles unificados multi-plataforma
│   ├── base/                     # Configuración base del sistema
│   │   ├── tasks/
│   │   │   ├── main.yml         # Distribuidor principal
│   │   │   ├── linux/           # Tareas específicas Linux
│   │   │   └── windows/         # Tareas específicas Windows
│   │   ├── defaults/
│   │   └── handlers/
│   ├── services/                 # Gestión de servicios
│   ├── users/                    # Gestión de usuarios
│   ├── storage/                  # Configuración de almacenamiento
│   ├── gaming/                   # Gaming Center (Steam, etc.)
│   └── audit/                    # Auditoría y monitoreo
├── unified_playbooks/            # Playbooks unificados
│   ├── base.yml                 # Configuración base
│   ├── gaming.yml               # Gaming Center completo
│   ├── services.yml             # Servicios
│   └── complete.yml             # Configuración completa
└── playbooks/
    ├── main.yml                 # Playbook principal
    └── crear_vms.yml            # Creación de VMs
```

## 🚀 Uso Simple

### Configuración completa:
```bash
ansible-playbook playbooks/main.yml
```

### Solo gaming:
```bash
ansible-playbook unified_playbooks/gaming.yml
```

### Solo servicios:
```bash
ansible-playbook unified_playbooks/services.yml
```

## 🎯 Grupos de Hosts

- **lab_gaming**: VMs para gaming
- **lab_academico**: VMs académicas  
- **ubuntu_servers**: Servidores Ubuntu
- **vmware_infrastructure**: vCenter

---
**Estructura simplificada y organizada - Sin archivos confusos** ✨
│   ├── ⚙️ automatizacion_tareas/      # 3️⃣ TERCERO: Tareas automatizadas
│   └── 💾 almacenamiento_y_fs/        # 4️⃣ CUARTO: Almacenamiento y FS
│
├── 📁 inventory/
│   └── 🎯 hosts.yml                   # INVENTARIO PRINCIPAL
│
├── 📁 group_vars/                     # Variables por grupos
│   ├── ubuntu_servers.yml             # Variables para Ubuntu Server
│   ├── pop_os_vms.yml                 # Variables para Pop OS VMs
│   ├── lab_academico.yml              # Variables del lab académico
│   └── lab_gaming.yml                 # Variables del lab gaming
│
├── 📁 host_vars/                      # Variables por host específico
│
├── ⚙️ ansible.cfg                     # Configuración principal de Ansible
│
└── 📚 README.md                       # Esta documentación
```

## **🎯 Ejecución del Playbook Principal**

### **Comando principal (Ejecutar TODO):**
```bash
ansible-playbook playbooks/main.yml
```

### **Ejecutar rol específico:**
```bash
# Solo gestión de procesos
ansible-playbook playbooks/main.yml --tags gestion_procesos

# Solo usuarios y políticas  
ansible-playbook playbooks/main.yml --tags usuarios_y_politicas

# Solo automatización de tareas
ansible-playbook playbooks/main.yml --tags automatizacion_tareas

# Solo almacenamiento y sistemas de archivos
ansible-playbook playbooks/main.yml --tags almacenamiento_y_fs
```

### **Ejecutar en grupo específico:**
```bash
# Solo servidores Ubuntu
ansible-playbook playbooks/main.yml --limit ubuntu_servers

# Solo VMs Pop OS
ansible-playbook playbooks/main.yml --limit pop_os_vms

# Solo laboratorio académico
ansible-playbook playbooks/main.yml --limit lab_academico

# Solo laboratorio gaming
ansible-playbook playbooks/main.yml --limit lab_gaming
```

## **🔄 Orden de Ejecución de los Roles**

El sistema ejecuta los roles en un orden específico para garantizar dependencias correctas:

### **1️⃣ gestion_procesos** (PRIMERO)
- ✅ Configura servicios base del sistema
- ✅ Habilita SSH, DHCP, DNS según el tipo de sistema
- ✅ Configura monitoreo y seguridad básica
- ✅ Prepara la base para otros roles

### **2️⃣ usuarios_y_politicas** (SEGUNDO)  
- ✅ Crea usuarios del laboratorio (students, gamers, admins)
- ✅ Configura políticas de seguridad
- ✅ Establece permisos y grupos
- ✅ Configura acceso SSH por usuario

### **3️⃣ automatizacion_tareas** (TERCERO)
- ✅ Configura tareas cron automáticas
- ✅ Establece respaldos automatizados
- ✅ Configura mantenimiento del sistema
- ✅ Establece monitoreo automatizado

### **4️⃣ almacenamiento_y_fs** (CUARTO - ÚLTIMO)
- ✅ Configura sistemas de archivos
- ✅ Establece cuotas de almacenamiento
- ✅ Optimiza rendimiento de disco
- ✅ Configura estructura de directorios

## **🎯 Sistemas Objetivo**

### **🖥️ Ubuntu Server (Infraestructura)**
- **Función:** Servidor central del laboratorio
- **Servicios:** DHCP, DNS, SSH, Monitoreo
- **IP:** 172.17.25.87
- **Usuario:** ubuntu / ubuntu

### **🎮 Pop OS Gaming** 
- **Función:** Estación de trabajo gaming
- **Características:** GPU, Software gaming, Alto rendimiento
- **Usuario:** gamer / gaming123

### **📚 Pop OS Académico**
- **Función:** Estación de trabajo académica
- **Características:** Software educativo, Restricciones de seguridad
- **Usuario:** student / student123

## **📊 Estado Actual del Proyecto**

### ✅ **COMPLETADO:**
- ✅ Arquitectura modular definida
- ✅ Playbook principal (`main.yml`) creado
- ✅ Inventario principal organizado
- ✅ 4 roles principales estructurados con README completos
- ✅ Variables organizadas por grupos y hosts
- ✅ Documentación completa de la arquitectura

### 🔨 **EN PROCESO:**
- 🔨 Configuración de Ubuntu Server con SSH + GNOME Desktop
- 🔨 Pruebas de conectividad SSH
- 🔨 Validación de roles individuales

### 🎯 **SIGUIENTE PASO:**
Una vez que Ubuntu Server esté completamente configurado con SSH habilitado, ejecutar:

```bash
ansible-playbook playbooks/main.yml --limit ubuntu_server -v
```

## **🔧 Configuración Actual**

### **VMware vCenter:**
- **URL:** https://168.121.48.254:10123
- **Usuario:** root / qwe123$

### **VMs Creadas:**
1. **Ubuntu_Server** - 172.17.25.87 (Pendiente configuración SSH+GNOME)
2. **Pop_OS_LTS_With_Nvidia** - Para gaming
3. **Pop_OS_LTS** - Para académico

## **📚 Documentación de Roles**

Cada rol incluye su propia documentación detallada:
- 📖 [`roles/gestion_procesos/README.md`](roles/gestion_procesos/README.md)
- 📖 [`roles/usuarios_y_politicas/README.md`](roles/usuarios_y_politicas/README.md)  
- 📖 [`roles/automatizacion_tareas/README.md`](roles/automatizacion_tareas/README.md)
- 📖 [`roles/almacenamiento_y_fs/README.md`](roles/almacenamiento_y_fs/README.md)

## **🚀 Beneficios de esta Arquitectura**

### **🎯 Modularidad**
- Cada rol tiene una responsabilidad específica
- Fácil mantenimiento y actualización
- Posibilidad de ejecutar roles individuales

### **📋 Claridad**
- Documentación completa en cada componente
- Nomenclatura consistente y descriptiva
- Arquitectura fácil de entender

### **🔄 Reutilización**
- Roles reutilizables en diferentes entornos
- Variables configurables por grupo/host
- Plantillas adaptables a diferentes necesidades

### **🛡️ Robustez**
- Orden de ejecución garantiza dependencias
- Manejo de errores y rollback
- Validaciones en cada paso

---

**🎉 ¡El proyecto está completamente organizado y listo para la ejecución automatizada del laboratorio académico y gaming!**