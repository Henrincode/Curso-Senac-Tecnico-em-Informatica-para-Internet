/*
  9. O Sr. Manoel Joaquim possui uma grande loja de artigos de R$ 1,99, com cerca de 10 caixas.
  Para agilizar o cálculo de quanto cada cliente deve pagar ele desenvolveu uma tabela que
  contém o número de itens que o cliente comprou e ao lado o valor da conta. Desta forma a
  atendente do caixa precisa apenas contar quantos itens o cliente está levando e olhar na tabela
  de preços. Você foi contratado para desenvolver o programa que monta esta tabela de preços,
  que conterá os preços de 1 até 50 produtos, conforme o exemplo abaixo:
  Lojas Quase Dois - Tabela de preços
  1 - R$ 1.99
  2 - R$ 3.98
  ...
  50 - R$ 99.50
*/

programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  real PRECO = 0.18

  funcao inicio() {

    inteiro quantidade, total

    escreva("Informe a quantidade total dos produtos:\n")
    leia(quantidade)

    total = m.arredondar(quantidade * PRECO, 2)

    limpa()
    escreva("O cliente deverá pagar R$", total, " em ", quantidade, " pão/es.\n")

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
