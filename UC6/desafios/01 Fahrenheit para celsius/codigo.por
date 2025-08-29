/*
  1. Faça um programa que leia do usuário uma temperatura em Fahrenheit, converta-a para
  graus Celsius e escreva o novo valor na tela. A fórmula de conversão de Fahrenheit (F) para
  Celsius é C = ( ( F - 32 ) * 5 ) / 9. Exemplo: 100 Fahrenheit = 37,77 Celsius.
*/

programa {
  
  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  funcao inicio() {

    real fah, celsius

    escreva("Informe o valor em Fahrenheit para converter para Celsius\n")
    leia(fah)

    celsius = m.arredondar(((( fah - 32 ) * 5 ) / 9), 2)

    limpa()
    escreva("O valor de ", fah, "°F em Celsius é: ", celsius, "°C.\n")
    
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
