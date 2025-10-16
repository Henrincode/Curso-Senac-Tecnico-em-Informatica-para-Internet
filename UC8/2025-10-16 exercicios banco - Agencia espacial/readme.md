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



6. Aumentar `gasto_medio` de **T’quinn** para **400**.
7. Atualizar `numero_de_tentaculos` de **Moolah** para **4**.
8. Exibir alienígenas com **4 ou mais tentáculos**.
9. Mostrar quem tem o **maior gasto_medio**.
10. Ordenar registros por **destino** em ordem alfabética.

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
12. Consultar naves **em missão**.
13. Mostrar nomes e destinos com **autonomia > 100**.
14. Atualizar **Eclipse Rubro** para status `'Resgatada'`.
15. Aumentar **autonomia** da **Aurora Nebulosa** para **120**.
16. Ordenar naves por **tripulantes** (decrescente).

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
18. Listar robôs **ativos**.
19. Exibir `codigo` e `bateria` com `amostras_coletadas > 40`.
20. Atualizar **ZY-22** para `'Ativo'`.
21. Recarregar **ALN-7** (bateria = 100).
22. Ordenar por `amostras_coletadas` (decrescente).

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
24. Consultar planetas **habitáveis**.
25. Mostrar nomes e sistemas com `gravidade > 1.0`.
26. Atualizar temperatura de **Voltar** para **390**.
27. Alterar `possui_vida` de **Aqualis** para **false**.
28. Ordenar por `temperatura_media` (crescente).

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
30. Consultar eventos com **intensidade 'Extrema'**.
31. Mostrar `nome_evento` e `data_observacao` dos **eclipses**.
32. Atualizar **Chuva de Cristais** para intensidade `'Média'`.
33. Alterar `registrado_por` de **Buraco Branco Épsilon** para **Dra. Nyra**.
34. Ordenar por `data_observacao` (**decrescente**).