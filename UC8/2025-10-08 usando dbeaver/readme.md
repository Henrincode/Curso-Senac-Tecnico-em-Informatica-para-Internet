![alt text](image.png)

# 📘 **Documentação do DBeaver**

## 🔍 O que é o DBeaver?

O **DBeaver** é uma ferramenta de gerenciamento de banco de dados (DBMS) universal, gratuita e de código aberto, compatível com uma grande variedade de bancos de dados como MySQL, PostgreSQL, Oracle, SQL Server, SQLite, entre outros.

Ele oferece uma interface gráfica rica para interação com bancos de dados, tornando tarefas como consultas SQL, visualização de dados, modelagem e exportação/importação mais simples.

---

## 🌐 Onde Baixar o DBeaver?

Você pode baixar o DBeaver diretamente no site oficial:

🔗 **[https://dbeaver.io/download/](https://dbeaver.io/download/)**

### Versões Disponíveis:

* **DBeaver Community** (gratuita e open source)
* **DBeaver Enterprise** (com recursos adicionais, voltada para empresas – versão paga)

---

## 💻 Como Instalar o DBeaver

### ✅ Requisitos:

* **Java JDK 11+** (para versões mais recentes, já vem embutido)
* Sistema Operacional: Windows, macOS ou Linux

### 🔧 Instalação por Sistema Operacional

---

### 🪟 **Windows**

1. Baixe o instalador `.exe` no site oficial.
2. Execute o instalador.
3. Siga os passos do assistente de instalação.
4. Após instalar, abra o DBeaver pelo menu Iniciar ou atalho.

---

### 🍎 **macOS**

1. Baixe o arquivo `.dmg`.
2. Clique duas vezes para montar o volume.
3. Arraste o DBeaver para a pasta **Aplicativos**.
4. Abra o DBeaver (pode ser necessário autorizar nas configurações de segurança do macOS).

---

### 🐧 **Linux (Ubuntu/Debian)**

#### Opção 1: via `.deb`

```bash
wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb
sudo apt -f install   # Para resolver dependências, se necessário
```

#### Opção 2: via Snap

```bash
sudo snap install dbeaver-ce
```

---

## ⚙️ Primeiros Passos no DBeaver

### 🧩 Adicionar uma Conexão com Banco de Dados

1. Abra o DBeaver.
2. Vá em **Arquivo > Nova Conexão**.
3. Escolha o tipo do banco de dados (ex: MySQL, PostgreSQL).
4. Insira os dados de conexão:

   * Host
   * Porta
   * Nome do banco
   * Usuário e senha
5. Clique em **Testar Conexão**.
6. Se tudo estiver correto, clique em **Concluir**.

---

## 🧑‍💻 Comandos Básicos no DBeaver

Você pode executar comandos SQL diretamente no editor do DBeaver. Aqui estão alguns exemplos:

### ▶️ Consultar dados

```sql
SELECT * FROM clientes;
```

### ➕ Inserir dados

```sql
INSERT INTO clientes (nome, email) VALUES ('João Silva', 'joao@email.com');
```

### ✏️ Atualizar dados

```sql
UPDATE clientes SET email = 'novo@email.com' WHERE id = 1;
```

### ❌ Deletar dados

```sql
DELETE FROM clientes WHERE id = 1;
```

### 🏗️ Criar tabela

```sql
CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10,2)
);
```

---

## 📤 Importar/Exportar Dados

### Exportar tabela como CSV:

1. Clique com botão direito na tabela.
2. Selecione **Exportar dados**.
3. Escolha o formato (ex: CSV).
4. Defina o local de salvamento e opções de formatação.

### Importar dados de CSV:

1. Clique com botão direito na tabela.
2. Escolha **Importar dados**.
3. Selecione o arquivo CSV.
4. Mapeie colunas e finalize o processo.

---

## 📚 Recursos Extras

* **Modo ERD (Modelo Entidade-Relacionamento)**: Visualize o modelo do banco com diagramas.
* **SQL Editor com AutoComplete**.
* **Histórico de Comandos SQL**.
* **Extensões e Plugins**: Disponíveis para funcionalidades adicionais.

---

## ❓ Dúvidas Frequentes

**1. O DBeaver é gratuito?**
Sim, a versão **Community** é 100% gratuita e open source.

**2. Posso usar o DBeaver com qualquer banco de dados?**
Sim, desde que tenha o driver JDBC correspondente (muitos já vêm pré-instalados).

**3. O DBeaver é seguro?**
Sim. Ele não compartilha dados com terceiros. Para uso corporativo, é recomendada a versão Enterprise.

---

## 📎 Conclusão

O DBeaver é uma excelente ferramenta para desenvolvedores, DBAs e analistas de dados que precisam trabalhar com diferentes bancos de dados. Sua facilidade de uso, compatibilidade ampla e recursos avançados o tornam uma das ferramentas mais populares para gestão de dados.