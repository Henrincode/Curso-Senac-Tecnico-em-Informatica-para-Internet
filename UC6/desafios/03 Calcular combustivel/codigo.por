/*
  3. Um novo modelo de carro, super econômico foi lançado. Ele faz 20 km com 1 litro de
  combustível. Cada litro de combustível custa R$ 5,00. Faça um programa que pergunte ao
  usuário quanto de dinheiro ele tem e em seguida diga quantos litros de combustível ele pode
  comprar e quantos kilometros o carro consegue andar com este tanto de combustível.
*/

programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t
  
  const real AUTONOMIA = 20, PRECO = 5

  funcao inicio() {

    real dinheiro, abastecido, distancia

    escreva("Quanto de dinheiro você tem para abastecer?\n")
    leia(dinheiro)

    dinheiro   = m.arredondar(dinheiro, 2)
    abastecido = m.arredondar(dinheiro / PRECO, 2)
    distancia  = m.arredondar(abastecido * AUTONOMIA, 2)
    
    limpa()
    escreva("Com o combustível à R$" + PRECO + " e abastecendo R$" + dinheiro + ", você compra "
    + abastecido + " litros \ne tem uma autonomia de " + distancia + "km com o novo carro!\n")

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
