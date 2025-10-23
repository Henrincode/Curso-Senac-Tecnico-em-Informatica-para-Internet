// config

const nomeSite = "TradeMinio"

// seletores

const nomeSiteElementos = document.querySelectorAll('.nomeSite')

nomeSiteElementos.forEach(elemento => {
    elemento.textContent = nomeSite
})