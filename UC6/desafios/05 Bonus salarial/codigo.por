/*
A empresa XKW concedeu um bônus de 20% do valor do salário a todos os funcionários com
tempo de trabalho na empresa igual ou superior a 5 anos e de 10% aos demais. Faça um
programa que receba o salário e o tempo de serviço de um funcionário, calcule e mostre o
valor do bônus recebido por ele.
*/

programa {

  inclua biblioteca Matematica --> mat

  funcao inicio() {

    real salario, anos, bonus

    // 20% para mais de 5 anos
    // 10% para os demais

    escreva("Informe o salário atuao do funcionário\n")
    leia(salario)

    limpa()
    escreva("Informe o tempo de serviço do funcionário em anos\n")
    leia(anos)

    se (anos >= 5) {
      bonus = mat.arredondar(salario * 0.2, 2)
      salario += bonus

      limpa()
      escreva("Como o funcionário tem mais de 5 anos ele recebe um bônus de 20%\n")
      escreva("Valor do bônus: R$", bonus, "\n")
      escreva("Novo salário com bônus: R$", salario, "\n")

    } senao {
      bonus = mat.arredondar(salario * 0.1, 2)
      salario += bonus

      escreva("Como o funcionário tem menos de 5 anos ele recebe um bônus de 10%\n")
      escreva("Valor do bônus: R$", bonus, "\n")
      escreva("Novo salário com bônus: R$", salario, "\n")
    }

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
