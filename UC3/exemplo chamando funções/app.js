function fnMudar() {
    document.getElementById("titulo").innerHTML = "<em>Xavier, Guto</em>"
    document.getElementById("profissao").innerHTML = "Professor"
    document.getElementById("titulo").style.color = "red"
    document.getElementById("profissao").style.color = "red"

}

function fnModoDark() {
    document.querySelector("body").style.background = "black"
    document.querySelector("body").style.color = "white"
}
function fnModoLight() {
    document.querySelector("body").style.background = "white"
    document.querySelector("body").style.color = "black"
}

function fnCarnaval() {
    document.querySelector("body").style.background = " #833AB4"
    document.querySelector("body").style.background = "linear-gradient(to right, red,orange,yellow,green,blue,indigo,violet)"
    document.querySelector("body").style.color = "white"

}

let fotosBanner = ['01.jpg', '02.jpg', '03.jpg']

function fnBanner(bannerEscolhido) {
    document.querySelector("#banner").src = fotosBanner[bannerEscolhido]

}