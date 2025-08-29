/*
  6. Implemente um código para aprovar empréstimo bancário. O código deve pedir 3
  informações: valor do empréstimo, número de parcelas e salário do solicitante. Aprovar
  empréstimo caso o valor das parcelas representem no máximo 30% do salário do solicitante.
*/

programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  funcao inicio() {

    real emprestimo, parcelas, salario

    escreva("Informe o valor do empréstimo:\n")
    leia(emprestimo)

    limpa()
    escreva("Informe o número de parcelas:\n")
    leia(parcelas)
    
    limpa()
    escreva("Informe seu salário:\n")
    leia(salario)

    se ((salario * 0.3) >= (emprestimo / parcelas)) {
      limpa()
      escreva("Parabéns, seu empréstimo foi aprovado!\n")
      escreva("Valor das parcelas: R$", m.arredondar(emprestimo / parcelas, 2), "\n")
    } senao {
      limpa()
      escreva("Negado! O valor das parcelas são de R$", m.arredondar(emprestimo / parcelas, 2), "\n")
      escreva("O valor máximo das parcelas para aprovação devem ser de R$", m.arredondar(salario * 0.3, 2), "\n")
    }

    reiniciar()
  }

  // Reiniciar o programa ou fechar
  funcao reiniciar() {
    caracter repetir

    escreva("\nFazer novo calculo, s/n? \n")
    leia(repetir)

    se(t.caixa_baixa(repetir) == 's') {
      limpa()
      inicio()
    }
    limpa()
  }
}
