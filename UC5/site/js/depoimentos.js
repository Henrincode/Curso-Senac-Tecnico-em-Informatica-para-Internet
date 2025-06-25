carregarDepoimentos()

async function carregarDepoimentos() {
    const response = await fetch("/data/depoimentos.json")
    const dados = await response.json()
    const lista = document.querySelector("#depoimentos-lista")

    lista.innerHTML = ""
    dados.forEach(depoimento => lista.innerHTML += `
        <div class="depoimento">
            <img src="/img/depoimentos/${depoimento.img}" alt="" />
            <h3>${depoimento.nome}</h3>
            <p>
                ${depoimento.texto}
            </p>
        </div>`)
}