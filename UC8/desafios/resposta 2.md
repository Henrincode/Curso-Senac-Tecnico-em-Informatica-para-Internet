# Exercício 2 – BANCO DE DADOS ESCOLA
1. Crie um banco de dados chamado ESCOLA.
```sql
CREATE DATABASE ESCOLA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```
2. Exiba todos os bancos de dados existentes.
```sql
SHOW DATABASES;
```
3. Torne o banco ESCOLA ativo.
```sql
USE escola;
```
4. Crie uma tabela chamada t_aluno com os campos:
- id_aluno (inteiro, chave primária, auto incremento)
- nome (texto, até 100 caracteres)
- idade (inteiro)
- cidade (texto, até 100 caracteres)
- serie (texto, até 20 caracteres)
```sql
CREATE TABLE t_aluno (
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(100),
    serie VARCHAR(20)
) DEFAULT CHARSET = utf8;
```
5. Veja a descrição da tabela criada.
```sql
DESCRIBE t_aluno
```
6. Cadastre pelo menos 3 alunos na tabela.
```sql
INSERT INTO t_aluno (nome, idade, cidade, serie) VALUES
("Fulano", 10, "Americana", "Quinta"),
("Ciclano", 9, "Limeira", "Terceira"),
("Fulana", 11, "Campinas", "Sexta")
```
7. Exiba todos os registros cadastrados.
```sql
SELECT * FROM t_aluno
```
8. Atualize a cidade de um dos alunos.
```sql
UPDATE t_aluno
SET cidade = "São Paulo"
WHERE id_aluno = 3
```
9. Exiba novamente os registros para confirmar a alteração.
```sql
SELECT * FROM t_aluno
```
10. Exporte o banco de dados ESCOLA em formato .sql.
11. Envie o arquivo exportado para o professor pelo Microsoft Teams.