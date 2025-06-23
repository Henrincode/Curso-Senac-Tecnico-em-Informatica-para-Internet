const produtos = []

carregarProdutos()

async function carregarProdutos() {
  const response = await fetch("/data/produtos.json");
  const dados = await response.json();

  produtos.push(...dados)

  const produtosLista = document.querySelector("#produtos-lista");
  produtosLista.innerHTML = ""

  produtos.forEach(produto => (produtosLista.innerHTML += 
    `<div class="produto">
    <img src="/img/cardapio/${produto.img}">
    <div class="idp">#${produto.id}</div>
    <div class="idp">#${produto.id}</div>
    </div>`));
}

function categoria(id) {

}