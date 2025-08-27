/*
1. Faça um programa que leia do usuário uma temperatura em Fahrenheit, converta-a para
graus Celsius e escreva o novo valor na tela. A fórmula de conversão de Fahrenheit (F) para
Celsius é C = ( ( F - 32 ) * 5 ) / 9. Exemplo: 100 Fahrenheit = 37,77 Celsius.
*/

programa {
  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  funcao inicio() {
    inteiro fah
    escreva("Informe o valor em Fahrenheit para converter para Celcius\n")
    leia(fah)
    limpa()

    escreva("O valor de " + fah + "°F em Celcius é: " + fahParaCel(fah) + "°C.\n")
    
    fazerNovamente()
  }

  // Calculadora de Fahrenheit para Celcius
  funcao inteiro fahParaCel(inteiro fah) {
    retorne m.arredondar((( ( fah - 32 ) * 5 ) / 9), 1)
  }

  // Pergunta se quer fazer novamente
  funcao fazerNovamente() {
    caracter repetir = 'n'
    escreva("Deseja fazer outro calculo? S/N?\n")
    leia(repetir)

    se(t.caixa_baixa(repetir) == 's') {
      limpa()
      inicio()
    }
  }
}