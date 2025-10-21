# 🎯 PROYECTO ANSIBLE - ESTRUCTURA SÚPER SIMPLE

## 📁 Archivos Principales

```
proyecto/
├── site.yml              ← ¡UN SOLO PLAYBOOK! 
├── inventory/hosts.yml    ← Todas las máquinas aquí
├── group_vars/           ← Variables simples
│   ├── all.yml           ← Para TODAS las máquinas
│   ├── academico.yml     ← Solo lab académico  
│   ├── gaming.yml        ← Solo lab gaming
│   ├── servidores.yml    ← Solo servidores
│   └── estaciones.yml    ← Solo estaciones Pop OS
└── roles/                ← Solo 4 roles
    ├── sistema/          ← Configuración básica
    ├── servicios/        ← SSH, web, etc.
    ├── usuarios/         ← Gestión de usuarios  
    └── aplicaciones/     ← Software específico
```

## 🚀 Cómo Usar

### Para ejecutar TODO:
```bash
ansible-playbook site.yml
```

### Para solo algunas máquinas:
```bash
# Solo servidores
ansible-playbook site.yml --limit servidores

# Solo gaming
ansible-playbook site.yml --limit gaming

# Solo académico  
ansible-playbook site.yml --limit academico
```

### Para probar sin ejecutar:
```bash
ansible-playbook site.yml --check
```

## 📋 Lo que Hace Cada Parte

### 🔧 Roles (4 simples):
- **sistema**: Actualiza y configura básico
- **servicios**: Instala SSH y servicios
- **usuarios**: Crea usuarios necesarios  
- **aplicaciones**: Instala software específico

### 🏷️ Grupos:
- **servidores**: Ubuntu Server (infraestructura)
- **estaciones**: Máquinas Pop OS (workstations)
- **academico**: Lab académico (universidad)
- **gaming**: Lab gaming (entretenimiento)

### 📊 Variables:
- **all.yml**: Para TODAS las máquinas
- **academico.yml**: Solo LibreOffice, Firefox, etc.
- **gaming.yml**: Solo Steam, drivers Nvidia, etc.
- **servidores.yml**: Solo SSH, Nginx, etc.

## ✅ Ventajas de Esta Estructura

1. **UN SOLO ARCHIVO** para ejecutar todo (`site.yml`)
2. **4 ROLES SIMPLES** en lugar de 6 complicados
3. **VARIABLES CLARAS** en español
4. **INVENTARIO SIMPLE** sin subdirectorios
5. **FÁCIL DE ENTENDER** para cualquier persona

## 🎓 Recomendaciones

- Siempre usar `--check` primero para probar
- Revisar `group_vars/` antes de cambiar variables
- Un rol = una función específica
- Mantener las tareas simples y claras

---
*¡Proyecto simplificado para máxima claridad y facilidad de uso! 🎉*