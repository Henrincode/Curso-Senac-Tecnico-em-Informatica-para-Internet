# Aula Inicial: Criando e Manipulando Bancos de Dados MySQL

## 1. Criando o primeiro banco de dados
```sql
CREATE DATABASE cadastro;
```

## 2. Criando a primeira tabela
```sql
CREATE TABLE pessoas (
    nome VARCHAR(30),
    idade TINYINT(3),
    sexo CHAR(1),
    peso FLOAT,
    altura FLOAT,
    nacionalidade VARCHAR(20)
);

DESCRIBE pessoas;  -- ou desc pessoas, verificar as informações da tabela;
```

---

## 3. Melhorando a estrutura do banco de dados

### 3.1 Deletando o banco de dados existente
```sql
DROP DATABASE cadastro;
```

### 3.2 Adicionando configurações no banco
```sql
CREATE DATABASE bancoConfigurado
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

### 3.3 Adicionando configurações na tabela
```sql
CREATE TABLE pessoas (
    nome VARCHAR(30) NOT NULL,
    nascimento DATE,
    sexo ENUM('M','F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'Brasil'
) DEFAULT CHARSET = utf8;

DESCRIBE pessoas;
```

### 3.4 Usando constraints (restrições)
- `NOT NULL` → não permite valores nulos  
- `DEFAULT` → define valor padrão

### 3.5 Adicionando um identificador único
```sql
CREATE TABLE pessoas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE,
    sexo ENUM('M','F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'Brasil',
    PRIMARY KEY(id)
) DEFAULT CHARSET = utf8;

DESCRIBE pessoas;
```

---

## 4. Inserindo dados na tabela

### 4.1 Inserindo um registro
```sql
INSERT INTO pessoas (nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES ('Godofredo', '1984-01-02', 'M', 78.5, 1.83, 'Brasil');
```
> **Observação:** Como `id` é `AUTO_INCREMENT`, podemos omiti-lo na inserção.

### 4.2 Inserindo múltiplos registros
```sql
INSERT INTO pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Maria', '1999-12-30', 'F', 55.2, 1.65, 'Brasil'),
('Marinalva', '1965-04-11', 'F', 77.4, 1.71, 'Alemanha'),
('Endrik', '1995-03-11', 'M', 80.1, 1.77, 'Irlanda'),
('Ana Clara', '2005-04-07', 'F', 57.4, 1.61, 'México');
```

### 4.3 Usando valores DEFAULT
```sql
INSERT INTO pessoas
VALUES (DEFAULT, 'Robert', '1975-04-11', 'M', 75.2, 1.78, DEFAULT);
```

### 4.4 Visualizando os registros
```sql
SELECT * FROM pessoas;
```

---

## 5. Alterando a estrutura do banco de dados

### 5.1 Adicionando e removendo colunas
```sql
ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(10);
ALTER TABLE pessoas DROP COLUMN profissao;
ALTER TABLE pessoas ADD COLUMN profissao VARCHAR(10) AFTER nome;
ALTER TABLE pessoas ADD COLUMN codigo INT FIRST;
```

### 5.2 Modificando colunas
```sql
ALTER TABLE pessoas MODIFY COLUMN profissao VARCHAR(20);
ALTER TABLE pessoas MODIFY COLUMN profissao VARCHAR(20) NOT NULL DEFAULT '';
```

### 5.3 Alterando nome da coluna
```sql
ALTER TABLE pessoas CHANGE COLUMN profissao prof VARCHAR(20) NOT NULL DEFAULT '';
```

### 5.4 Alterando nome da tabela
```sql
ALTER TABLE pessoas RENAME TO colaboradores;
DESCRIBE colaboradores;
```

---

## 6. Criando outra tabela
```sql
CREATE TABLE IF NOT EXISTS cursos (
    nome VARCHAR(50),
    descricao VARCHAR(255),
    carga INT,
    totalaulas INT,
    ano YEAR
) DEFAULT CHARSET = utf8;
```

