# react-starter-scripts

react starter scripts to allow the server to stay always on. Useful for deployment

# 📘 React App Starter Scripts

Este repositório contém dois arquivos que ajudam a configurar e executar automaticamente um projeto React usando `systemd`. A seguir, você encontrará um guia detalhado sobre como utilizar esses arquivos.

## 📂 Estrutura do Repositório

```
react-starter-scripts/
├── .git
├── react-app-starter.sh      # Script para configurar o serviço systemd
├── README.md                 # Este arquivo
└── your-react-app.service    # Arquivo systemd pronto para uso
```

## 🚀 Como Usar

### 🔧 Passo 1: Clonar o Repositório

Primeiro, clone este repositório para o seu servidor ou máquina local:

```bash
git clone https://github.com/seu-usuario/react-starter-scripts.git
cd react-starter-scripts
```

### 🛠️ Passo 2: Escolher uma das opções para rodar o serviço

Você pode escolher entre:

1. **Usar o arquivo manualmente (`your-react-app.service`)**
2. **Rodar o script automatizado (`react-app-starter.sh`)**

---

### ✅ **Opção 1: Usar o Arquivo Manual (`your-react-app.service`)**

1. **Copie o arquivo de serviço para o diretório do systemd:**

   ```bash
   sudo cp your-react-app.service /etc/systemd/system/
   ```

2. **Dê as permissões corretas no arquivo:**

   ```bash
   sudo chmod 644 /etc/systemd/system/your-react-app.service
   ```

3. **Recarregue o daemon do systemd:**

   ```bash
   sudo systemctl daemon-reload
   ```

4. **Habilite o serviço para iniciar automaticamente no boot:**

   ```bash
   sudo systemctl enable your-react-app
   ```

5. **Inicie o serviço:**

   ```bash
   sudo systemctl start your-react-app
   ```

6. **Verifique o status do serviço:**
   ```bash
   sudo systemctl status your-react-app
   ```

---

### ⚙️ **Opção 2: Usar o Script Automatizado (`react-app-starter.sh`)**

1. **Dê permissão de execução ao script:**

   ```bash
   chmod +x react-app-starter.sh
   ```

2. **Execute o script para configurar o serviço automaticamente:**

   ```bash
   ./react-app-starter.sh
   ```

3. **Verifique o status do serviço:**
   ```bash
   sudo systemctl status your-react-app
   ```

---

## 🌐 Acessando o Projeto

Depois que o serviço estiver rodando, você pode abrir o navegador e acessar o projeto React:

- **Localmente:**
  ```
  http://localhost:8200
  ```
- **De outro dispositivo na mesma rede:**
  ```
  http://<IP_DO_SERVIDOR>:8200
  ```

---

## 📋 Personalização

Você pode modificar o arquivo `your-react-app.service` ou o script `react-app-starter.sh` conforme necessário:

- **Porta:**
  No arquivo de serviço ou no script, altere a linha do `ExecStart` para modificar a porta usada pelo `npm run dev`.

- **Usuário:**
  Se preferir rodar o serviço com um usuário específico, edite a linha `User=root` para o usuário desejado.

---
