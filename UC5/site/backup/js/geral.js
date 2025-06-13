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
    capa: "/misc/bolo-001.jpg",
  },{
    id: 1002,
    nome: "Bolos Infantis",
    capa: "/misc/bolo-004.jpg",
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
    capa: "/misc/sobremesa-001.jpg"
  },{
    id: 1007,
    nome: "Bolos de Travessa",
    capa: "/misc/bolo-003.jpg"
  },{
    id: 1008,
    nome: "Pavês",
    capa: "/misc/pave-001.jpg"
  },{
    id: 1009,
    nome: "Panetones e Choc...",
    capa: "/misc/panetone-001.jpg"
  },{
    id: 1010,
    nome: "Ovos de Páscoa",
    capa: "/misc/pascoa-001.jpg"
  }
];

const listaCategorias = document.querySelector("#lista")

categorias.forEach(categoria => {
  listaCategorias.innerHTML += `
    <div class="categoria">
        <div class="imagem">
            <img src="/img${categoria.capa}" alt="">
        </div>
        <h2 class="titulo">${categoria.nome}</h2>
    </div>
  `
})
