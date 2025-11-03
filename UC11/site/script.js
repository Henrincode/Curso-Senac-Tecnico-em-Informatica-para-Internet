// config

const nomeSite = "condominiOZ"

// seletores

const nomeSiteElementos = document.querySelectorAll('.nomeSite')

nomeSiteElementos.forEach(elemento => {
    elemento.textContent = nomeSite
})