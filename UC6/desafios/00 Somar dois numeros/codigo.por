programa {
  funcao inicio() {
    inteiro n1, n2, total

    escreva("Informe um número:\n")
    leia(n1)

    limpa()
    escreva("Informe outro número:\n")
    leia(n2)

    total = n1 + n2

    limpa()
    escreva("O resultado da soma dos dois números é: " + total + "\n")

    reiniciar()
  }
  
  // Reiniciar o programa ou fechar
  funcao reiniciar() {
    caracter repetir

    escreva("\nGostaria de fazer outra soma, s/n? \n")
    leia(repetir)

    se(repetir == 's') {
      limpa()
      inicio()
    }
    limpa()
  }
}
