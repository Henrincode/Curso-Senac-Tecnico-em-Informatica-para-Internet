async function produtos() {
  const response = await fetch("/data/produtos.json");
  const dados = await response.json();

  const produtosLista = document.querySelector("#produtos-lista");
  produtosLista.innerHTML = ""

  dados.forEach(produto => (produtosLista.innerHTML += 
    `<div class="produto">
    <img src="/img/cardapio/${produto.img}">
    <div class="idp">#${produto.id}</div>
    </div>`));
}

produtos()