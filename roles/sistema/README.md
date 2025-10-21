# 🔄 ROL: Gestión de Procesos

## **Descripción**
Este rol se encarga de la configuración y gestión de procesos del sistema, servicios, y monitoreo de rendimiento en sistemas Ubuntu Server y Pop OS.

## **Funcionalidades Principales**

### 🛠️ **Gestión de Servicios del Sistema**
- Configuración de servicios críticos del sistema
- Habilitación/deshabilitación de servicios según el rol del servidor
- Gestión de dependencias entre servicios
- Configuración de servicios de red (DHCP, DNS, SSH)

### 📊 **Monitoreo de Procesos**
- Instalación y configuración de herramientas de monitoreo
- Configuración de alertas por uso de recursos
- Monitoreo de procesos críticos
- Configuración de logs del sistema

### ⚡ **Optimización de Rendimiento**
- Configuración de parámetros del kernel
- Optimización de servicios según el hardware disponible
- Configuración de límites de recursos por usuario/proceso
- Gestión de servicios en segundo plano

### 🔒 **Servicios de Seguridad**
- Configuración de Fail2Ban
- Gestión de servicios de seguridad
- Configuración de logs de auditoría
- Monitoreo de intentos de acceso

## **Archivos Principales**

```
roles/gestion_procesos/
├── tasks/main.yml          # Tareas principales del rol
├── handlers/main.yml       # Handlers para reinicio de servicios
├── templates/              # Plantillas de configuración
│   ├── systemd-services/   # Servicios systemd personalizados
│   └── monitoring/         # Configuraciones de monitoreo
├── defaults/main.yml       # Variables por defecto
└── vars/main.yml          # Variables específicas del rol
```

## **Variables Importantes**

### Servicios por Tipo de Sistema
```yaml
# Ubuntu Server (Infraestructura)
ubuntu_services:
  - ssh
  - dhcp-server
  - bind9
  - fail2ban

# Pop OS (Estaciones de trabajo)
pop_os_services:
  - ssh
  - NetworkManager
  - gdm3
```

### Configuración de Monitoreo
```yaml
monitoring_config:
  cpu_alert_threshold: 80
  memory_alert_threshold: 85
  disk_alert_threshold: 90
  process_monitoring_enabled: true
```

## **Uso**

### Ejecutar solo este rol
```bash
ansible-playbook playbooks/main.yml --tags gestion_procesos
```

### Aplicar a grupo específico
```bash
ansible-playbook playbooks/main.yml --tags gestion_procesos --limit ubuntu_servers
```

## **Dependencias**
- Sistema Ubuntu 20.04+ o Pop OS 20.04+
- Permisos de sudo habilitados
- Conectividad de red para descargar paquetes

## **Orden de Ejecución**
🥇 **PRIMERO** - Este rol se ejecuta primero porque prepara la base de servicios que otros roles necesitarán.

## **Notas Importantes**
- ⚠️ Algunos servicios requieren reinicio del sistema
- 🔄 Los handlers se ejecutan al final para aplicar cambios
- 📊 El monitoreo se configura de forma no intrusiva
- 🛡️ Los servicios de seguridad se habilitan por defecto
