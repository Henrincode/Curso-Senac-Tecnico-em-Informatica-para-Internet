# 🪐 Banco: `agencia_espacial`

---

## 🛸 Collection: `alienigenas_turistas`

### Registros

| nome    | planeta_origem | especie            | destino | humor     | numero_de_tentaculos | gasto_medio |
| ------- | -------------- | ------------------ | ------- | --------- | -------------------- | ----------- |
| Zlorg   | Nebulon-5      | Lumifero           | Saturno | Animado   | 4                    | 230         |
| Xyra    | Glorptar       | Gelatina Sentiente | Marte   | Curioso   | 0                    | 180         |
| Bliptor | Kronix         | Ciborgue Etéreo    | Lua     | Entediado | 2                    | 90          |
| T’quinn | Vortex-12      | Anfíbio Cósmico    | Terra   | Fascinado | 6                    | 320         |
| Moolah  | Zeltra         | Felino Galáctico   | Netuno  | Sonolento | 3                    | 150         |

### Tarefas

1. Inserir todos os registros na collection `alienigenas_turistas`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.insertMany([
        {nome: "Zlorg", planeta_origem: "Nebulon-5", especie: "Lumifero", destino: "Saturno", humor: "Animado", numero_de_tentaculos: 4, gasto_medio: 230},
        {nome: "Xyra", planeta_origem: "Glorptar", especie: "Gelatina Sentiente", destino: "Marte", humor: "Curioso", numero_de_tentaculos: 0, gasto_medio: 180},
        {nome: "Bliptor", planeta_origem: "Kronix", especie: "Ciborgue Etéreo", destino: "Lua", humor: "Entediado", numero_de_tentaculos: 2, gasto_medio: 90},
        {nome: "T’quinn", planeta_origem: "Vortex-12", especie: "Anfíbio Cósmico", destino: "Terra", humor: "Fascinado", numero_de_tentaculos: 6, gasto_medio: 320},
        {nome: "Moolah", planeta_origem: "Zeltra", especie: "Felino Galáctico", destino: "Netuno", humor: "Sonolento", numero_de_tentaculos: 3, gasto_medio: 150},
    ])
    ```

    `Resposta:`

    ```js
    {
        "acknowledged": true,
        "insertedIds": {
            "0": {
            "$oid": "68f1750666e6f9763f98ab56"
            },
            "1": {
            "$oid": "68f1750666e6f9763f98ab57"
            },
            "2": {
            "$oid": "68f1750666e6f9763f98ab58"
            },
            "3": {
            "$oid": "68f1750666e6f9763f98ab59"
            },
            "4": {
            "$oid": "68f1750666e6f9763f98ab5a"
            }
        }
    }
    ```

2. Consultar alienígenas que estão visitando Marte.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find({
        destino: "Marte"
    })
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab57"
            },
            "nome": "Xyra",
            "planeta_origem": "Glorptar",
            "especie": "Gelatina Sentiente",
            "destino": "Marte",
            "humor": "Curioso",
            "numero_de_tentaculos": 0,
            "gasto_medio": 180
        }
    ]
    ```

3. Mostrar nomes e planetas dos que estão **Animados**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find(
        {humor: "Animado"},
        {nome: 1, planeta_origem: 1}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab56"
            },
            "nome": "Zlorg",
            "planeta_origem": "Nebulon-5"
        }
    ]
    ```

4. Procurar os alienígenas com `gasto_medio` acima de **200**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find({
        gasto_medio: {$gt: 200}
    })
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab56"
            },
            "nome": "Zlorg",
            "planeta_origem": "Nebulon-5",
            "especie": "Lumifero",
            "destino": "Saturno",
            "humor": "Animado",
            "numero_de_tentaculos": 4,
            "gasto_medio": 230
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab59"
            },
            "nome": "T’quinn",
            "planeta_origem": "Vortex-12",
            "especie": "Anfíbio Cósmico",
            "destino": "Terra",
            "humor": "Fascinado",
            "numero_de_tentaculos": 6,
            "gasto_medio": 320
        }
    ]
    ```

5. Atualizar **Bliptor** para humor `'Empolgado'`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.updateOne(
        {nome: "Bliptor"},
        {$set: {humor: 'Empolgado'}}
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

6. Aumentar `gasto_medio` de **T’quinn** para **400**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.updateOne(
        {nome: "T’quinn"},
        {$set: {gasto_medio: 400}}
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

7. Atualizar `numero_de_tentaculos` de **Moolah** para **4**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.updateOne(
        {nome: "Moolah"},
        {$set: {numero_de_tentaculos: 4}}
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

8. Exibir alienígenas com **4 ou mais tentáculos**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find(
        {numero_de_tentaculos: {$gte: 4}}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab56"
            },
            "nome": "Zlorg",
            "planeta_origem": "Nebulon-5",
            "especie": "Lumifero",
            "destino": "Saturno",
            "humor": "Animado",
            "numero_de_tentaculos": 4,
            "gasto_medio": 230
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab59"
            },
            "nome": "T’quinn",
            "planeta_origem": "Vortex-12",
            "especie": "Anfíbio Cósmico",
            "destino": "Terra",
            "humor": "Fascinado",
            "numero_de_tentaculos": 6,
            "gasto_medio": 400
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab5a"
            },
            "nome": "Moolah",
            "planeta_origem": "Zeltra",
            "especie": "Felino Galáctico",
            "destino": "Netuno",
            "humor": "Sonolento",
            "numero_de_tentaculos": 4,
            "gasto_medio": 150
        }
    ]
    ```

9. Mostrar quem tem o **maior gasto_medio**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find().sort({gasto_medio: -1}).limit(1)
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab59"
            },
            "nome": "T’quinn",
            "planeta_origem": "Vortex-12",
            "especie": "Anfíbio Cósmico",
            "destino": "Terra",
            "humor": "Fascinado",
            "numero_de_tentaculos": 6,
            "gasto_medio": 400
        }
    ]
    ```

10. Ordenar registros por **destino** em ordem alfabética.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.alienigenas_turistas.find().sort({destino: 1})
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab58"
            },
            "nome": "Bliptor",
            "planeta_origem": "Kronix",
            "especie": "Ciborgue Etéreo",
            "destino": "Lua",
            "humor": "Empolgado",
            "numero_de_tentaculos": 2,
            "gasto_medio": 90
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab57"
            },
            "nome": "Xyra",
            "planeta_origem": "Glorptar",
            "especie": "Gelatina Sentiente",
            "destino": "Marte",
            "humor": "Curioso",
            "numero_de_tentaculos": 0,
            "gasto_medio": 180
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab5a"
            },
            "nome": "Moolah",
            "planeta_origem": "Zeltra",
            "especie": "Felino Galáctico",
            "destino": "Netuno",
            "humor": "Sonolento",
            "numero_de_tentaculos": 4,
            "gasto_medio": 150
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab56"
            },
            "nome": "Zlorg",
            "planeta_origem": "Nebulon-5",
            "especie": "Lumifero",
            "destino": "Saturno",
            "humor": "Animado",
            "numero_de_tentaculos": 4,
            "gasto_medio": 230
        },
        {
            "_id": {
            "$oid": "68f1750666e6f9763f98ab59"
            },
            "nome": "T’quinn",
            "planeta_origem": "Vortex-12",
            "especie": "Anfíbio Cósmico",
            "destino": "Terra",
            "humor": "Fascinado",
            "numero_de_tentaculos": 6,
            "gasto_medio": 400
        }
    ]
    ```

---

## 🚀 Collection: `naves_exploradoras`

### Registros

| nome            | modelo | comandante      | destino           | tripulantes | status        | autonomia_dias |
| --------------- | ------ | --------------- | ----------------- | ----------- | ------------- | -------------- |
| Estrela Veloz   | GX-900 | Capitã Luna     | Andrômeda         | 8           | Em missão     | 120            |
| Aurora Nebulosa | ZX-12  | Comandante Vork | Galáxia Sombria   | 5           | Em manutenção | 80             |
| Cometa Dourado  | TX-77  | Tenente Zog     | Saturno           | 12          | Em missão     | 150            |
| Eclipse Rubro   | RX-404 | Capitão Blork   | Buraco Negro Beta | 3           | Perdida       | 60             |
| Lótus Cósmica   | NX-222 | Dra. Kora       | Terra             | 10          | Em reparos    | 100            |

### Tarefas

11. Inserir registros na collection.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.insertMany([
        {nome: "Estrela Veloz", modelo: "GX-900", comandante: "Capitã Luna", destino: "Andrômeda", tripulantes: 8, status: "Em missão", autonomia_dias: 120},
        {nome: "Aurora Nebulosa", modelo: "ZX-12", comandante: "Comandante Vork", destino: "Galáxia Sombria", tripulantes: 5, status: "Em manutenção", autonomia_dias: 80},
        {nome: "Cometa Dourado", modelo: "TX-77", comandante: "Tenente Zog", destino: "Saturno", tripulantes: 12, status: "Em missão", autonomia_dias: 150},
        {nome: "Eclipse Rubro", modelo: "RX-404", comandante: "Capitão Blork", destino: "Buraco Negro Beta", tripulantes: 3, status: "Perdida", autonomia_dias: 60},
        {nome: "Lótus Cósmica", modelo: "NX-222", comandante: "Dra. Kora", destino: "Terra", tripulantes: 10, status: "Em reparos", autonomia_dias: 100},
    ])
    ```

    `Resposta:`

    ```js
    {
        "acknowledged": true,
        "insertedIds": {
            "0": {
            "$oid": "68f180a3816ae9f2dce2187e"
            },
            "1": {
            "$oid": "68f180a3816ae9f2dce2187f"
            },
            "2": {
            "$oid": "68f180a3816ae9f2dce21880"
            },
            "3": {
            "$oid": "68f180a3816ae9f2dce21881"
            },
            "4": {
            "$oid": "68f180a3816ae9f2dce21882"
            }
        }
    }
    ```

12. Consultar naves **em missão**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.find(
        {status: "Em missão"}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce2187e"
            },
            "nome": "Estrela Veloz",
            "modelo": "GX-900",
            "comandante": "Capitã Luna",
            "destino": "Andrômeda",
            "tripulantes": 8,
            "status": "Em missão",
            "autonomia_dias": 120
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce21880"
            },
            "nome": "Cometa Dourado",
            "modelo": "TX-77",
            "comandante": "Tenente Zog",
            "destino": "Saturno",
            "tripulantes": 12,
            "status": "Em missão",
            "autonomia_dias": 150
        }
    ]
    ```

13. Mostrar nomes e destinos com **autonomia > 100**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.find(
        {autonomia_dias: {$gt: 100}},
        {nome: 1, destino: 1}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce2187e"
            },
            "nome": "Estrela Veloz",
            "destino": "Andrômeda"
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce21880"
            },
            "nome": "Cometa Dourado",
            "destino": "Saturno"
        }
    ]
    ```

14. Atualizar **Eclipse Rubro** para status `'Resgatada'`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.updateOne(
        {nome: "Eclipse Rubro"},
        {$set: {status: 'Resgatada'}}
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

15. Aumentar **autonomia** da **Aurora Nebulosa** para **120**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.updateOne(
        {nome: "Aurora Nebulosa"},
        {$set: {autonomia_dias: 120}}
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

16. Ordenar naves por **tripulantes** (decrescente).

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.naves_exploradoras.find().sort({tripulantes: -1})
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce21880"
            },
            "nome": "Cometa Dourado",
            "modelo": "TX-77",
            "comandante": "Tenente Zog",
            "destino": "Saturno",
            "tripulantes": 12,
            "status": "Em missão",
            "autonomia_dias": 150
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce21882"
            },
            "nome": "Lótus Cósmica",
            "modelo": "NX-222",
            "comandante": "Dra. Kora",
            "destino": "Terra",
            "tripulantes": 10,
            "status": "Em reparos",
            "autonomia_dias": 100
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce2187e"
            },
            "nome": "Estrela Veloz",
            "modelo": "GX-900",
            "comandante": "Capitã Luna",
            "destino": "Andrômeda",
            "tripulantes": 8,
            "status": "Em missão",
            "autonomia_dias": 120
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce2187f"
            },
            "nome": "Aurora Nebulosa",
            "modelo": "ZX-12",
            "comandante": "Comandante Vork",
            "destino": "Galáxia Sombria",
            "tripulantes": 5,
            "status": "Em manutenção",
            "autonomia_dias": 120
        },
        {
            "_id": {
            "$oid": "68f180a3816ae9f2dce21881"
            },
            "nome": "Eclipse Rubro",
            "modelo": "RX-404",
            "comandante": "Capitão Blork",
            "destino": "Buraco Negro Beta",
            "tripulantes": 3,
            "status": "Resgatada",
            "autonomia_dias": 60
        }
    ]
    ```

---

## 🤖 Collection: `robos_de_exploracao`

### Registros

| codigo | modelo    | planeta_destino | status     | bateria | amostras_coletadas |
| ------ | --------- | --------------- | ---------- | ------- | ------------------ |
| RBX-01 | RoverMax  | Marte           | Ativo      | 87      | 45                 |
| ZY-22  | GeoProbe  | Europa          | Em reparo  | 43      | 22                 |
| ALN-7  | ScanBot   | Netuno          | Desativado | 0       | 60                 |
| GR-9   | DeepMiner | Vênus           | Ativo      | 65      | 38                 |
| PX-5   | Atmoscan  | Titã            | Ativo      | 91      | 52                 |

### Tarefas

17. Inserir registros.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.insertMany([
        {codigo: "RBX-01", modelo: "RoverMax", planeta_destino: "Marte", status: "Ativo", bateria: 87, amostras_coletadas: 45},
        {codigo: "ZY-22", modelo: "GeoProbe", planeta_destino: "Europa", status: "Em reparo", bateria: 43, amostras_coletadas: 22},
        {codigo: "ALN-7", modelo: "ScanBot", planeta_destino: "Netuno", status: "Desativado", bateria: 0, amostras_coletadas: 60},
        {codigo: "GR-9", modelo: "DeepMiner", planeta_destino: "Vênus", status: "Ativo", bateria: 65, amostras_coletadas: 38},
        {codigo: "PX-5", modelo: "Atmoscan", planeta_destino: "Titã", status: "Ativo", bateria: 91, amostras_coletadas: 52}
    ])
    ```

    `Resposta:`

    ```js
    {
        "acknowledged": true,
        "insertedIds": {
            "0": {
            "$oid": "68f18ad1a1ab874c91e5d782"
            },
            "1": {
            "$oid": "68f18ad1a1ab874c91e5d783"
            },
            "2": {
            "$oid": "68f18ad1a1ab874c91e5d784"
            },
            "3": {
            "$oid": "68f18ad1a1ab874c91e5d785"
            },
            "4": {
            "$oid": "68f18ad1a1ab874c91e5d786"
            }
        }
    }
    ```

18. Listar robôs **ativos**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.find(
        {status: "Ativo"}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d782"
            },
            "codigo": "RBX-01",
            "modelo": "RoverMax",
            "planeta_destino": "Marte",
            "status": "Ativo",
            "bateria": 87,
            "amostras_coletadas": 45
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d785"
            },
            "codigo": "GR-9",
            "modelo": "DeepMiner",
            "planeta_destino": "Vênus",
            "status": "Ativo",
            "bateria": 65,
            "amostras_coletadas": 38
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d786"
            },
            "codigo": "PX-5",
            "modelo": "Atmoscan",
            "planeta_destino": "Titã",
            "status": "Ativo",
            "bateria": 91,
            "amostras_coletadas": 52
        }
    ]
    ```

19. Exibir `codigo` e `bateria` com `amostras_coletadas > 40`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.find(
        {amostras_coletadas: {$gt: 40}},
        {codigo: 1, bateria: 1}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d782"
            },
            "codigo": "RBX-01",
            "bateria": 87
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d784"
            },
            "codigo": "ALN-7",
            "bateria": 0
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d786"
            },
            "codigo": "PX-5",
            "bateria": 91
        }
    ]
    ```

20. Atualizar **ZY-22** para `'Ativo'`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.updateOne(
        {codigo: "ZY-22"},
        {$set: {status: "Ativo"}}
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

21. Recarregar **ALN-7** (bateria = 100).

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.updateOne(
        {codigo: "ALN-7"},
        {$set: {bateria: 100}}
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

22. Ordenar por `amostras_coletadas` (decrescente).

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.robos_de_exploracao.find().sort({amostras_coletadas: -1})
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d784"
            },
            "codigo": "ALN-7",
            "modelo": "ScanBot",
            "planeta_destino": "Netuno",
            "status": "Desativado",
            "bateria": 100,
            "amostras_coletadas": 60
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d786"
            },
            "codigo": "PX-5",
            "modelo": "Atmoscan",
            "planeta_destino": "Titã",
            "status": "Ativo",
            "bateria": 91,
            "amostras_coletadas": 52
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d782"
            },
            "codigo": "RBX-01",
            "modelo": "RoverMax",
            "planeta_destino": "Marte",
            "status": "Ativo",
            "bateria": 87,
            "amostras_coletadas": 45
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d785"
            },
            "codigo": "GR-9",
            "modelo": "DeepMiner",
            "planeta_destino": "Vênus",
            "status": "Ativo",
            "bateria": 65,
            "amostras_coletadas": 38
        },
        {
            "_id": {
            "$oid": "68f18ad1a1ab874c91e5d783"
            },
            "codigo": "ZY-22",
            "modelo": "GeoProbe",
            "planeta_destino": "Europa",
            "status": "Ativo",
            "bateria": 43,
            "amostras_coletadas": 22
        }
    ]
    ```

---

## 🌍 Collection: `planetas_catalogados`

### Registros

| nome    | sistema   | tipo      | possui_vida | gravidade | temperatura_media |
| ------- | --------- | --------- | ----------- | --------- | ----------------- |
| Xyphos  | Helion    | Rochoso   | true        | 1.1       | 25                |
| Glacia  | Crion     | Gelado    | false       | 0.8       | -120              |
| Voltar  | Omega-3   | Vulcânico | false       | 2.3       | 460               |
| Aqualis | Serpentis | Oceânico  | true        | 1.0       | 18                |
| Drunor  | Velkar    | Gasoso    | false       | 0.5       | -60               |

### Tarefas

23. Inserir registros.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.insertMany([
        {nome: "Xyphos", sistema: "Helion", tipo: "Rochoso", possui_vida: true, gravidade: 1.1, temperatura_media: 25},
        {nome: "Glacia", sistema: "Crion", tipo: "Gelado", possui_vida: false, gravidade: 0.8, temperatura_media:  -120},
        {nome: "Voltar", sistema: "Omega-3", tipo: "Vulcânico", possui_vida: false, gravidade: 2.3, temperatura_media: 460},
        {nome: "Aqualis", sistema: "Serpentis", tipo: "Oceânico", possui_vida: true, gravidade: 1.0, temperatura_media: 18},
        {nome: "Drunor", sistema: "Velkar", tipo: "Gasoso", possui_vida: false, gravidade: 0.5, temperatura_media: -60}
    ])
    ```

    `Resposta:`

    ```js
    {
        "acknowledged": true,
        "insertedIds": {
            "0": {
            "$oid": "68f18d794b62db2d54c3fad3"
            },
            "1": {
            "$oid": "68f18d794b62db2d54c3fad4"
            },
            "2": {
            "$oid": "68f18d794b62db2d54c3fad5"
            },
            "3": {
            "$oid": "68f18d794b62db2d54c3fad6"
            },
            "4": {
            "$oid": "68f18d794b62db2d54c3fad7"
            }
        }
    }
    ```

24. Consultar planetas **habitáveis**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.find(
        {possui_vida: true}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad3"
            },
            "nome": "Xyphos",
            "sistema": "Helion",
            "tipo": "Rochoso",
            "possui_vida": true,
            "gravidade": 1.1,
            "temperatura_media": 25
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad6"
            },
            "nome": "Aqualis",
            "sistema": "Serpentis",
            "tipo": "Oceânico",
            "possui_vida": true,
            "gravidade": 1,
            "temperatura_media": 18
        }
    ]
    ```

25. Mostrar nomes e sistemas com `gravidade > 1.0`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.find(
        {gravidade: {$gt: 1.0}},
        {nome: 1, sistema: 1}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad3"
            },
            "nome": "Xyphos",
            "sistema": "Helion"
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad5"
            },
            "nome": "Voltar",
            "sistema": "Omega-3"
        }
    ]
    ```

26. Atualizar temperatura de **Voltar** para **390**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.updateOne(
        {nome: 'Voltar'},
        {$set: {temperatura_media: 390}}
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

27. Alterar `possui_vida` de **Aqualis** para **false**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.updateOne(
        {nome: 'Aqualis'},
        {$set: {possui_vida: false}}
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

28. Ordenar por `temperatura_media` (crescente).

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.planetas_catalogados.find().sort({temperatura_media: -1})
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad5"
            },
            "nome": "Voltar",
            "sistema": "Omega-3",
            "tipo": "Vulcânico",
            "possui_vida": false,
            "gravidade": 2.3,
            "temperatura_media": 390
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad3"
            },
            "nome": "Xyphos",
            "sistema": "Helion",
            "tipo": "Rochoso",
            "possui_vida": true,
            "gravidade": 1.1,
            "temperatura_media": 25
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad6"
            },
            "nome": "Aqualis",
            "sistema": "Serpentis",
            "tipo": "Oceânico",
            "possui_vida": false,
            "gravidade": 1,
            "temperatura_media": 18
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad7"
            },
            "nome": "Drunor",
            "sistema": "Velkar",
            "tipo": "Gasoso",
            "possui_vida": false,
            "gravidade": 0.5,
            "temperatura_media": -60
        },
        {
            "_id": {
            "$oid": "68f18d794b62db2d54c3fad4"
            },
            "nome": "Glacia",
            "sistema": "Crion",
            "tipo": "Gelado",
            "possui_vida": false,
            "gravidade": 0.8,
            "temperatura_media": -120
        }
    ]
    ```

---

## 🌌 Collection: `eventos_cosmicos`

### Registros

| nome_evento           | tipo               | localizacao      | intensidade | data_observacao | registrado_por |
| --------------------- | ------------------ | ---------------- | ----------- | --------------- | -------------- |
| Fúria Solar Alpha     | Tempestade Estelar | Sistema Helion   | Extrema     | 2125-06-12      | Dr. Zark       |
| Eclipse Quântico      | Eclipse            | Nebulosa Orion   | Alta        | 2126-01-28      | Dra. Mira      |
| Explosão Prisma Azul  | Supernova          | Galáxia Centauri | Média       | 2125-11-04      | Dr. Vorn       |
| Chuva de Cristais     | Meteoro            | Setor Z-88       | Baixa       | 2125-03-09      | Tenente Lira   |
| Buraco Branco Épsilon | Fenômeno Quântico  | Andrômeda        | Extrema     | 2124-09-22      | Dr. Krohn      |

### Tarefas

29. Inserir registros.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.insertMany([
        {nome_evento: "Fúria Solar Alpha", tipo: "Tempestade Estelar", localizacao: "Sistema Helion", intensidade: "Extrema", data_observacao: '2125-06-12', registrado_por: "Dr. Zark"},
        {nome_evento: "Eclipse Quântico", tipo: "Eclipse", localizacao: "Nebulosa Orion", intensidade: "Alta", data_observacao: '2126-01-28', registrado_por: "Dra. Mira"},
        {nome_evento: "Explosão Prisma Azul", tipo: "Supernova", localizacao: "Galáxia Centauri", intensidade: "Média", data_observacao: '2125-11-04', registrado_por: "Dr. Vorn"},
        {nome_evento: "Chuva de Cristais", tipo: "Meteoro", localizacao: "Setor Z-88", intensidade: "Baixa", data_observacao: '2125-03-09', registrado_por: "Tenente Lira"},
        {nome_evento: "Buraco Branco Épsilon", tipo: "Fenômeno Quântico", localizacao: "Andrômeda", intensidade: "Extrema", data_observacao: '2124-09-22', registrado_por: "Dr. Krohn"}
    ])
    ```

    `Resposta:`

    ```js
    {
        "acknowledged": true,
        "insertedIds": {
            "0": {
            "$oid": "68f191959382f57d72a043c9"
            },
            "1": {
            "$oid": "68f191959382f57d72a043ca"
            },
            "2": {
            "$oid": "68f191959382f57d72a043cb"
            },
            "3": {
            "$oid": "68f191959382f57d72a043cc"
            },
            "4": {
            "$oid": "68f191959382f57d72a043cd"
            }
        }
    }
    ```

30. Consultar eventos com **intensidade 'Extrema'**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.find(
        {intensidade: 'Extrema'}
    )
    ```

    `Resultado:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f191959382f57d72a043c9"
            },
            "nome_evento": "Fúria Solar Alpha",
            "tipo": "Tempestade Estelar",
            "localizacao": "Sistema Helion",
            "intensidade": "Extrema",
            "data_observacao": "2125-06-12",
            "registrado_por": "Dr. Zark"
        },
        {
            "_id": {
            "$oid": "68f191959382f57d72a043cd"
            },
            "nome_evento": "Buraco Branco Épsilon",
            "tipo": "Fenômeno Quântico",
            "localizacao": "Andrômeda",
            "intensidade": "Extrema",
            "data_observacao": "2124-09-22",
            "registrado_por": "Dr. Krohn"
        }
    ]
    ```

31. Mostrar `nome_evento` e `data_observacao` dos **eclipses**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.find(
        {tipo: "Eclipse"},
        {nome_evento: 1, data_observacao: 1}
    )
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f191959382f57d72a043ca"
            },
            "nome_evento": "Eclipse Quântico",
            "data_observacao": "2126-01-28"
        }
    ]
    ```


32. Atualizar **Chuva de Cristais** para intensidade `'Média'`.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.updateOne(
        {nome_evento: "Chuva de Cristais"},
        {$set: {intensidade: "Média"}}
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

33. Alterar `registrado_por` de **Buraco Branco Épsilon** para **Dra. Nyra**.

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.updateOne(
        {nome_evento: 'Buraco Branco Épsilon'},
        {$set: {registrado_por: 'Dra. Nyra'}}
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

34. Ordenar por `data_observacao` (**decrescente**).

    `Consulta:`

    ```js
    use("agencia_espacial")

    db.eventos_cosmicos.find().sort({data_observacao: -1})
    ```

    `Resposta:`

    ```js
    [
        {
            "_id": {
            "$oid": "68f191959382f57d72a043ca"
            },
            "nome_evento": "Eclipse Quântico",
            "tipo": "Eclipse",
            "localizacao": "Nebulosa Orion",
            "intensidade": "Alta",
            "data_observacao": "2126-01-28",
            "registrado_por": "Dra. Mira"
        },
        {
            "_id": {
            "$oid": "68f191959382f57d72a043cb"
            },
            "nome_evento": "Explosão Prisma Azul",
            "tipo": "Supernova",
            "localizacao": "Galáxia Centauri",
            "intensidade": "Média",
            "data_observacao": "2125-11-04",
            "registrado_por": "Dr. Vorn"
        },
        {
            "_id": {
            "$oid": "68f191959382f57d72a043c9"
            },
            "nome_evento": "Fúria Solar Alpha",
            "tipo": "Tempestade Estelar",
            "localizacao": "Sistema Helion",
            "intensidade": "Extrema",
            "data_observacao": "2125-06-12",
            "registrado_por": "Dr. Zark"
        },
        {
            "_id": {
            "$oid": "68f191959382f57d72a043cc"
            },
            "nome_evento": "Chuva de Cristais",
            "tipo": "Meteoro",
            "localizacao": "Setor Z-88",
            "intensidade": "Média",
            "data_observacao": "2125-03-09",
            "registrado_por": "Tenente Lira"
        },
        {
            "_id": {
            "$oid": "68f191959382f57d72a043cd"
            },
            "nome_evento": "Buraco Branco Épsilon",
            "tipo": "Fenômeno Quântico",
            "localizacao": "Andrômeda",
            "intensidade": "Extrema",
            "data_observacao": "2124-09-22",
            "registrado_por": "Dra. Nyra"
        }
    ]
    ```