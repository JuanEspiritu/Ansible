# 👥 ROL: Usuarios y Políticas

## **Descripción**
Este rol gestiona la creación, configuración y políticas de usuarios del sistema, incluyendo permisos, grupos, políticas de seguridad y control de acceso en el laboratorio académico y gaming.

## **Funcionalidades Principales**

### 👤 **Gestión de Usuarios**
- Creación de usuarios del sistema con configuraciones específicas
- Asignación de grupos y permisos según el rol del usuario
- Configuración de directorios home personalizados
- Gestión de contraseñas y políticas de expiración

### 🔒 **Políticas de Seguridad**
- Configuración de políticas de contraseñas seguras
- Implementación de control de acceso basado en roles (RBAC)
- Configuración de sudo y permisos administrativos
- Políticas de bloqueo de cuentas y tiempo de sesión

### 👥 **Gestión de Grupos**
- Creación de grupos funcionales (students, gamers, admins)
- Asignación automática de usuarios a grupos según su función
- Configuración de permisos grupales
- Gestión de grupos especiales del sistema

### 🛡️ **Control de Acceso**
- Configuración de SSH y acceso remoto por usuario
- Restricciones de acceso por horarios y ubicación
- Configuración de PAM (Pluggable Authentication Modules)
- Auditoría de accesos y actividad de usuarios

## **Archivos Principales**

```
roles/usuarios_y_politicas/
├── tasks/main.yml          # Tareas principales del rol
├── handlers/main.yml       # Handlers para servicios de autenticación
├── templates/              # Plantillas de configuración
│   ├── pam/               # Configuraciones PAM
│   ├── sudoers/           # Archivos sudoers personalizados
│   └── ssh/               # Configuraciones SSH por usuario
├── defaults/main.yml       # Variables por defecto
├── vars/main.yml          # Variables específicas del rol
└── files/                 # Archivos estáticos (claves SSH, etc.)
```

## **Variables Importantes**

### Usuarios del Laboratorio Académico
```yaml
academic_users:
  - name: "student01"
    group: "students" 
    shell: "/bin/bash"
    sudo: false
  - name: "professor"
    group: "educators"
    shell: "/bin/bash" 
    sudo: true
```

### Usuarios del Laboratorio Gaming
```yaml
gaming_users:
  - name: "gamer01"
    group: "gamers"
    shell: "/bin/bash"
    sudo: false
    desktop_environment: true
```

### Políticas de Seguridad
```yaml
security_policies:
  password_min_length: 8
  password_complexity: true
  account_lockout_attempts: 3
  session_timeout: 3600
  sudo_timeout: 900
```

## **Uso**

### Ejecutar solo este rol
```bash
ansible-playbook playbooks/main.yml --tags usuarios_y_politicas
```

### Aplicar a grupo específico
```bash
ansible-playbook playbooks/main.yml --tags usuarios_y_politicas --limit lab_academico
```

### Crear solo usuarios gaming
```bash
ansible-playbook playbooks/main.yml --tags usuarios_y_politicas --limit lab_gaming
```

## **Dependencias**
- Sistema Ubuntu 20.04+ o Pop OS 20.04+
- Rol `gestion_procesos` ejecutado previamente
- PAM y SSH habilitados
- Permisos de sudo para ejecutar el rol

## **Orden de Ejecución**
🥈 **SEGUNDO** - Este rol se ejecuta después de `gestion_procesos` porque necesita que los servicios base estén configurados.

## **Usuarios Creados por Defecto**

### Ubuntu Server (Infraestructura)
- `lab_admin` - Administrador del laboratorio (sudo completo)
- `backup_user` - Usuario para respaldos automáticos
- `monitor_user` - Usuario para monitoreo del sistema

### Pop OS Gaming
- `gamer` - Usuario principal gaming (acceso completo al desktop)
- `student` - Usuario académico con restricciones

### Pop OS Standard
- `student` - Usuario académico principal
- `guest` - Usuario temporal para visitantes

## **Notas Importantes**
- 🔐 Las contraseñas se generan de forma segura y se almacenan encriptadas
- 👥 Los grupos se crean automáticamente según la configuración
- 🛡️ Las políticas de seguridad se aplican inmediatamente
- 📊 Toda la actividad de usuarios se registra en logs de auditoría
- ⚠️ Los cambios en políticas pueden requerir reinicio de sesión
