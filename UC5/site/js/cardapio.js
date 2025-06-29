const produtos = [];
const categorias = [];

carregarProdutos()

async function carregarProdutos() {
  // Carregar produtos
  const responseProdutos = await fetch("../data/produtos.json");
  const dadosProdutos = await responseProdutos.json();
  produtos.push(...dadosProdutos);

  // Carregar categorias
  const responseCategorias = await fetch("../data/categorias.json");
  const dadosCategorias = await responseCategorias.json();
  categorias.push(...dadosCategorias);

  // Renderizar produtos
  const produtosLista = document.querySelector("#produtos-lista");
  produtosLista.innerHTML = "";

  produtos.forEach(produto => {
    
    // Pega o nome da categoria através da ID da mesma
    const categoria = charMax(nomeCategoria(produto.categoria), 15)

    produtosLista.innerHTML += `
      <div class="produto">
        <img src="../img/cardapio/${produto.img}">
        <div class="idp">#${produto.id}</div>
        <div class="categoria">${categoria}</div>
      </div>`;
  });
}

// Pega a ID da categoria e retorna seu nome
function nomeCategoria(id) {
  return categorias.find(categoria => categoria.id === id).nome
}

// Reduz o tamanho da string maior que max
function charMax(string, max, txt = "...") {
  if (string.length > max) {
    return `${string.slice(0, max) + txt}`;
  }
  return string;
}