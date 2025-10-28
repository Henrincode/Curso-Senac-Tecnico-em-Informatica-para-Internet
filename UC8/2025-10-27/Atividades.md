# Exercício 1: Autores e Livros

## Tabela: autor

| Nome                | Nacionalidade |
|---------------------|---------------|
| Machado de Assis    | Brasileiro    |
| George Orwell       | Britânico     |
| Clarice Lispector   | Brasileira    |
| J.K. Rowling        | Britânica     |
| Gabriel García Márquez | Colombiano |

`Consulta:`

```js
use("autores_e_livros")

db.autor.insertMany([
    {nome: "Machado de Assis", nacionalidade: "Brasileiro"},
    {nome: "George Orwell", nacionalidade: "Britânico"},
    {nome: "Clarice Lispector", nacionalidade: "Brasileira"},
    {nome: "J.K. Rowling", nacionalidade: "Britânica"},
    {nome: "Gabriel García Márquez", nacionalidade: "Colombiano"}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68fffb62fdeab7d9f943f56c"
    },
    "1": {
      "$oid": "68fffb62fdeab7d9f943f56d"
    },
    "2": {
      "$oid": "68fffb62fdeab7d9f943f56e"
    },
    "3": {
      "$oid": "68fffb62fdeab7d9f943f56f"
    },
    "4": {
      "$oid": "68fffb62fdeab7d9f943f570"
    }
  }
}
```

## Tabela: livro

| Título               | Autor                 | Ano  |
|----------------------|-----------------------|------|
| Dom Casmurro         | Machado de Assis      | 1899 |
| 1984                 | George Orwell         | 1949 |
| A Hora da Estrela    | Clarice Lispector     | 1977 |
| Harry Potter         | J.K. Rowling          | 1997 |
| Cem Anos de Solidão  | Gabriel García Márquez| 1967 |

`Consulta:`

```js
use("autores_e_livros")

db.livro.insertMany([
    {titulo: "Dom Casmurro", autor: "Machado de Assis", ano: 1899},
    {titulo: "1984", autor: "George Orwell", ano: 1949},
    {titulo: "A Hora da Estrela", autor: "Clarice Lispector", ano: 1977},
    {titulo: "Harry Potter", autor: "J.K. Rowling", ano: 1997},
    {titulo: "Cem Anos de Solidão", autor: "Gabriel García Márquez", ano: 1967}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68fffc69ff310c603c64957d"
    },
    "1": {
      "$oid": "68fffc69ff310c603c64957e"
    },
    "2": {
      "$oid": "68fffc69ff310c603c64957f"
    },
    "3": {
      "$oid": "68fffc69ff310c603c649580"
    },
    "4": {
      "$oid": "68fffc69ff310c603c649581"
    }
  }
}
```

### Atividades

1. Atualize o ano de publicação de **"Harry Potter"** para **1998**.

`Consulta:`

```js
use("autores_e_livros")

db.livro.updateOne(
    {nome: "Harry Potter"},
    {$set: {ano: 1998}}
)
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedId": null,
  "matchedCount": 0,
  "modifiedCount": 0,
  "upsertedCount": 0
}
```

2. Liste todos os livros publicados antes de **1950**.

`Consulta:`

```js
use("autores_e_livros")

db.livro.find(
    {ano: {$lt: 1950}}
)
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68fffc69ff310c603c64957d"
    },
    "titulo": "Dom Casmurro",
    "autor": "Machado de Assis",
    "ano": 1899
  },
  {
    "_id": {
      "$oid": "68fffc69ff310c603c64957e"
    },
    "titulo": "1984",
    "autor": "George Orwell",
    "ano": 1949
  }
]
```

3. Liste os **autores brasileiros**.

`Consulta:`

```js
use("autores_e_livros")

db.autor.find(
    {nacionalidade: {$in: ["Brasileiro", "Brasileira"]}}
)
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68fffb62fdeab7d9f943f56c"
    },
    "nome": "Machado de Assis",
    "nacionalidade": "Brasileiro"
  },
  {
    "_id": {
      "$oid": "68fffb62fdeab7d9f943f56e"
    },
    "nome": "Clarice Lispector",
    "nacionalidade": "Brasileira"
  }
]
```

4. **Consulta agregada**: Liste os livros com os dados completos do autor usando `$lookup`.

`Consulta:`

```js
use("autores_e_livros")

db.livro.aggregate([
    {
        $lookup: {
            from: "autor",
            localField: "autor",
            foreignField: "nome",
            as: "info_autor"
        }
    }
])
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68fffc69ff310c603c64957d"
    },
    "titulo": "Dom Casmurro",
    "autor": "Machado de Assis",
    "ano": 1899,
    "info_autor": [
      {
        "_id": {
          "$oid": "68fffb62fdeab7d9f943f56c"
        },
        "nome": "Machado de Assis",
        "nacionalidade": "Brasileiro"
      }
    ]
  },
  {
    "_id": {
      "$oid": "68fffc69ff310c603c64957e"
    },
    "titulo": "1984",
    "autor": "George Orwell",
    "ano": 1949,
    "info_autor": [
      {
        "_id": {
          "$oid": "68fffb62fdeab7d9f943f56d"
        },
        "nome": "George Orwell",
        "nacionalidade": "Britânico"
      }
    ]
  },
  {
    "_id": {
      "$oid": "68fffc69ff310c603c64957f"
    },
    "titulo": "A Hora da Estrela",
    "autor": "Clarice Lispector",
    "ano": 1977,
    "info_autor": [
      {
        "_id": {
          "$oid": "68fffb62fdeab7d9f943f56e"
        },
        "nome": "Clarice Lispector",
        "nacionalidade": "Brasileira"
      }
    ]
  },
  {
    "_id": {
      "$oid": "68fffc69ff310c603c649580"
    },
    "titulo": "Harry Potter",
    "autor": "J.K. Rowling",
    "ano": 1997,
    "info_autor": [
      {
        "_id": {
          "$oid": "68fffb62fdeab7d9f943f56f"
        },
        "nome": "J.K. Rowling",
        "nacionalidade": "Britânica"
      }
    ]
  },
  {
    "_id": {
      "$oid": "68fffc69ff310c603c649581"
    },
    "titulo": "Cem Anos de Solidão",
    "autor": "Gabriel García Márquez",
    "ano": 1967,
    "info_autor": [
      {
        "_id": {
          "$oid": "68fffb62fdeab7d9f943f570"
        },
        "nome": "Gabriel García Márquez",
        "nacionalidade": "Colombiano"
      }
    ]
  }
]
```

---

# Exercício 2: Clientes e Pedidos

## Tabela: cliente

| Nome  | Cidade          |
|-------|-----------------|
| Ana   | São Paulo       |
| Bruno | Rio de Janeiro  |
| Carla | Belo Horizonte  |
| Daniel| Curitiba        |
| Elisa | Porto Alegre    |

`Consulta:`

```js
use("clientes_e_pedidos")

db.cliente.insertMany([
    {nome: "Ana", cidade: "São Paulo"},
    {nome: "Bruno", cidade: "Rio de Janeiro"},
    {nome: "Carla", cidade: "Belo Horizonte"},
    {nome: "Daniel", cidade: "Curitiba"},
    {nome: "Elisa", cidade: "Porto Alegre"},
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "6900024c8bf097d475947b5a"
    },
    "1": {
      "$oid": "6900024c8bf097d475947b5b"
    },
    "2": {
      "$oid": "6900024c8bf097d475947b5c"
    },
    "3": {
      "$oid": "6900024c8bf097d475947b5d"
    },
    "4": {
      "$oid": "6900024c8bf097d475947b5e"
    }
  }
}
```

## Tabela: pedido

| Cliente | Produto    | Valor |
|----------|------------|-------|
| Ana      | Notebook   | 3500  |
| Bruno    | Celular    | 1800  |
| Carla    | Tablet     | 1200  |
| Daniel   | Monitor    | 900   |
| Elisa    | Impressora | 700   |

`Consulta:`

```js
use("clientes_e_pedidos")

db.pedido.insertMany([
    {cliente: "Ana", produto: "Notebook", valor: 3500},
    {cliente: "Bruno", produto: "Celular", valor: 1800},
    {cliente: "Carla", produto: "Tablet", valor: 1200},
    {cliente: "Daniel", produto: "Monitor", valor: 900},
    {cliente: "Elisa", produto: "Impressora", valor: 700},
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "690002cf92be7a798af3231f"
    },
    "1": {
      "$oid": "690002cf92be7a798af32320"
    },
    "2": {
      "$oid": "690002cf92be7a798af32321"
    },
    "3": {
      "$oid": "690002cf92be7a798af32322"
    },
    "4": {
      "$oid": "690002cf92be7a798af32323"
    }
  }
}
```

### Atividades

1. Atualize o valor do pedido de **"Daniel"** para **950**.

`Consulta:`

```js
use("clientes_e_pedidos")

db.pedido.updateOne(
    {nome: "Daniel"},
    {$set: {valor: 950}}
)
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedId": null,
  "matchedCount": 0,
  "modifiedCount": 0,
  "upsertedCount": 0
}
```

2. Liste os pedidos com valor acima de **1000**.

`Consulta:`

```js
use("clientes_e_pedidos")

db.pedido.find(
    {valor: {$gt: 1000}}
)
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "690002cf92be7a798af3231f"
    },
    "cliente": "Ana",
    "produto": "Notebook",
    "valor": 3500
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32320"
    },
    "cliente": "Bruno",
    "produto": "Celular",
    "valor": 1800
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32321"
    },
    "cliente": "Carla",
    "produto": "Tablet",
    "valor": 1200
  }
]
```

3. **Consulta agregada**: Liste os pedidos com os dados do cliente usando `$lookup`.  

`Consulta:`

```js
use("clientes_e_pedidos")

db.pedido.aggregate([
    {
        $lookup: {
            from: "cliente",
            localField: "cliente",
            foreignField: "nome",
            as: "info_cliente"
        }
    }
])
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "690002cf92be7a798af3231f"
    },
    "cliente": "Ana",
    "produto": "Notebook",
    "valor": 3500,
    "info_cliente": [
      {
        "_id": {
          "$oid": "6900024c8bf097d475947b5a"
        },
        "nome": "Ana",
        "cidade": "São Paulo"
      }
    ]
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32320"
    },
    "cliente": "Bruno",
    "produto": "Celular",
    "valor": 1800,
    "info_cliente": [
      {
        "_id": {
          "$oid": "6900024c8bf097d475947b5b"
        },
        "nome": "Bruno",
        "cidade": "Rio de Janeiro"
      }
    ]
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32321"
    },
    "cliente": "Carla",
    "produto": "Tablet",
    "valor": 1200,
    "info_cliente": [
      {
        "_id": {
          "$oid": "6900024c8bf097d475947b5c"
        },
        "nome": "Carla",
        "cidade": "Belo Horizonte"
      }
    ]
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32322"
    },
    "cliente": "Daniel",
    "produto": "Monitor",
    "valor": 900,
    "info_cliente": [
      {
        "_id": {
          "$oid": "6900024c8bf097d475947b5d"
        },
        "nome": "Daniel",
        "cidade": "Curitiba"
      }
    ]
  },
  {
    "_id": {
      "$oid": "690002cf92be7a798af32323"
    },
    "cliente": "Elisa",
    "produto": "Impressora",
    "valor": 700,
    "info_cliente": [
      {
        "_id": {
          "$oid": "6900024c8bf097d475947b5e"
        },
        "nome": "Elisa",
        "cidade": "Porto Alegre"
      }
    ]
  }
]
```

---

# Exercício 3: Filmes, Atores e Estúdios

## Tabela: filme

| Título             | Ano  | Gênero     | Estúdio  |
|--------------------|------|------------|----------|
| O Grande Golpe     | 2005 | Ação       | CineMax  |
| Amor em Paris      | 2010 | Romance    | Lumière  |
| Mistério na Neve   | 2018 | Suspense   | CineMax  |
| Aventura Submarina | 2022 | Aventura   | Oceanic  |
| O Código Perdido   | 2015 | Mistério   | Lumière  |

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.filme.insertMany([
    {titulo: "O Grande Golpe", ano: 2005, genero: "Ação", estudio: "CineMax"},
    {titulo: "Amor em Paris", ano: 2010, genero: "Romance", estudio: "Lumière"},
    {titulo: "Mistério na Neve", ano: 2018, genero: "Suspense", estudio: "CineMax"},
    {titulo: "Aventura Submarina", ano: 2022, genero: "Aventura", estudio: "Oceanic"},
    {titulo: "O Código Perdido", ano: 2015, genero: "Mistério", estudio: "Lumière"}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "69000c0aaf850e88e275a8ee"
    },
    "1": {
      "$oid": "69000c0aaf850e88e275a8ef"
    },
    "2": {
      "$oid": "69000c0aaf850e88e275a8f0"
    },
    "3": {
      "$oid": "69000c0aaf850e88e275a8f1"
    },
    "4": {
      "$oid": "69000c0aaf850e88e275a8f2"
    }
  }
}
```

## Tabela: ator

| Nome          | Idade | Filme             |
|---------------|-------|------------------|
| João Silva    | 35    | O Grande Golpe   |
| Maria Costa   | 28    | Amor em Paris    |
| Pedro Martins | 42    | Mistério na Neve |
| Ana Ribeiro   | 30    | Aventura Submarina |
| Lucas Andrade | 33    | O Código Perdido |

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.ator.insertMany([
    {nome: "João Silva", idade: 35, filme: "O Grande Golpe"},
    {nome: "Maria Costa", idade: 28, filme: "Amor em Paris"},
    {nome: "Pedro Martins", idade: 42, filme: "Mistério na Neve"},
    {nome: "Ana Ribeiro", idade: 30, filme: "Aventura Submarina"},
    {nome: "Lucas Andrade", idade: 33, filme: "O Código Perdido"}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "69000ca011d1906bff164d61"
    },
    "1": {
      "$oid": "69000ca011d1906bff164d62"
    },
    "2": {
      "$oid": "69000ca011d1906bff164d63"
    },
    "3": {
      "$oid": "69000ca011d1906bff164d64"
    },
    "4": {
      "$oid": "69000ca011d1906bff164d65"
    }
  }
}
```

## Tabela: estúdio

| Nome     | Sede           | Fundado |
|----------|----------------|---------|
| CineMax  | São Paulo      | 1998    |
| Lumière  | Rio de Janeiro | 2005    |
| Oceanic  | Recife         | 2012    |

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.estudio.insertMany([
    {nome: "CineMax", sede: "São Paulo", fundado: 1998},
    {nome: "Lumière", sede: "Rio de Janeiro", fundado: 2005},
    {nome: "Oceanic", sede: "Recife", fundado: 2012}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "69000d0f25a6c8fafe79aa2e"
    },
    "1": {
      "$oid": "69000d0f25a6c8fafe79aa2f"
    },
    "2": {
      "$oid": "69000d0f25a6c8fafe79aa30"
    }
  }
}
```

### Atividades

1. Atualize o gênero do filme **"O Código Perdido"** para **"Ação"**.

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.filme.updateOne(
    {titulo: "O Código Perdido"},
    {$set: {genero: "Ação"}}
)
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedId": null,
  "matchedCount": 1,
  "modifiedCount": 1,
  "upsertedCount": 0
}
```

2. Liste todos os filmes lançados **após 2010**.

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.filme.find(
    {ano: {$gt: 2010}}
)
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f0"
    },
    "titulo": "Mistério na Neve",
    "ano": 2018,
    "genero": "Suspense",
    "estudio": "CineMax"
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f1"
    },
    "titulo": "Aventura Submarina",
    "ano": 2022,
    "genero": "Aventura",
    "estudio": "Oceanic"
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f2"
    },
    "titulo": "O Código Perdido",
    "ano": 2015,
    "genero": "Ação",
    "estudio": "Lumière"
  }
]
```

3. Liste os **estúdios fundados antes de 2010**.

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.filme.find(
    {ano: {$lt: 2010}}
)
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8ee"
    },
    "titulo": "O Grande Golpe",
    "ano": 2005,
    "genero": "Ação",
    "estudio": "CineMax"
  }
]
```

4. **Consulta agregada**: Liste os filmes com os dados completos do **estúdio** e do **ator principal** usando dois `$lookup`.

`Consulta:`

```js
use("filmes_atores_e_estudios")

db.filme.aggregate([
    {
        $lookup: {
            from: "estudio", // Coleção estrangeira
            localField: "estudio", // Campo na local
            foreignField: "nome", // Campo na estrangeira
            as: "info_estudio" // Nome do array
        }
    },
    {
        $lookup: {
            from: "ator", // Coleção estrangeira
            localField: "titulo", // Campo na local
            foreignField: "filme", // Campo na estrangeira
            as: "info_ator" // Nome do array
        }
    }
])
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8ee"
    },
    "titulo": "O Grande Golpe",
    "ano": 2005,
    "genero": "Ação",
    "estudio": "CineMax",
    "info_estudio": [
      {
        "_id": {
          "$oid": "69000d0f25a6c8fafe79aa2e"
        },
        "nome": "CineMax",
        "sede": "São Paulo",
        "fundado": 1998
      }
    ],
    "info_ator": [
      {
        "_id": {
          "$oid": "69000ca011d1906bff164d61"
        },
        "nome": "João Silva",
        "idade": 35,
        "filme": "O Grande Golpe"
      }
    ]
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8ef"
    },
    "titulo": "Amor em Paris",
    "ano": 2010,
    "genero": "Romance",
    "estudio": "Lumière",
    "info_estudio": [
      {
        "_id": {
          "$oid": "69000d0f25a6c8fafe79aa2f"
        },
        "nome": "Lumière",
        "sede": "Rio de Janeiro",
        "fundado": 2005
      }
    ],
    "info_ator": [
      {
        "_id": {
          "$oid": "69000ca011d1906bff164d62"
        },
        "nome": "Maria Costa",
        "idade": 28,
        "filme": "Amor em Paris"
      }
    ]
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f0"
    },
    "titulo": "Mistério na Neve",
    "ano": 2018,
    "genero": "Suspense",
    "estudio": "CineMax",
    "info_estudio": [
      {
        "_id": {
          "$oid": "69000d0f25a6c8fafe79aa2e"
        },
        "nome": "CineMax",
        "sede": "São Paulo",
        "fundado": 1998
      }
    ],
    "info_ator": [
      {
        "_id": {
          "$oid": "69000ca011d1906bff164d63"
        },
        "nome": "Pedro Martins",
        "idade": 42,
        "filme": "Mistério na Neve"
      }
    ]
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f1"
    },
    "titulo": "Aventura Submarina",
    "ano": 2022,
    "genero": "Aventura",
    "estudio": "Oceanic",
    "info_estudio": [
      {
        "_id": {
          "$oid": "69000d0f25a6c8fafe79aa30"
        },
        "nome": "Oceanic",
        "sede": "Recife",
        "fundado": 2012
      }
    ],
    "info_ator": [
      {
        "_id": {
          "$oid": "69000ca011d1906bff164d64"
        },
        "nome": "Ana Ribeiro",
        "idade": 30,
        "filme": "Aventura Submarina"
      }
    ]
  },
  {
    "_id": {
      "$oid": "69000c0aaf850e88e275a8f2"
    },
    "titulo": "O Código Perdido",
    "ano": 2015,
    "genero": "Ação",
    "estudio": "Lumière",
    "info_estudio": [
      {
        "_id": {
          "$oid": "69000d0f25a6c8fafe79aa2f"
        },
        "nome": "Lumière",
        "sede": "Rio de Janeiro",
        "fundado": 2005
      }
    ],
    "info_ator": [
      {
        "_id": {
          "$oid": "69000ca011d1906bff164d65"
        },
        "nome": "Lucas Andrade",
        "idade": 33,
        "filme": "O Código Perdido"
      }
    ]
  }
]
```