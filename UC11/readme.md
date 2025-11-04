# Ideias para o projeto integrador

## Tipos de site

### Classificado para condomínios

#### Nomes:
- classificond.com.br
- condofacil.com.br

#### Banco de dados

- carregar estrutura no site: https://dbdiagram.io/d

```sql
table usuarios {
  id int [primary key, not null]
  nome varchar [not null]
  email varchar [not null]
  senha varchar [not null]
}

table usuarios_condominios {
  usuario_id int [not null]
  condominio_id int [not null]
  bloco varchar [not null]
  apartamento varchar [not null]
}

table condominios {
  id int [primary key, not null]
  nome int [not null]
  numero int [not null]
  rua varchar [not null]
  cidade int [not null]
  estado int [not null]
  pais int [not null]
}

table categorias {
  id int [primary key, not null]
  nome varchar [not null]
  img varchar [not null]
}

table produtos {
  id int [primary key, not null]
  usuario_id int [not null]
  categoria_id int [not null]
  titulo varchar [not null]
  descricao varchar [not null]
  criacao datetime [not null]
}

ref: usuarios_condominios.usuario_id > usuarios.id
ref: usuarios_condominios.condominio_id > condominios.id
ref: produtos.categoria_id > categorias.id
ref: produtos.usuario_id > usuarios.id
```

# Criando banco no mySQL

- Criando banco de dados `condofacil`

```sql
CREATE DATABASE condofacil
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

- Criando tabela `usuarios`

```sql
CREATE TABLE usuarios (
    id int AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    senha varchar(100) NOT NULL,
    PRIMARY KEY (id));
```

- Criando tabela `condominios`

```sql
CREATE TABLE condominios (
    id int AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    numero int NOT NULL,
    rua varchar(100),
    cidade varchar(30) NOT NULL,
    estado varchar(30) NOT NULL,
    PRIMARY KEY (id));
```

- Criando tabela relacional `usuarios_condominios`

```sql
CREATE TABLE usuarios_condominios (
    usuario_id int NOT NULL,
    condominio_id int NOT NULL,
    bloco varchar(10) NOT NULL,
    apartamento varchar(10) NOT NULL);
```

- Criando tabela `produtos`

```sql
CREATE TABLE produtos (
    id int AUTO_INCREMENT NOT NULL,
    usuario_id int NOT NULL,
    categoria_id int NOT NULL,
    titulo varchar(20) NOT NULL,
    descricao text NOT NULL,
    PRIMARY KEY (id));
```

- Criando tabela `categorias`

```sql
CREATE TABLE categorias (
    id int AUTO_INCREMENT NOT NULL,
    nome varchar(20) NOT NULL,
    PRIMARY KEY (id));
```

- Criando FK

```sql
ALTER TABLE usuarios_condominios
ADD CONSTRAINT fk_uc_usuario
FOREIGN KEY (usuario_id) REFERENCES usuarios(id);

ALTER TABLE usuarios_condominios
ADD CONSTRAINT fk_uc_condominio
FOREIGN KEY (condominio_id) REFERENCES condominios(id);

ALTER TABLE produtos
ADD CONSTRAINT fk_prod_usuario
FOREIGN KEY (usuario_id) REFERENCES usuarios(id);

ALTER TABLE produtos
ADD CONSTRAINT fk_prod_categoria
FOREIGN KEY (categoria_id) REFERENCES categorias(id);

```

# Inserindo dados

- Inserindo condomínio

```sql
INSERT INTO condominios (nome, numero, rua, cidade, estado) VALUES
('Spazio Beach', 2000, 'Comendador Thomaz Fortunato', 'Americana', 'São Paulo')
```

- Inserindo usuário

```sql
INSERT INTO usuarios (nome, email, senha) VALUES
('Henrique', 'henrique@mail.com', 'dasDASD@!@#'),
('Ana Claudia', 'ana@mail.com', 'sadasd!@#Asdas'),
('Arthur Marques', 'arthur@mail.com', 'sdadSAD@!312'),
('Beatriz Souza', 'beatriz@mail.com', 'Bia123@!asd'),
('Carlos Eduardo', 'carlos@mail.com', 'CarL0s@#123'),
('Fernanda Lima', 'fernanda@mail.com', 'FerN@!789asd'),
('João Pedro', 'joaopedro@mail.com', 'JpEDR0@#abc'),
('Mariana Torres', 'mariana@mail.com', 'Mari@2024!A')
```

- Adicionando condomínio para usuário

```sql
INSERT INTO usuarios_condominios (usuario_id, condominio_id, bloco, apartamento) VALUES
(1, 1, '6', '308'),
(2, 1, '1', '102'),
(3, 1, '2', '201'),
(4, 1, '2', '202'),
(5, 1, '3', '301'),
(6, 1, '3', '302'),
(7, 1, '4', '401'),
(8, 1, '4', '402')
```

- Inserindo categoria

```sql
INSERT INTO categorias (nome) VALUES
('Eletrônicos'),
('Roupas'),
('Calçados'),
('Acessórios'),
('Móveis'),
('Decoração'),
('Brinquedos'),
('Livros')

```

- Inserindo produto

```sql
INSERT INTO produtos (usuario_id, categoria_id, titulo, descricao) VALUES
(1, 1, 'Rádio de carro CD USB', 'Rádio de carro usado com entradas USB e leitor de CD'),
(1, 1, 'Computador gamer', 'RTX 3060, I5, 16GB RAM, 1TB SSD'),
(2, 2, 'Camisa social azul', 'Camisa social masculina tamanho M, pouco usada'),
(2, 2, 'Jaqueta de couro', 'Jaqueta de couro preta, tamanho G, em ótimo estado'),
(3, 3, 'Tênis esportivo Nike', 'Tênis de corrida confortável, número 42, usado poucas vezes'),
(4, 4, 'Relógio de pulso', 'Relógio analógico com pulseira de couro marrom'),
(5, 5, 'Sofá 3 lugares', 'Sofá de tecido cinza, confortável e bem conservado'),
(6, 6, 'Luminária de mesa', 'Luminária branca de LED, ideal para escritório ou quarto'),
(7, 7, 'Boneca Barbie', 'Boneca original Barbie com roupas e acessórios'),
(8, 8, 'Livro “Dom Casmurro”', 'Edição de capa dura, excelente estado de conservação')
```

- Exibindo dados

```sql
SELECT
    u.nome AS usuario,
    c.nome AS condominio,
    uc.bloco,
    uc.apartamento,
    cat.nome AS categoria,
    p.titulo,
    p.descricao
FROM produtos p
INNER JOIN usuarios u 
    ON p.usuario_id = u.id
INNER JOIN categorias cat 
    ON p.categoria_id = cat.id
INNER JOIN usuarios_condominios uc 
    ON uc.usuario_id = u.id
INNER JOIN condominios c 
    ON uc.condominio_id = c.id
```