import express from 'express'

const app = express()
app.use(express.json())

// usuario logado?
app.get('/vizinhoz/logado', (req, res) => {
  // ...
})

// carregar registros da home
app.get('/vizinhoz', (req, res) => {
  // ...
}
)

// carregar registros da categoria
app.get('/vizinhoz/:cat', (req, res) => {
  // ...
})

// carregar registros filtrados
app.get('/vizinhoz/filtro', (req, res) => {
  // ...
})

app.listen(3000)