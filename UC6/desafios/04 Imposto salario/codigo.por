/*
  4. Faça um Programa que pergunte quanto você ganha por hora e o número de horas
  trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês, sabendo-se que
  são descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato.
  Faça um programa que nos dê:
  salário bruto.
  quanto pagou ao INSS.
  quanto pagou ao sindicato.
  o salário líquido.

  calcule os descontos e o salário líquido, conforme a tabela abaixo:
  + Salário Bruto : R$
  - IR (11%) : R$
  - INSS (8%) : R$
  - Sindicato ( 5%) : R$
  = Salário Liquido : R$
*/

programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  const inteiro IR = 11, INSS = 8, SINDICATO = 5, TOTAL = IR + INSS + SINDICATO

  funcao inicio() {
    real bruto, liquido, nIR, nINSS, nSindicato, somaImpostos

    escreva("Informe seu salário bruto para calcular os inpostos\n")
    leia(bruto)

    nIR = m.arredondar(bruto * (IR / 100), 2)
    nINSS = m.arredondar(bruto * (INSS / 100), 2)
    nSindicato = m.arredondar(bruto * (SINDICATO / 100), 2)

    somaImpostos = nIR + nINSS + nSindicato
    liquido = bruto - nIR - nINSS - nSindicato

    limpa()
    escreva("----------------------------------\n")
    escreva("TABELA DE DESCONTOS:\n")
    escreva("----------------------------------\n")
    escreva("Salário bruto: ........... R$", bruto, "\n")
    escreva("----------------------------------\n")
    escreva("-Imposto IR ", IR, "%: ......... R$", nIR, "\n")
    escreva("-Imposto INSS ", INSS, "%: ........ R$", nINSS, "\n")
    escreva("-Imposto Sindicato ", SINDICATO, "%: ... R$", nSindicato, "\n")
    escreva("-Soma dos impostos ", TOTAL, "%: .. R$", somaImpostos, "\n")
    escreva("----------------------------------\n")
    escreva("Salário líquido: ......... R$", liquido, "\n")
    escreva("----------------------------------\n")
    
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
