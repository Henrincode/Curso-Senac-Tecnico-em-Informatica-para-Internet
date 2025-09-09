# Exercício 3 – BANCO DE DADOS CINEMA
1. Crie um banco de dados chamado CINEMA.
```sql
CREATE DATABASE CINEMA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```
2. Exiba todos os bancos de dados existentes.
```sql
SHOW DATABASES;
```
3. Torne o banco CINEMA ativo.
```sql
USE cinema;
```
4. Crie uma tabela chamada t_filme com os campos:
- id_filme (inteiro, chave primária, auto incremento)
- titulo (texto, até 150 caracteres)
- diretor (texto, até 100 caracteres)
- genero (texto, até 50 caracteres)
- duracao (inteiro, em minutos)
- classificacao (texto, até 10 caracteres)
```sql
CREATE TABLE t_filme (
    id_filme INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    diretor VARCHAR(100),
    genero VARCHAR(50),
    duracao INT,
    classificacao VARCHAR(10)
) DEFAULT CHARSET = utf8;
```
5. Veja a descrição da tabela criada.
```sql
DESCRIBE t_cinema
```
6. Cadastre pelo menos 3 filmes na tabela.
```sql
INSERT INTO t_filme (titulo, diretor, genero, duracao, classificacao) VALUES
("Filme 1", "Diretor 1", "Genero 1", 120, "18+"),
("Filme 2", "Diretor 2", "Genero 2", 160, "16+"),
("Filme 3", "Diretor 3", "Genero 3", 110, "13+")
```
7. Exiba todos os registros cadastrados.
```sql
SELECT * FROM t_filme
```
8. Atualize a duração de um dos filmes.
```sql
UPDATE t_filme
SET duracao = 100
WHERE id_filme = 3
```
9. Exiba novamente os registros para confirmar a alteração.
```sql
SELECT * FROM t_filme
```
10. Exporte o banco de dados CINEMA em formato .sql.
11. Envie o arquivo exportado para o professor pelo Microsoft Teams.