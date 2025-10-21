# 💾 ROL: Almacenamiento y Sistemas de Archivos

## **Descripción**
Este rol gestiona la configuración de almacenamiento, sistemas de archivos, particiones, y políticas de almacenamiento para el laboratorio académico y gaming, incluyendo optimizaciones específicas según el uso del sistema.

## **Funcionalidades Principales**

### 🗄️ **Gestión de Sistemas de Archivos**
- Configuración y montaje de sistemas de archivos
- Optimización de parámetros de montaje según el uso
- Configuración de fstab para montajes permanentes
- Gestión de permisos y ACLs (Access Control Lists)

### 💿 **Gestión de Discos y Particiones**
- Detección automática de discos disponibles
- Creación y redimensionamiento de particiones
- Configuración de LVM (Logical Volume Manager)
- Gestión de RAID por software (si aplica)

### 📁 **Estructura de Directorios**
- Creación de estructura de directorios estándar
- Configuración de directorios compartidos
- Gestión de espacios de trabajo por usuario
- Directorios especializados para gaming y académico

### 🔒 **Cuotas y Límites de Almacenamiento**
- Implementación de cuotas de disco por usuario
- Límites de almacenamiento por grupo
- Monitoreo de uso de disco
- Alertas por uso excesivo de espacio

### ⚡ **Optimización de Rendimiento**
- Configuración de parámetros de I/O
- Optimización para SSDs (TRIM, alignment)
- Configuración de cache y buffers
- Optimizaciones específicas para gaming (baja latencia)

## **Archivos Principales**

```
roles/almacenamiento_y_fs/
├── tasks/main.yml          # Tareas principales del rol
├── handlers/main.yml       # Handlers para remontaje de filesystems
├── templates/              # Plantillas de configuración
│   ├── fstab/             # Configuraciones fstab
│   ├── lvm/               # Configuraciones LVM
│   └── quotas/            # Configuraciones de cuotas
├── defaults/main.yml       # Variables por defecto
├── vars/main.yml          # Variables específicas del rol
└── files/                 # Scripts de gestión de almacenamiento
    ├── disk-management/   # Scripts de gestión de discos
    ├── backup-restore/    # Herramientas de respaldo/restauración
    └── monitoring/        # Scripts de monitoreo de almacenamiento
```

## **Variables Importantes**

### Configuración de Sistemas de Archivos
```yaml
filesystem_config:
  default_fs_type: "ext4"
  gaming_fs_type: "ext4"      # Optimizado para gaming
  academic_fs_type: "ext4"    # Optimizado para académico
  
  mount_options:
    default: "defaults,noatime"
    gaming: "defaults,noatime,data=writeback"  # Mayor rendimiento
    academic: "defaults,relatime,data=ordered" # Mayor seguridad
```

### Estructura de Directorios
```yaml
directory_structure:
  base_paths:
    - "/opt/lab-software"      # Software del laboratorio
    - "/srv/shared"            # Archivos compartidos
    - "/var/lab-data"          # Datos del laboratorio
    
  gaming_paths:
    - "/opt/games"             # Juegos instalados
    - "/srv/game-assets"       # Assets de juegos
    - "/var/game-saves"        # Partidas guardadas
    
  academic_paths:
    - "/opt/academic-software" # Software académico
    - "/srv/projects"          # Proyectos estudiantiles
    - "/var/academic-data"     # Datos académicos
```

### Cuotas de Almacenamiento
```yaml
disk_quotas:
  enabled: true
  users:
    students: "5GB"          # Límite por estudiante
    gamers: "20GB"           # Límite por usuario gaming
    professors: "50GB"       # Límite por profesor
    admin: "unlimited"       # Sin límite para administradores
  
  groups:
    academic: "500GB"        # Límite para grupo académico
    gaming: "1TB"            # Límite para grupo gaming
```

## **Uso**

### Ejecutar solo este rol
```bash
ansible-playbook playbooks/main.yml --tags almacenamiento_y_fs
```

### Configurar solo cuotas
```bash
ansible-playbook playbooks/main.yml --tags almacenamiento_y_fs,quotas
```

### Optimizar para gaming
```bash
ansible-playbook playbooks/main.yml --tags almacenamiento_y_fs --limit lab_gaming
```

## **Configuraciones por Tipo de Sistema**

### Ubuntu Server (Infraestructura)
- **Sistema de archivos:** ext4 con journaling completo
- **Optimización:** Enfoque en confiabilidad y integridad
- **Cuotas:** Habilitadas para todos los usuarios
- **Respaldos:** Configuración automática de snapshots

### Pop OS Gaming
- **Sistema de archivos:** ext4 optimizado para rendimiento
- **Optimización:** Baja latencia, escrituras asíncronas
- **Cuotas:** Límites generosos para juegos y assets
- **SSD:** Habilitación de TRIM automático

### Pop OS Académico
- **Sistema de archivos:** ext4 con configuración balanceada
- **Optimización:** Equilibrio entre rendimiento y seguridad
- **Cuotas:** Límites moderados para proyectos
- **Compartición:** Directorios colaborativos configurados

## **Sistemas de Archivos Soportados**
- **ext4** - Sistema principal (recomendado)
- **xfs** - Para volúmenes grandes (opcional)
- **btrfs** - Con snapshots automáticos (experimental)
- **ntfs** - Para compatibilidad con Windows (gaming)

## **Dependencias**
- Sistema Ubuntu 20.04+ o Pop OS 20.04+
- Todos los roles anteriores ejecutados
- Herramientas de gestión de discos instaladas
- Permisos de administrador para operaciones de disco

## **Orden de Ejecución**
🏆 **CUARTO (ÚLTIMO)** - Este rol se ejecuta al final porque puede requerir reinicio del sistema y necesita que todos los usuarios y servicios estén configurados.

## **Herramientas Incluidas**

### Scripts de Gestión
- `disk-analyzer.sh` - Análisis de uso de disco
- `quota-manager.sh` - Gestión de cuotas de usuario
- `fs-optimizer.sh` - Optimización de sistemas de archivos
- `backup-manager.sh` - Gestión de respaldos de almacenamiento

### Monitoreo
- `disk-health-check.sh` - Verificación de salud de discos
- `fs-performance-monitor.sh` - Monitoreo de rendimiento I/O
- `quota-usage-report.sh` - Reportes de uso de cuotas

## **Características Especiales**

### Para Gaming
- ⚡ **Optimización I/O:** Configuración para baja latencia
- 🎮 **Directorios de juegos:** Estructura optimizada para Steam, etc.
- 💾 **Cache agresivo:** Configuración para máximo rendimiento
- 🔧 **SSD Support:** TRIM automático y optimizaciones específicas

### Para Académico
- 📚 **Proyectos colaborativos:** Directorios compartidos con permisos específicos
- 🔒 **Seguridad:** Configuración enfocada en integridad de datos
- 📊 **Cuotas estrictas:** Control de uso para evitar abuso
- 🗂️ **Organización:** Estructura clara para materias y proyectos

## **Notas Importantes**
- 🔄 Algunos cambios requieren reinicio del sistema
- 💿 Las operaciones de particionado son destructivas - ¡Cuidado con datos existentes!
- 📊 El monitoreo de cuotas genera reportes automáticos
- ⚠️ Las optimizaciones de rendimiento pueden reducir la durabilidad en algunos casos
- 🔧 Todas las configuraciones son reversibles mediante los scripts incluidos
