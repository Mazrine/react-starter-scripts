[Unit]
Description=Serviço para executar 'npm run dev' no projeto your-react-app
After=network.target

[Service]
Type=simple
ExecStart=/bin/bash -c 'source /root/.nvm/nvm.sh && npm run dev -- --port 8200 --host'
WorkingDirectory=/root/your-react-app
Restart=always
User=root
Environment=NODE_ENV=development

[Install]
WantedBy=multi-user.target
root@srv597587:~# cat front_starter.sh
#!/bin/bash2

# Nome do serviço
SERVICE_NAME="your-react-app"

# Caminho do diretório onde será executado o comando
APP_DIR="/root/your-react-app"

# Caminho para o executável npm via NVM
NVM_DIR="/root/.nvm/versions/node/v22.12.0/bin"

# Criando o arquivo de serviço
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

echo "Criando o arquivo de serviço em ${SERVICE_FILE}..."

sudo bash -c "cat > ${SERVICE_FILE}" <<EOF
[Unit]
Description=Serviço para executar 'npm run dev' no projeto imobtech-frontend
After=network.target

[Service]
ExecStart=/bin/bash -c 'source /root/.nvm/nvm.sh && npm run dev -- --port 8200 --host'
WorkingDirectory=${APP_DIR}
Restart=always
User=$(whoami)
Environment=NODE_ENV=development
Environment=PATH=${NVM_DIR}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

[Install]
WantedBy=multi-user.target
EOF

# Alterar permissões no arquivo do serviço
echo "Alterando permissões do arquivo de serviço..."
sudo chmod 644 ${SERVICE_FILE}

# Recarregar o daemon do systemd para reconhecer o novo serviço
echo "Recarregando o systemd..."
sudo systemctl daemon-reload

# Habilitar o serviço para iniciar automaticamente no boot
echo "Habilitando o serviço para iniciar no boot..."
sudo systemctl enable ${SERVICE_NAME}

# Iniciar o serviço
echo "Iniciando o serviço..."
sudo systemctl start ${SERVICE_NAME}

# Verificar o status do serviço
echo "Verificando o status do serviço..."
sudo systemctl status ${SERVICE_NAME}