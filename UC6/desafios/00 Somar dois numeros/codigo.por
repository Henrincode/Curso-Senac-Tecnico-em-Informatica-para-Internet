programa {

  inclua biblioteca Texto --> t
  funcao inicio() {
    inteiro n1, n2, total

    escreva("Informe um número:\n")
    leia(n1)

    limpa()
    escreva("Informe outro número:\n")
    leia(n2)

    total = n1 + n2

    limpa()
    escreva("O resultado da soma dos dois números é: ", total, "\n")

    reiniciar()
  }
  
  // Reiniciar o programa ou fechar
  funcao reiniciar() {

    caracter repetir = 'n'
    
    escreva("\nDeseja fazer outro calculo? S/N?\n")
    leia(repetir)

    se(t.caixa_baixa(repetir) == 's') {
      limpa()
      inicio()
    }
    limpa()
  }
}
