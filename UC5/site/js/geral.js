const produtos = [
  {
    id: 1001,
    nome: "Bolo de aniversário MineCraft",
    categorias: ["Bolo", "Aniversário", "Criança", "Temático", "MineCraft"],
    capa: "img/foto1"
  },
  {
    id: 1002,
    descricao: "Bolo especial KitKat",
    categorias: ["Bolo", "Aniversário", "Adulto"],
    capa: "img/foto2"
  },
];

const categorias = [
  {
    id: 1001,
    nome: "Bolo",
    capa: 1002,
  },{
    id: 1002,
    nome: "Bolo Aniversário",
    capa: 1001,
  }
];

const teste = categorias.forEach(categoria => {
    
    const capa = produtos.find(produto => produto.id === categoria.capa).capa

    console.log(`
    div nome: ${categoria.nome}
    div img: ${capa}
    `)})
