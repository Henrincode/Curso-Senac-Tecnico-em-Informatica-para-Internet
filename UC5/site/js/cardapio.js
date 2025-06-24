const produtos = [];
const categorias = [];

carregarProdutos()

async function carregarProdutos() {
  // Carregar produtos
  const responseProdutos = await fetch("/data/produtos.json");
  const dadosProdutos = await responseProdutos.json();
  produtos.push(...dadosProdutos);

  // Carregar categorias
  const responseCategorias = await fetch("/data/categorias.json");
  const dadosCategorias = await responseCategorias.json();
  categorias.push(...dadosCategorias);

  // Renderizar produtos
  const produtosLista = document.querySelector("#produtos-lista");
  produtosLista.innerHTML = "";

  produtos.forEach(produto => {
    
    const categoria = charMax(nomeCategoria(produto.categoria), 15)

    produtosLista.innerHTML += `
      <div class="produto">
        <img src="/img/cardapio/${produto.img}">
        <div class="idp">#${produto.id}</div>
        <div class="idp">${categoria}</div>
      </div>`;
  });
}

function nomeCategoria(id) {
  return categorias.find(categoria => categoria.id === id).nome
}

function charMax(string, max) {
  if (string.length > max) {
    return `${string.slice(0, max)}...`;
  }
  return string;
}