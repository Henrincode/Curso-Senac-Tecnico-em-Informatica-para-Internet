# Ideias para o projeto integrador

## Tipos de site

### Classificado para condomínios

#### Nomes:
- classificond.com.br
- condofacil.com.br

#### Banco de dados

```sql
table usuarios {
  id int [primary key]
  nome varchar [not null]
  email varchar [not null]
  senha varchar [not null]
}

table condominios {
  id int [primary key]
  nome int [not null]
  cidade int [not null]
  estado int [not null]
  pais int [not null]
}

table categorias {
  id int [primary key]
  nome varchar [not null]
  img varchar [not null]
}

table produtos {
  id int [primary key]
  categoria_id int [not null]
  titulo varchar [not null]
  descricao varchar [not null]
  criacao datetime [not null]
}
```