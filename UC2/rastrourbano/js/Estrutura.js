// Barra navegação
const navegacao = document.querySelector("#barra-navegacao");

navegacao.innerHTML = `
    <div class="logo">Rastro Urbano</div>
    <input class="busca" type="text" placeholder="🔍 Buscar...">
    <ul>
        <li>
            <i class="bi bi-house"></i>
            Home
        </li>
        <li>
            <i class="bi bi-gem"></i>
            Produtos
        </li>
        <li>
            <i class="bi bi-basket"></i>
            Carrinho
        </li>
        <a href="./conta">
            <li>
                <i class="bi bi-person-circle"></i>
                Conta
            </li>
        </a>
    </ul>
`