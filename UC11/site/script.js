// config

const nomeSite = "VIZINHOZ"

// seletores

const nomeSiteElementos = document.querySelectorAll('.nomeSite')

nomeSiteElementos.forEach(elemento => {
    elemento.textContent = nomeSite
})