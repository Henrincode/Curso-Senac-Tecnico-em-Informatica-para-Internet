produtos = [{
    id: 1001,
    descricao: "Calça jeans feminina flare e skinny lycra justa cos alto justa",
    preco: 145.99,
    precoAntigo: 199.99,
    categorias: ["Feminino", "Calça", "Azul"],
    imagem: "calcas/001.webp"
},{
    id: 1002,
    descricao: "Calça Cargo Jeans feminina Grafite Super tendencia Larga Bolso Na Lateral Cintura Alta",
    preco: 74.80,
    precoAntigo: 109.91,
    categorias: ["Feminino", "Calça", "Azul"],
    imagem: "calcas/002.webp"
},{
    id: 1003,
    descricao: "Vestido Curto Casual Feminino com Colarinho Assimétrico, Manga Farol",
    preco: 137.96,
    precoAntigo: 183.95,
    categorias: ["Feminino", "Vestido", "Vermelho"],
    imagem: "vestidos/001.webp"
},{
    id: 1004,
    descricao: "Jaqueta Feminina Scuba Tecido Suede moda inverno",
    preco: 65.90,
    precoAntigo: 0,
    categorias: ["Feminino", "Jaqueta", "Marrom"],
    imagem: "jaquetas/001.webp"
},{
    id: 1005,
    descricao: "Coturno Feminino Bota Tratorada Preto bota preta confortável",
    preco: 59.90,
    precoAntigo: 149.90,
    categorias: ["Feminino", "bota", "preto"],
    imagem: "sapatos/001.webp"
},{
    id: 1006,
    descricao: "Bota Coturno Adventure Cano Curto Masculino Motoqueiro",
    preco: 104.90,
    precoAntigo: 0,
    categorias: ["Masculino", "bota", "marrom"],
    imagem: "sapatos/002.webp"
}]

// Funções

function listarProdutos(filtro = "tudo") {
    const localInject = document.querySelector("#lista-produtos")

    localInject.innerHTML = ""
    if(filtro == "tudo") {
        produtos.forEach(produto => localInject.innerHTML += `
            <a href="/produto/${produto.id}">
            <div class="produto">
                <div class="imagem-texto">
                    <img src="img/produtos/${produto.imagem}" alt="">
                    <p class="texto">${produto.descricao}</p>
                </div>
                <p class="preco-texto">
                    <span class="preco-riscado">${produto.precoAntigo ? "R$ "+ produto.precoAntigo.toFixed(2).replace(".",",") : ""}</span>
                    <span class="preco">R$ ${produto.preco.toFixed(2).replace(".",",")}</span>
                </p>
            </div>
            </a>
            `)
    }

}

listarProdutos()