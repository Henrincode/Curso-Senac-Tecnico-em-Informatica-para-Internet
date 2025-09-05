/*
  9. O Sr. Manoel Joaquim acaba de adquirir uma panificadora e pretende implantar
  a metodologia da tabelinha, que já é um sucesso na sua loja de 1,99. Você foi
  contratado para desenvolver o programa que monta a tabela de preços de pães,
  de 1 até 50 pães, a partir do preço do pão informado pelo usuário,
  conforme o exemplo abaixo:

  Preço do pão: R$ 0.18.

  Panificadora Pão de Ontem - Tabela de preços:

  1 - R$ 0.18
  2 - R$ 0.36
  ...
  50 - R$ 9.00
*/

programa {

  inclua biblioteca Matematica --> m
  
  real PRECO = 0.18

  funcao inicio() {

    escreva("====================\n")
    escreva("TABELA DE PREÇOS\n")
    escreva("====================\n")

    para(inteiro i = 1; i <= 50; i++){
      se(i < 10) {
        escreva("0", i, " - R$", m.arredondar(PRECO * i, 2), "\n")
      } senao {
        escreva(i, " - R$", m.arredondar(PRECO * i, 2), "\n")
      }
    }
  }
}
