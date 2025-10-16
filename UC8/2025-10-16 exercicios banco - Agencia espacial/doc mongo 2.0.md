# O que é o MongoDB?

## 📌 Visão Geral

**MongoDB** é um sistema de banco de dados **NoSQL** (Not Only SQL), de código aberto, orientado a documentos. Ele armazena dados em formato **JSON** (JavaScript Object Notation) ou **BSON** (uma versão binária do JSON), ao invés do modelo relacional tradicional baseado em tabelas.

O MongoDB foi desenvolvido com foco em **escalabilidade, desempenho e flexibilidade**, sendo uma das soluções NoSQL mais populares do mercado atual.

---

## 🧩 Principais Características

| Característica                        | Descrição                                                                                                           |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| 📄 **Orientado a Documentos**         | Os dados são armazenados em documentos BSON, similares ao JSON, permitindo estruturas aninhadas e dinâmicas.        |
| ⚡ **Alta Performance**                | Operações de leitura e escrita rápidas, mesmo em grandes volumes de dados.                                          |
| 🔄 **Esquema Flexível (Schema-less)** | Não exige um esquema fixo como bancos relacionais; documentos de uma mesma coleção podem ter estruturas diferentes. |
| ⚙️ **Escalabilidade Horizontal**      | Suporte a *sharding*, permitindo distribuir dados entre vários servidores.                                          |
| 🔐 **Segurança**                      | Suporte a autenticação, autorização, criptografia de dados e controle de acesso.                                    |
| 🌐 **Compatibilidade com a Nuvem**    | Suporte nativo para integração com ambientes de nuvem como AWS, Azure e Google Cloud.                               |

---

## 🔑 Conceitos de Chave (Comparação MySQL x MongoDB)

| Termo              | MySQL           | MongoDB            |
| ------------------ | --------------- | ------------------ |
| Banco de dados     | Database        | Database           |
| Tabela             | Table           | Collection         |
| Linha              | Row             | Document           |
| Coluna             | Column          | Field              |
| **Chave primária** | **Primary Key** | **_id automático** |

---

## 🗂️ Conceitos Básicos

### 1. **Documento**

* Unidade básica de dados no MongoDB.
* Equivalente a uma linha (registro) em bancos relacionais.
* Exemplo:

```json
{
  "nome": "Maria",
  "idade": 30,
  "email": "maria@email.com"
}
```

### 2. **Coleção (Collection)**

* Conjunto de documentos.
* Equivale a uma tabela em bancos relacionais.

### 3. **Banco de Dados (Database)**

* Conjunto de coleções relacionadas.

### 4. **BSON (Binary JSON)**

* Formato usado internamente pelo MongoDB para armazenar documentos.
* Suporta mais tipos de dados que JSON, como datas e binários.

---

## 🧪 Exemplo de Uso

### 🔹 Inserir Documentos

#### Inserir um único documento:

```js
db.usuarios.insertOne({
  nome: "João",
  idade: 28,
  interesses: ["futebol", "tecnologia"]
});
```

#### Inserir vários documentos:

```js
db.usuarios.insertMany([
  { nome: "Maria", idade: 30, cidade: "São Paulo" },
  { nome: "Carlos", idade: 25, cidade: "Rio de Janeiro" },
  { nome: "Ana", idade: 22, cidade: "Curitiba" }
]);
```

---

### 🔹 Buscar Documentos

```js
// Buscar todos os documentos
db.usuarios.find();

// Buscar documentos com filtro
db.usuarios.find({ idade: { $gt: 25 } });

// Buscar apenas alguns campos
db.usuarios.find({}, { nome: 1, idade: 1, _id: 0 });
```

---

### 🔹 Alterar (Atualizar) Documentos

#### Atualizar um único documento:

```js
db.usuarios.updateOne(
  { nome: "João" },
  { $set: { idade: 29, cidade: "Brasília" } }
);
```

#### Atualizar vários documentos:

```js
db.usuarios.updateMany(
  { cidade: "São Paulo" },
  { $set: { ativo: true } }
);
```

#### Substituir um documento inteiro:

```js
db.usuarios.replaceOne(
  { nome: "Maria" },
  { nome: "Maria Silva", idade: 31, cidade: "Campinas" }
);
```

---

### 🔹 Apagar (Deletar) Documentos

#### Deletar um único documento:

```js
db.usuarios.deleteOne({ nome: "Carlos" });
```

#### Deletar vários documentos:

```js
db.usuarios.deleteMany({ cidade: "Curitiba" });
```

#### Deletar todos os documentos da coleção:

```js
db.usuarios.deleteMany({});
```

---

# 🧮 Operadores de Comparação + Lógicos no MongoDB

| **Operador**   | **Tipo**   | **Descrição**                                         | **Exemplo**                                           | **Uso/Retorna**                                     |
| -------------- | ---------- | ----------------------------------------------------- | ----------------------------------------------------- | --------------------------------------------------- |
| **Comparação** |            |                                                       |                                                       |                                                     |
| `$eq`          | Comparação | Igual a                                               | `{ field: { $eq: 10 } }`                              | `field` igual a 10                                  |
| `$ne`          | Comparação | Diferente de                                          | `{ field: { $ne: 10 } }`                              | `field` diferente de 10                             |
| `$gt`          | Comparação | Maior que                                             | `{ field: { $gt: 10 } }`                              | `field` maior que 10                                |
| `$gte`         | Comparação | Maior ou igual a                                      | `{ field: { $gte: 10 } }`                             | `field` maior ou igual a 10                         |
| `$lt`          | Comparação | Menor que                                             | `{ field: { $lt: 10 } }`                              | `field` menor que 10                                |
| `$lte`         | Comparação | Menor ou igual a                                      | `{ field: { $lte: 10 } }`                             | `field` menor ou igual a 10                         |
| `$in`          | Comparação | Está em uma lista de valores                          | `{ field: { $in: [10,20,30] } }`                      | `field` é 10, 20 ou 30                              |
| `$nin`         | Comparação | Não está em uma lista de valores                      | `{ field: { $nin: [10,20,30] } }`                     | `field` não é 10, 20 nem 30                         |
| `$exists`      | Comparação | Verifica existência do campo                          | `{ field: { $exists: true } }`                        | documentos onde `field` existe                      |
| `$type`        | Comparação | Verifica o tipo do campo                              | `{ field: { $type: "string" } }`                      | `field` é do tipo string                            |
| **Lógicos**    |            |                                                       |                                                       |                                                     |
| `$and`         | Lógico     | Operador "E" - todos os filtros devem ser verdadeiros | `{ $and: [ { age: { $gt: 18 } }, { status: "A" } ] }` | documentos onde age > 18 **e** status = "A"         |
| `$or`          | Lógico     | Operador "OU" - pelo menos um filtro é verdadeiro     | `{ $or: [ { age: { $lt: 18 } }, { status: "B" } ] }`  | documentos onde age < 18 **ou** status = "B"        |
| `$not`         | Lógico     | Negação do filtro                                     | `{ field: { $not: { $gt: 10 } } }`                    | documentos onde `field` **não** é maior que 10      |
| `$nor`         | Lógico     | NOR (negação do OR)                                   | `{ $nor: [ { status: "A" }, { age: { $lt: 30 } } ] }` | documentos onde **nenhum** dos filtros é verdadeiro |

---

### Exemplos práticos:

```js
// Documentos com idade maior que 18 E status ativo
db.collection.find({
  $and: [
    { age: { $gt: 18 } },
    { status: "active" }
  ]
});

// Documentos com idade menor que 18 OU status inativo
db.collection.find({
  $or: [
    { age: { $lt: 18 } },
    { status: "inactive" }
  ]
});

// Documentos onde campo não é maior que 10
db.collection.find({
  field: { $not: { $gt: 10 } }
});
```

---

## 🛠️ Casos de Uso Comuns

* Aplicações Web e Mobile com dados dinâmicos
* Sistemas de gerenciamento de conteúdo (CMS)
* Plataformas de e-commerce
* Análise de dados em tempo real
* Internet das Coisas (IoT)
* Jogos online

---

## ✅ Vantagens

* Alta flexibilidade no modelo de dados
* Fácil de escalar horizontalmente
* Bom desempenho com grandes volumes
* Ferramentas robustas para administração e monitoramento

---

## ⚠️ Desvantagens

* Não é ideal para aplicações que exigem transações complexas como em bancos de dados relacionais.
* Pode consumir mais memória devido à ausência de normalização.
* Requer atenção especial ao projetar o modelo de dados para garantir performance.

---

## 📚 Conclusão

O MongoDB é uma solução moderna de banco de dados para aplicações que exigem flexibilidade, velocidade e escalabilidade. Sua abordagem orientada a documentos permite trabalhar com dados de forma mais natural, especialmente em aplicações com estrutura de dados variada e mutável.

Seu uso é amplamente recomendado para startups, sistemas distribuídos, microserviços e aplicações em nuvem, onde a agilidade e a escalabilidade são essenciais.