/*

*/

programa {

  funcao inicio() {

    reiniciar()
  }

  // Reiniciar o programa ou fechar
  funcao reiniciar() {
    caracter repetir

    escreva("\nFazer novo calculo, s/n? \n")
    leia(repetir)

    se(repetir == 's') {
      limpa()
      inicio()
    }
    limpa()
  }
}
