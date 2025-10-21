# 🎯 LABORATORIO ACADÉMICO Y GAMING

## 📁 Estructura CLARA y SIMPLE

```
ansible-proyecto/
├── 📄 ansible.cfg              # Configuración Ansible
├── 📄 site.yml                 # Playbook PRINCIPAL (todo en uno)
├── 📁 inventory/
│   └── 📄 hosts.yml            # Todas las máquinas definidas
├── 📁 group_vars/              # Variables por tipo de laboratorio
│   ├── 📄 all.yml              # Variables globales
│   ├── 📄 academico.yml        # Configuración lab académico
│   ├── 📄 gaming.yml           # Configuración lab gaming
│   └── 📄 servidores.yml       # Configuración servidores
└── 📁 roles/                   # Solo 4 roles ESENCIALES
    ├── 📁 sistema/             # Configuración base (OS, paquetes)
    ├── 📁 servicios/           # Servicios (SSH, DNS, DHCP)
    ├── 📁 usuarios/            # Usuarios y permisos
    └── 📁 aplicaciones/        # Software específico (gaming, académico)
```

## 🚀 USO SÚPER SIMPLE

**Una sola línea para configurar TODO:**
```bash
ansible-playbook site.yml
```

**Por laboratorio específico:**
```bash
ansible-playbook site.yml --limit academico
ansible-playbook site.yml --limit gaming
```

## ✨ **BENEFICIOS de esta estructura:**
- ✅ **UN SOLO archivo principal** (site.yml)
- ✅ **4 roles claros** en lugar de 6 confusos
- ✅ **Variables organizadas** por laboratorio
- ✅ **Sin playbooks múltiples** que confunden
- ✅ **Estructura estándar** de Ansible

---
**"Simplicidad es la máxima sofisticación"** - Leonardo da Vinci