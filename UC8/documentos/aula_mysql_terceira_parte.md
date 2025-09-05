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

DESCRIBE pessoas;  -- ou desc pessoas;
```

---

## 3. Melhorando a estrutura do banco de dados

### 3.1 Deletando o banco de dados existente
```sql
DROP DATABASE cadastro;
```

### 3.2 Adicionando configurações no banco
```sql
CREATE DATABASE cadastro
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


```sql
DROP TABLE pessoas;
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

### 6.1 Inserindo dados na tabela cursos
```sql
INSERT INTO cursos (nome, descricao, carga, totalaulas, ano)
VALUES
('MySQL Básico', 'Curso introdutório de MySQL', 40, 20, 2024),
('JavaScript Avançado', 'Curso avançado de JavaScript', 60, 30, 2023),
('Python para Data Science', 'Introdução ao uso de Python em ciência de dados', 80, 40, 2025);
```

### 6.2 Visualizando os registros da tabela cursos
```sql
SELECT * FROM cursos;
```

---

## 7. Consultando dados com filtros e ordenação

### 7.1 Selecionando colunas específicas
```sql
SELECT nome, nacionalidade FROM colaboradores;
```

### 7.2 Filtrando registros com WHERE
```sql
SELECT * FROM colaboradores WHERE sexo = 'F';
SELECT * FROM colaboradores WHERE peso > 70;
SELECT * FROM colaboradores WHERE nacionalidade = 'Brasil' AND altura > 1.70;
```

### 7.3 Ordenando resultados
```sql
SELECT * FROM colaboradores ORDER BY nome ASC;
SELECT * FROM colaboradores ORDER BY peso DESC;
```

### 7.4 Limitando resultados
```sql
SELECT * FROM colaboradores LIMIT 3;
SELECT * FROM colaboradores ORDER BY nascimento DESC LIMIT 2;
```

---

## 8. Atualizando e removendo dados

### 8.1 Atualizando registros
```sql
UPDATE colaboradores SET peso = 60.0 WHERE nome = 'Maria';
UPDATE colaboradores SET nacionalidade = 'Brasil' WHERE nacionalidade IS NULL;
```

### 8.2 Removendo registros
```sql
DELETE FROM colaboradores WHERE nome = 'Endrik';
DELETE FROM colaboradores WHERE peso < 60;
```

---


## 9. Chaves estrangeiras e relacionamentos

### 9.1 Adicionando uma chave primária em cursos
```sql
ALTER TABLE cursos ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
```

### 9.2 Relacionando colaboradores e cursos (exemplo de tabela de matrícula)
```sql
CREATE TABLE matriculas (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    colaborador_id INT,
    curso_id INT,
    data_matricula DATE,
    FOREIGN KEY (colaborador_id) REFERENCES colaboradores(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
) DEFAULT CHARSET = utf8;
```

### 9.3 Adicionando mais colaboradores
```sql
INSERT INTO colaboradores (nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('Carlos Silva', '1988-07-12', 'M', 82.0, 1.80, 'Brasil'),
('Fernanda Souza', '1992-03-25', 'F', 65.5, 1.68, 'Brasil'),
('João Pedro', '1985-11-30', 'M', 90.2, 1.85, 'Portugal'),
('Patrícia Lima', '1990-09-17', 'F', 58.3, 1.62, 'Brasil'),
('Ricardo Alves', '1979-05-08', 'M', 77.0, 1.75, 'Espanha'),
('Juliana Costa', '1997-01-22', 'F', 62.1, 1.70, 'Brasil'),
('Marcos Paulo', '1983-06-14', 'M', 85.7, 1.78, 'Brasil'),
('Aline Torres', '1995-10-05', 'F', 59.9, 1.66, 'Argentina'),
('Eduardo Ramos', '2000-12-19', 'M', 73.4, 1.72, 'Brasil'),
('Bianca Martins', '1993-04-03', 'F', 60.0, 1.64, 'Brasil');
```

### 9.4 Adicionando mais cursos
```sql
INSERT INTO cursos (nome, descricao, carga, totalaulas, ano)
VALUES
('Excel Avançado', 'Curso completo de Excel', 50, 25, 2024),
('Gestão de Projetos', 'Fundamentos de gerenciamento de projetos', 60, 30, 2025),
('Inglês Intermediário', 'Curso de inglês para negócios', 80, 40, 2023),
('Power BI', 'Visualização de dados com Power BI', 40, 20, 2025),
('Comunicação Empresarial', 'Técnicas de comunicação no ambiente corporativo', 30, 15, 2024);
```

### 9.5 Adicionando matrículas de colaboradores em cursos
```sql
-- Exemplo: supondo que os IDs dos colaboradores e cursos estejam em sequência
INSERT INTO matriculas (colaborador_id, curso_id, data_matricula)
VALUES
(1, 1, '2025-09-03'),
(2, 2, '2025-09-03'),
(3, 3, '2025-09-03'),
(4, 1, '2025-09-03'),
(5, 4, '2025-09-03'),
(6, 5, '2025-09-03'),
(7, 2, '2025-09-03'),
(8, 3, '2025-09-03'),
(9, 4, '2025-09-03'),
(10, 5, '2025-09-03'),
(11, 1, '2025-09-03'),
(12, 2, '2025-09-03');
```

---

## 10. Funções agregadas e agrupamentos


### 10.1 Contando registros
```sql
SELECT COUNT(*) AS total_colaboradores FROM colaboradores;
SELECT COUNT(*) FROM colaboradores WHERE sexo = 'M';
```


### 10.2 Média, soma, mínimo e máximo
```sql
SELECT AVG(peso) AS media_peso FROM colaboradores;
SELECT MIN(altura) AS menor_altura, MAX(altura) AS maior_altura FROM colaboradores;
```

### 10.3 Agrupando resultados
```sql
SELECT nacionalidade, COUNT(*) AS quantidade FROM colaboradores
GROUP BY nacionalidade;
```

### 10.4 Filtrando grupos
```sql
SELECT nacionalidade, COUNT(*) AS quantidade FROM colaboradores
GROUP BY nacionalidade
HAVING quantidade > 1;
```

---

## 11. Views, Stored Procedures e Triggers


### 11.1 Criando uma view
```sql
CREATE VIEW vw_colaboradores_br AS
SELECT * FROM colaboradores WHERE nacionalidade = 'Brasil';
```

### 11.2 Consultando a view
```sql
SELECT * FROM vw_colaboradores_br;
```

### 11.3 Criando uma stored procedure
```sql
DELIMITER //
CREATE PROCEDURE sp_adicionar_colaborador(
    IN p_nome VARCHAR(30),
    IN p_nascimento DATE,
    IN p_sexo CHAR(1),
    IN p_peso FLOAT,
    IN p_altura FLOAT,
    IN p_nacionalidade VARCHAR(20)
)
BEGIN
    INSERT INTO colaboradores (nome, nascimento, sexo, peso, altura, nacionalidade)
    VALUES (p_nome, p_nascimento, p_sexo, p_peso, p_altura, p_nacionalidade);
END //
DELIMITER ;
```

### 11.4 Executando a stored procedure
```sql
CALL sp_adicionar_colaborador('Lucas', '1990-05-15', 'M', 70.5, 1.75, 'Brasil');
```

### 11.5 Criando uma trigger
```sql
DELIMITER //
CREATE TRIGGER trg_atualiza_ano_colaborador
BEFORE INSERT ON colaboradores
FOR EACH ROW
BEGIN
    SET NEW.ano = YEAR(NEW.nascimento);
END //
DELIMITER ;
```

---

## 12. Backup e recuperação de dados


### 12.1 Fazendo backup de uma tabela
```sh
mysqldump -u usuario -p nome_do_banco colaboradores > colaboradores_backup.sql
```

### 12.2 Restaurando uma tabela
```sh
mysql -u usuario -p nome_do_banco < colaboradores_backup.sql
```

---

## 13. Exportando e importando dados


### 13.1 Exportando dados para CSV
```sql
SELECT * FROM colaboradores
INTO OUTFILE '/tmp/colaboradores.csv'
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

### 13.2 Importando dados de CSV
```sql
LOAD DATA INFILE '/tmp/colaboradores.csv'
INTO TABLE colaboradores
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
```

---

## 14. Segurança e permissões

### 14.1 Criando um novo usuário
```sql
CREATE USER 'novo_usuario'@'localhost' IDENTIFIED BY 'senha';
```

### 14.2 Concedendo permissões
```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON cadastro.* TO 'novo_usuario'@'localhost';
```

### 14.3 Revogando permissões
```sql
REVOKE DELETE ON cadastro.* FROM 'novo_usuario'@'localhost';
```

### 14.4 Excluindo um usuário
```sql
DROP USER 'novo_usuario'@'localhost';
```

---

## 15. Monitoramento e otimização

### 15.1 Exibindo processos em execução
```sql
SHOW PROCESSLIST;
```


### 15.2 Otimizando uma tabela
```sql
OPTIMIZE TABLE colaboradores;
```

### 15.3 Analisando uma tabela
```sql
ANALYZE TABLE colaboradores;
```

### 15.4 Verificando a integridade de uma tabela
```sql
CHECK TABLE colaboradores;
```

---

## 16. Particionamento de tabelas


### 16.1 Criando uma tabela particionada
```sql
CREATE TABLE colaboradores_part (
    id INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE,
    sexo ENUM('M','F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'Brasil',
    PRIMARY KEY(id, sexo)
) PARTITION BY LIST (sexo) (
    PARTITION p_male VALUES IN ('M'),
    PARTITION p_female VALUES IN ('F')
);
```

### 16.2 Inserindo dados na tabela particionada
```sql
INSERT INTO colaboradores_part (id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES (1, 'Godofredo', '1984-01-02', 'M', 78.5, 1.83, 'Brasil');
```

### 16.3 Consultando dados da tabela particionada
```sql
SELECT * FROM colaboradores_part WHERE sexo = 'F';
```

---

## 17. Tuning de desempenho

### 17.1 Ajustando variáveis de sistema
```sql
SET GLOBAL innodb_buffer_pool_size = 1024 * 1024 * 256; -- 256MB
SET GLOBAL max_connections = 200;
```


### 17.2 Criando índices
```sql
CREATE INDEX idx_nacionalidade ON colaboradores(nacionalidade);
```

### 17.3 Removendo índices
```sql
DROP INDEX idx_nacionalidade ON colaboradores;
```

---

## 18. Replicação de dados

### 18.1 Configurando o mestre
```sql
CHANGE MASTER TO
MASTER_HOST='ip_do_slave',
MASTER_USER='replicador',
MASTER_PASSWORD='senha',
MASTER_LOG_FILE='mysql-bin.000001',
MASTER_LOG_POS= 107;
```

### 18.2 Iniciando a replicação
```sql
START SLAVE;
```

### 18.3 Verificando o status da replicação
```sql
SHOW SLAVE STATUS\G;
```

---

## 19. Armazenamento de dados em nuvem

### 19.1 Conectando ao Amazon RDS
```sql
mysql -h endpoint_do_rds -u usuario -p
```

### 19.2 Criando um banco de dados no RDS
```sql
CREATE DATABASE meu_banco;
```

### 19.3 Fazendo backup para o S3
```sql
CALL mysql.s3_backup('meu_banco', 'meu_arquivo_backup');
```

### 19.4 Restaurando do S3
```sql
CALL mysql.s3_restore('meu_arquivo_backup');
```

---

## 20. Considerações finais

- Sempre faça backup dos seus dados antes de realizar operações destrutivas.
- Teste suas consultas e scripts em um ambiente seguro antes de aplicá-los em produção.
- Mantenha seu banco de dados e suas aplicações sempre atualizados.

