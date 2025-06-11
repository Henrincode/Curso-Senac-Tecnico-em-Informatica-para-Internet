// const produtos = [
//   {
//     id: 1001,
//     nome: "Bolo de Aniversário",
//     categorias: ["Bolo", "Aniversário"],
//     capa: "bolo/bolo-001.jpg"
//   },
//   {
//     id: 1002,
//     descricao: "Bolo especial KitKat",
//     categorias: ["Bolo", "Aniversário", "Adulto"],
//     capa: "img/foto2"
//   },
// ];

// aprender sobre status code http
// https://www.httpstatus.com.br/

const categorias = [
  {
    id: 1001,
    nome: "Bolos de Aniversário",
    capa: "misc/bolo-001",
  },{
    id: 1002,
    nome: "Bolos Infantis",
    capa: "/misc/bolo-004",
  },{
    id: 1003,
    nome: "Docinhos de Festa",
    capa: "/misc/docefesta-001.jpg"
  },{
    id: 1004,
    nome: "Bolos Tradicionais",
    capa: "/misc/bolo-002.jpg"
  },{
    id: 1005,
    nome: "Panificação",
    capa: "/misc/pao-001.jpg"
  },{
    id: 1006,
    nome: "Sobremesas",
    capa: "/misc/sobremesa-001"
  },{
    id: 1007,
    nome: "Bolos de Travessa",
    capa: "/misc/bolo-003.jpg"
  },{
    id: 1008,
    nome: "Pavês",
    capa: "/misc/pave-001.jpg"
  }
];

const teste = categorias.forEach(categoria => {
    
    const capa = produtos.find(produto => produto.id === categoria.capa).capa

    console.log(`
    div nome: ${categoria.nome}
    div img: ${capa}
    `)})
