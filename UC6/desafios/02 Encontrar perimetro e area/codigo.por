/*
  2. Escreva um programa que pede o raio de um círculo, e em seguida exiba o perímetro e área
  do círculo. Para saber o valor do pi, use a biblioteca Matematica e função Matematica.PI
*/

/*
Perímetro = 2 * PI * raio
Área = PI * raio^2
*/

programa {

  inclua biblioteca Matematica --> mat
  
  const real PI = mat.PI

  funcao inicio() {
    caracter repetir
    real raio, perimetro, area

    escreva("Informe o raio para saber perímetro e área\n")
    leia(raio)

    perimetro = mat.arredondar(2 * PI * raio, 2)
    area = mat.arredondar(PI * mat.potencia(raio, 2), 2)

    limpa()
    escreva("Você informou um raio de " + raio + " portanto:\n")
    escreva("Perímetro: " + perimetro + "\n")
    escreva("Área: " + area + "\n")

    reiniciar()
  }

  // Reiniciar o programa ou fechar
  funcao reiniciar() {
    caracter repetir

    escreva("\nGostaria de fazer outro cálculo, s/n? \n")
    leia(repetir)

    se(repetir == 's') {
      limpa()
      inicio()
    }

    limpa()
  }
}
