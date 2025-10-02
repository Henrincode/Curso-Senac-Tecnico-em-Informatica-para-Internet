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
    cidade int NOT NULL,
    estado int NOT NULL,
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