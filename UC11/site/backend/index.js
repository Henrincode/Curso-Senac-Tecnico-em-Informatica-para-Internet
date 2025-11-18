import express from 'express'

const app = express()
app.use(express.json())

const nomes = []

app.post('/', (req, res) => {
  if (!req.body) return res.send('sem body')
  const {nome} = req.body

  // Validação básica
  if (!nome || typeof nome !== 'string' || !nome.trim()) {
    return res.status(400).json({ erro: 'Nome inválido ou ausente.' })
  }

  nomes.push(nome.trim());
  res.status(201).json({ mensagem: 'Nome adicionado com sucesso!', nomes })
})

app.get('/', (req, resp) => {
    resp.send('Olá mundo!')
})

app.listen(3000)