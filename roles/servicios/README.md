# ⚙️ ROL: Automatización de Tareas

## **Descripción**
Este rol configura la automatización de tareas del sistema mediante cron jobs, scripts personalizados, y tareas programadas para mantenimiento, respaldos, y optimización del laboratorio académico y gaming.

## **Funcionalidades Principales**

### 🕒 **Tareas Programadas (Cron Jobs)**
- Configuración de trabajos cron para mantenimiento automático
- Programación de tareas de limpieza del sistema
- Automatización de actualizaciones de seguridad
- Tareas de monitoreo y alertas programadas

### 💾 **Respaldos Automáticos**
- Configuración de respaldos incrementales diarios
- Respaldo de configuraciones críticas del sistema
- Sincronización de datos importantes
- Rotación automática de archivos de respaldo

### 🧹 **Mantenimiento del Sistema**
- Limpieza automática de archivos temporales
- Rotación de logs del sistema
- Actualización automática de repositorios
- Optimización de base de datos del sistema

### 📊 **Reportes y Monitoreo Automatizado**
- Generación automática de reportes de uso del sistema
- Monitoreo de recursos y alertas por email
- Recopilación de estadísticas de rendimiento
- Informes de seguridad y accesos

### 🔧 **Scripts Personalizados**
- Scripts de inicialización del sistema
- Automatización de tareas de configuración
- Scripts de recuperación ante fallos
- Herramientas de diagnóstico automatizadas

## **Archivos Principales**

```
roles/automatizacion_tareas/
├── tasks/main.yml          # Tareas principales del rol
├── handlers/main.yml       # Handlers para servicios de cron
├── templates/              # Plantillas de scripts y configuraciones
│   ├── cron-jobs/         # Trabajos cron personalizados
│   ├── scripts/           # Scripts de automatización
│   └── monitoring/        # Scripts de monitoreo
├── defaults/main.yml       # Variables por defecto
├── vars/main.yml          # Variables específicas del rol
└── files/                 # Scripts ejecutables y herramientas
    ├── backup/            # Scripts de respaldo
    ├── maintenance/       # Scripts de mantenimiento
    └── monitoring/        # Herramientas de monitoreo
```

## **Variables Importantes**

### Configuración de Respaldos
```yaml
backup_config:
  enabled: true
  schedule: "0 2 * * *"  # 2:00 AM diario
  retention_days: 30
  backup_paths:
    - /home
    - /etc
    - /var/log
```

### Tareas de Mantenimiento
```yaml
maintenance_tasks:
  - name: "cleanup_temp_files"
    schedule: "0 3 * * 0"  # Domingo 3:00 AM
    enabled: true
  - name: "update_system"
    schedule: "0 4 * * 1"  # Lunes 4:00 AM
    enabled: true
```

### Monitoreo Automatizado
```yaml
monitoring_automation:
  disk_usage_check: "*/15 * * * *"  # Cada 15 minutos
  memory_check: "*/10 * * * *"      # Cada 10 minutos
  service_health_check: "*/5 * * * *" # Cada 5 minutos
```

## **Uso**

### Ejecutar solo este rol
```bash
ansible-playbook playbooks/main.yml --tags automatizacion_tareas
```

### Aplicar solo respaldos
```bash
ansible-playbook playbooks/main.yml --tags automatizacion_tareas,backup
```

### Configurar solo monitoreo
```bash
ansible-playbook playbooks/main.yml --tags automatizacion_tareas,monitoring
```

## **Tareas Automatizadas Configuradas**

### Diarias (Todos los sistemas)
- **02:00** - Respaldo incremental de datos importantes
- **03:00** - Limpieza de archivos temporales y logs antiguos
- **04:00** - Verificación de integridad del sistema
- **05:00** - Generación de reportes de uso

### Semanales (Domingos)
- **01:00** - Respaldo completo del sistema
- **03:00** - Limpieza profunda del sistema
- **04:00** - Actualizaciones de seguridad
- **06:00** - Reporte semanal de seguridad

### Mensuales (Primer domingo del mes)
- **00:00** - Respaldo de configuraciones a repositorio externo
- **02:00** - Análisis completo de seguridad
- **05:00** - Reporte mensual de rendimiento

## **Dependencias**
- Sistema Ubuntu 20.04+ o Pop OS 20.04+
- Roles `gestion_procesos` y `usuarios_y_politicas` ejecutados
- Servicio cron habilitado y funcionando
- Espacio suficiente en disco para respaldos

## **Orden de Ejecución**
🥉 **TERCERO** - Este rol se ejecuta después de usuarios y políticas porque necesita que los usuarios estén creados para asignar tareas específicas.

## **Scripts Incluidos**

### Scripts de Respaldo
- `backup-system.sh` - Respaldo completo del sistema
- `backup-configs.sh` - Respaldo de configuraciones
- `backup-users.sh` - Respaldo de datos de usuarios

### Scripts de Mantenimiento
- `cleanup-system.sh` - Limpieza general del sistema
- `update-security.sh` - Actualizaciones de seguridad
- `optimize-performance.sh` - Optimización de rendimiento

### Scripts de Monitoreo
- `health-check.sh` - Verificación de salud del sistema
- `resource-monitor.sh` - Monitoreo de recursos
- `security-audit.sh` - Auditoría de seguridad

## **Notas Importantes**
- ⏰ Todas las tareas están programadas en horarios de baja actividad
- 📧 Los reportes se envían automáticamente por email (si está configurado)
- 🔄 Los respaldos se rotan automáticamente para evitar llenar el disco
- 📊 Los logs de todas las tareas se mantienen para auditoría
- ⚠️ Las tareas críticas tienen notificaciones en caso de fallo
