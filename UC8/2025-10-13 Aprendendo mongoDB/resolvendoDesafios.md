# Banco de Dados “Loja”

## 🏦 Nome de banco sugerido: `loja`

---

## 🛒 Coleção: **produtos**

### 1. Criação da coleção

Crie a coleção `produtos` no banco `loja`.

### 2. Inserção de valores

| Nome     | Preço | Estoque |
| -------- | ----- | ------- |
| Notebook | 3500  | 10      |
| Mouse    | 150   | 25      |
| Teclado  | 300   | 15      |
| Cadeira  | 1200  | 5       |
| Monitor  | 800   | 8       |

#### Resposta 1, 2:

`Consulta:`

```js
use('loja')

db.produtos.insertMany([
    {nome: "Notebook", preco: 3500, estoque: 10},
    {nome: "Mouse", preco: 150, estoque: 25},
    {nome: "Teclado", preco: 300, estoque: 15},
    {nome: "Cadeira", preco: 1200, estoque: 5},
    {nome: "Monitor", preco: 800, estoque: 8},
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68ed9e243c1050a7af63c0a9"
    },
    "1": {
      "$oid": "68ed9e243c1050a7af63c0aa"
    },
    "2": {
      "$oid": "68ed9e243c1050a7af63c0ab"
    },
    "3": {
      "$oid": "68ed9e243c1050a7af63c0ac"
    },
    "4": {
      "$oid": "68ed9e243c1050a7af63c0ad"
    }
  }
}
```

### 3. Consultas

* Listar todos os produtos
* Listar produtos com preço **menor que 500**
* Listar produtos com **estoque menor ou igual a 10**

`Listar todos os produtos:`

`Consulta:`

```js
use('loja')

db.produtos.find()
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0a9"
    },
    "nome": "Notebook",
    "preco": 3500,
    "estoque": 10
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0aa"
    },
    "nome": "Mouse",
    "preco": 150,
    "estoque": 25
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ab"
    },
    "nome": "Teclado",
    "preco": 300,
    "estoque": 15
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ac"
    },
    "nome": "Cadeira",
    "preco": 1200,
    "estoque": 5
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ad"
    },
    "nome": "Monitor",
    "preco": 800,
    "estoque": 8
  }
]
```

`* Listar produtos com preço **menor que 500**:`

`Consulta:`

```js
use('loja')

db.produtos.find({
    preco: {$lt: 500}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0aa"
    },
    "nome": "Mouse",
    "preco": 150,
    "estoque": 25
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ab"
    },
    "nome": "Teclado",
    "preco": 300,
    "estoque": 15
  }
]
```

`* Listar produtos com **estoque menor ou igual a 10**:`

`Consulta:`

```js
use('loja')

db.produtos.find({
    estoque: {$lte: 10}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0a9"
    },
    "nome": "Notebook",
    "preco": 3500,
    "estoque": 10
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ac"
    },
    "nome": "Cadeira",
    "preco": 1200,
    "estoque": 5
  },
  {
    "_id": {
      "$oid": "68ed9e243c1050a7af63c0ad"
    },
    "nome": "Monitor",
    "preco": 800,
    "estoque": 8
  }
]
```
---

## 👥 Coleção: **clientes**

### 1. Criação da coleção

Crie a coleção `clientes` no banco `loja`.

### 2. Inserção de valores

| Nome     | Idade | Cidade         |
| -------- | ----- | -------------- |
| Carlos   | 28    | São Paulo      |
| Beatriz  | 22    | Curitiba       |
| Fernando | 35    | Rio de Janeiro |
| Lucia    | 30    | Belo Horizonte |

`Consulta:`

```js
use('loja')

db.clientes.insertMany([
    {nome: "Carlos", idade: 28, cidade: "São Paulo"},
    {nome: "Beatriz", idade: 22, cidade: "Curitiba"},
    {nome: "Fernando", idade: 35, cidade: "Rio de Janeiro"},
    {nome: "Lucia", idade: 30, cidade: "Belo Horizonte"},
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68eda0f32aebd9b2e6e65262"
    },
    "1": {
      "$oid": "68eda0f32aebd9b2e6e65263"
    },
    "2": {
      "$oid": "68eda0f32aebd9b2e6e65264"
    },
    "3": {
      "$oid": "68eda0f32aebd9b2e6e65265"
    }
  }
}
```


### 3. Consultas

* Listar todos os clientes
* Listar clientes com **idade maior ou igual a 25**
* Listar clientes de uma **cidade específica** (exemplo: “São Paulo”)

`* Listar todos os clientes`

`Consulta:`

```js
use('loja')

db.clientes.find()
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65262"
    },
    "nome": "Carlos",
    "idade": 28,
    "cidade": "São Paulo"
  },
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65263"
    },
    "nome": "Beatriz",
    "idade": 22,
    "cidade": "Curitiba"
  },
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65264"
    },
    "nome": "Fernando",
    "idade": 35,
    "cidade": "Rio de Janeiro"
  },
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65265"
    },
    "nome": "Lucia",
    "idade": 30,
    "cidade": "Belo Horizonte"
  }
]
```

`* Listar clientes com **idade maior ou igual a 25**`

`Consulta:`

```js
use('loja')

db.clientes.find({
    idade: {$gte: 25}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65262"
    },
    "nome": "Carlos",
    "idade": 28,
    "cidade": "São Paulo"
  },
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65264"
    },
    "nome": "Fernando",
    "idade": 35,
    "cidade": "Rio de Janeiro"
  },
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65265"
    },
    "nome": "Lucia",
    "idade": 30,
    "cidade": "Belo Horizonte"
  }
]
```

`* Listar clientes de uma **cidade específica** (exemplo: “São Paulo”)`

`Consulta:`

```js
use('loja')

db.clientes.find({
    cidade: {$eq: "São Paulo"}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda0f32aebd9b2e6e65262"
    },
    "nome": "Carlos",
    "idade": 28,
    "cidade": "São Paulo"
  }
]
```


---

## 💰 Coleção: **vendas**

### 1. Criação da coleção

Crie a coleção `vendas` no banco `loja`.

### 2. Inserção de valores

| Produto  | Valor | Quantidade |
| -------- | ----- | ---------- |
| Notebook | 3500  | 1          |
| Mouse    | 150   | 3          |
| Teclado  | 300   | 2          |
| Cadeira  | 1200  | 1          |
| Monitor  | 800   | 2          |

`Consulta:`

```js
use('loja')

db.vendas.insertMany([
    {produto: "Notebook", valor: 3500, quantidade: 1},
    {produto: "Mouse", valor: 150, quantidade: 3},
    {produto: "Teclado", valor: 300, quantidade: 2},
    {produto: "Cadeira", valor: 1200, quantidade: 1},
    {produto: "Monitor", valor: 800, quantidade: 2},
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68eda2ae7a742a4a1215c595"
    },
    "1": {
      "$oid": "68eda2ae7a742a4a1215c596"
    },
    "2": {
      "$oid": "68eda2ae7a742a4a1215c597"
    },
    "3": {
      "$oid": "68eda2ae7a742a4a1215c598"
    },
    "4": {
      "$oid": "68eda2ae7a742a4a1215c599"
    }
  }
}
```

### 3. Consultas

* Listar todas as vendas
* Listar vendas com **valor maior que 1000**
* Listar vendas com **quantidade maior ou igual a 2**

`* Listar todas as vendas`

`Consulta:`

```js
use('loja')

db.vendas.find()
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c595"
    },
    "produto": "Notebook",
    "valor": 3500,
    "quantidade": 1
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c596"
    },
    "produto": "Mouse",
    "valor": 150,
    "quantidade": 3
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c597"
    },
    "produto": "Teclado",
    "valor": 300,
    "quantidade": 2
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c598"
    },
    "produto": "Cadeira",
    "valor": 1200,
    "quantidade": 1
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c599"
    },
    "produto": "Monitor",
    "valor": 800,
    "quantidade": 2
  }
]
```

`* Listar vendas com **valor maior que 1000**`

`Consulta:`

```js
use('loja')

db.vendas.find({
    valor: {$gt: 1000}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c595"
    },
    "produto": "Notebook",
    "valor": 3500,
    "quantidade": 1
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c598"
    },
    "produto": "Cadeira",
    "valor": 1200,
    "quantidade": 1
  }
]
```

`* Listar vendas com **quantidade maior ou igual a 2**`

`Consulta:`

```js
use('loja')

db.vendas.find({
    quantidade: {$gte: 2}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c596"
    },
    "produto": "Mouse",
    "valor": 150,
    "quantidade": 3
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c597"
    },
    "produto": "Teclado",
    "valor": 300,
    "quantidade": 2
  },
  {
    "_id": {
      "$oid": "68eda2ae7a742a4a1215c599"
    },
    "produto": "Monitor",
    "valor": 800,
    "quantidade": 2
  }
]
```

---

## 🏭 Atividade 4 – Coleção: **fornecedores**

### 1. Criação da coleção

Crie a coleção `fornecedores` no banco `loja`.

### 2. Inserção de valores

| Nome              | Cidade         | Tipo de Produto |
| ----------------- | -------------- | --------------- |
| TechDistribuidora | São Paulo      | Eletrônicos     |
| Moveis & Cia      | Curitiba       | Móveis          |
| Acessórios Ltda   | Rio de Janeiro | Eletrônicos     |
| DecorPlus         | Belo Horizonte | Decoração       |

`Consulta:`

```js
use('loja')

db.fornecedores.insertMany([
    {nome: "TechDistribuidora", cidade: "São Paulo", tipo_de_produto: "Eletrônicos "},
    {nome: "Moveis & Cia", cidade: "Curitiba", tipo_de_produto: "Móveis"},
    {nome: "Acessórios Ltda", cidade: "Rio de Janeiro", tipo_de_produto: "Eletrônicos"},
    {nome: "DecorPlus", cidade: "Belo Horizonte", tipo_de_produto: "Decoração"}
])
```

`Resposta:`

```js
{
  "acknowledged": true,
  "insertedIds": {
    "0": {
      "$oid": "68eda441fe9adc355b82b475"
    },
    "1": {
      "$oid": "68eda441fe9adc355b82b476"
    },
    "2": {
      "$oid": "68eda441fe9adc355b82b477"
    },
    "3": {
      "$oid": "68eda441fe9adc355b82b478"
    }
  }
}
```

### 3. Consultas

* Listar todos os fornecedores
* Listar fornecedores de uma **cidade específica**
* Listar fornecedores que fornecem um **tipo de produto específico**

`* Listar todos os fornecedores`

`Consulta:`

```js
use('loja')

db.fornecedores.find()
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b475"
    },
    "nome": "TechDistribuidora",
    "cidade": "São Paulo",
    "tipo_de_produto": "Eletrônicos "
  },
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b476"
    },
    "nome": "Moveis & Cia",
    "cidade": "Curitiba",
    "tipo_de_produto": "Móveis"
  },
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b477"
    },
    "nome": "Acessórios Ltda",
    "cidade": "Rio de Janeiro",
    "tipo_de_produto": "Eletrônicos"
  },
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b478"
    },
    "nome": "DecorPlus",
    "cidade": "Belo Horizonte",
    "tipo_de_produto": "Decoração"
  }
]
```

`* Listar fornecedores de uma **cidade específica**`

`Consulta:`

```js
use('loja')

db.fornecedores.find({
    cidade: {$eq: "São Paulo"}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b475"
    },
    "nome": "TechDistribuidora",
    "cidade": "São Paulo",
    "tipo_de_produto": "Eletrônicos "
  }
]
```

`* Listar fornecedores que fornecem um **tipo de produto específico**`

`Consulta:`

```js
use('loja')

db.fornecedores.find({
    tipo_de_produto: {$eq: "Eletrônicos"}
})
```

`Resposta:`

```js
[
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b475"
    },
    "nome": "TechDistribuidora",
    "cidade": "São Paulo",
    "tipo_de_produto": "Eletrônicos"
  },
  {
    "_id": {
      "$oid": "68eda441fe9adc355b82b477"
    },
    "nome": "Acessórios Ltda",
    "cidade": "Rio de Janeiro",
    "tipo_de_produto": "Eletrônicos"
  }
]
```