# 🎯 GUÍA COMPLETA - CONFIGURACIÓN Y EJECUCIÓN DEL PROYECTO

## 📋 **PASO 1: Preparar las Máquinas Virtuales**

### 🔧 **Configurar Ubuntu Server (172.17.25.48)**

1. **Encender la VM "Ubuntu_Server"** desde vCenter
2. **Acceder a la consola** y loguearte
3. **Configurar IP estática:**

```bash
# Editar configuración de red
sudo nano /etc/netplan/00-installer-config.yaml

# Contenido del archivo:
network:
  version: 2
  ethernets:
    ens33:  # o el nombre de tu interfaz
      dhcp4: false
      addresses:
        - 172.17.25.48/24
      gateway4: 172.17.25.1
      nameservers:
        addresses:
          - 8.8.8.8
          - 8.8.4.4

# Aplicar configuración
sudo netplan apply

# Verificar conectividad
ping -c 3 8.8.8.8
```

4. **Configurar SSH:**
```bash
# Instalar SSH si no está
sudo apt update
sudo apt install -y openssh-server

# Habilitar SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Verificar que funciona
sudo systemctl status ssh
```

5. **Crear usuario para Ansible:**
```bash
# Crear usuario
sudo adduser ansible
sudo usermod -aG sudo ansible

# Configurar SSH sin contraseña (opcional)
sudo su - ansible
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

### 🎮 **Configurar Pop OS Gaming (172.17.25.88)**

1. **Encender la VM "Pop_OS_LTS_With_Nvidia"**
2. **Configurar red manualmente:**
   - Settings → Network → Wired Settings (⚙️)
   - IPv4 Method: **Manual**
   - Address: `172.17.25.88`
   - Netmask: `255.255.255.0`
   - Gateway: `172.17.25.1`
   - DNS: `8.8.8.8, 8.8.4.4`
   - Apply

3. **Abrir terminal y configurar SSH:**
```bash
# Actualizar sistema
sudo apt update

# Instalar SSH
sudo apt install -y openssh-server

# Crear usuario gamer
sudo adduser gamer
sudo usermod -aG sudo gamer

# Habilitar SSH
sudo systemctl enable ssh
sudo systemctl start ssh
```

### 🎓 **Configurar Pop OS Académico (172.17.25.89)**

1. **Encender la VM "Pop_OS_LTS"**
2. **Configurar red igual que gaming** pero con IP: `172.17.25.89`
3. **Configurar SSH:**
```bash
sudo apt update
sudo apt install -y openssh-server

# Crear usuario student
sudo adduser student
sudo usermod -aG sudo student

sudo systemctl enable ssh
sudo systemctl start ssh
```

---

## 📋 **PASO 2: Verificar Conectividad**

**Desde tu Mac, ejecutar estos comandos para verificar:**

```bash
# Verificar conectividad
ping -c 3 172.17.25.48  # Ubuntu Server
ping -c 3 172.17.25.88  # Pop Gaming  
ping -c 3 172.17.25.89  # Pop Académico

# Verificar SSH (debería pedir contraseña)
ssh ubuntu@172.17.25.48 'echo "Ubuntu Server OK"'
ssh gamer@172.17.25.88 'echo "Gaming OK"'
ssh student@172.17.25.89 'echo "Académico OK"'
```

---

## 🚀 **PASO 3: Ejecutar Ansible**

### **Verificar sintaxis primero:**
```bash
cd /Users/sebastiandefray413outlook.com/Documents/Ansible/ansible-proyecto

# Verificar que no hay errores
ansible-playbook site.yml --syntax-check

# Ver qué máquinas detecta
ansible all --list-hosts
```

### **Ejecutar en modo prueba:**
```bash
# Modo check (no hace cambios, solo simula)
ansible-playbook site.yml --check

# Si todo se ve bien, ejecutar de verdad
ansible-playbook site.yml --ask-pass
```

### **Ejecutar por partes:**
```bash
# Solo el servidor
ansible-playbook site.yml --limit ubuntu_server --ask-pass

# Solo gaming  
ansible-playbook site.yml --limit pop_gaming --ask-pass

# Solo académico
ansible-playbook site.yml --limit pop_academico --ask-pass
```

---

## 🔧 **PASO 4: Solución de Problemas**

### **Si no puede conectar por SSH:**
```bash
# Verificar desde las VMs que SSH funciona
sudo systemctl status ssh
sudo ufw status  # Verificar firewall
```

### **Si da error de autenticación:**
```bash
# Usar contraseña en lugar de llaves SSH
ansible-playbook site.yml --ask-pass
```

### **Si falla algún rol:**
```bash
# Ejecutar solo un rol específico
ansible-playbook site.yml --tags "sistema" --ask-pass
```

---

## ✅ **PASO 5: Verificar Resultados**

**Después de ejecutar el playbook:**

```bash
# Conectarse a cada VM y verificar
ssh ubuntu@172.17.25.48
# Verificar: htop instalado, zona horaria, usuario ansible creado

ssh gamer@172.17.25.88  
# Verificar: Steam instalado (si aplicó gaming)

ssh student@172.17.25.89
# Verificar: LibreOffice instalado (si aplicó académico)
```

---

## 📞 **¿Problemas?**

Si algo falla:
1. **Copia el error completo**
2. **Dime en qué paso ocurrió**  
3. **Te ayudo a solucionarlo**

¡Ya tienes todo listo para ejecutar! 🎉