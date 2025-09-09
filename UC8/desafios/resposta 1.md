# Exercício 1 – BANCO DE DADOS LIVRARIA

1. Crie um banco de dados chamado LIVRARIA.
```sql
CREATE DATABASE LIVRARIA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```
2. Exiba todos os bancos de dados existentes e verifique se o seu banco foi criado.
```sql
SHOW DATABASES;
```
3. Torne o banco LIVRARIA ativo.
```sql
USE livraria;
```
4. Crie uma tabela chamada t_livro com os campos:
- id_livro (inteiro, chave primária, auto incremento)
- titulo (texto, até 150 caracteres)
- autor (texto, até 100 caracteres)
- genero (texto, até 50 caracteres)
- preco (número decimal com duas casas)
- ano_publicacao (inteiro)

```sql
CREATE TABLE t_livro (
    id_livro INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    autor VARCHAR(100),
    genero VARCHAR(50),
    preco DECIMAL(10, 2),
    ano_publicacao INT
) DEFAULT CHARSET = utf8;
```

5. Veja a descrição da tabela criada.
```sql
DESCRIBE t_livro
```
6. Cadastre pelo menos 3 livros na tabela.
```sql
INSERT INTO t_livro (titulo, autor, genero, preco, ano_publicacao) VALUES
("Harry Potter e a Pedra Filosofal", "J. K. Rowling", "fantasia e ficção", 39.90, 2000),
("Senhor dos Anéis - A Sociedade do Anel", "J. R. R. Tolkien", "Fantasia", 44.90, 1981),
("Livro generico", "Autor Generico", "Genetrico", 199.99, 2025)
```
7. Exiba todos os registros cadastrados.
```sql
SELECT * FROM t_livro
```
8. Atualize o preço de um dos livros.
```sql
UPDATE t_livro
SET preco = 299.99 
WHERE id_livro = 3;
```
9. Exiba novamente os registros para verificar a alteração.
```sql
SELECT * FROM t_livro
```
10. Exporte o banco de dados LIVRARIA em formato .sql pelo phpMyAdmin ou
Workbench.

11. Envie o arquivo exportado para o professor pelo Microsoft Teams.