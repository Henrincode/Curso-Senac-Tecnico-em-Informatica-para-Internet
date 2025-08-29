/*
  7. Construa um programa que leia o código de um determinado
  produto e mostre a sua classificação.

  Código Classificação
  1 - Alimento não-perecível
  2, 3 ou 4 - Alimento perecível
  5 ou 6 - Vestuário
  7 - Higiene pessoal
  8, 9, 10 - Utensílios domésticos
  Qualquer outro código Inválido
*/

programa {

  inclua biblioteca Texto --> t

  funcao inicio() {

    inteiro numero

    escreva("Informe o código de classificação\n")
    leia(numero)

    escolha(numero) {  
      
      caso 1:  
        limpa()
        escreva("Alimento não-perecível\n") 
      pare  
    
      caso 2: caso 3: caso 4:  
        limpa()
        escreva("Alimento perecível\n")
      pare  
        
      caso 5: caso 6:  
        limpa()
        escreva("Vestuário\n")
      pare  

      caso 7:  
        limpa()
        escreva("Higiene pessoal\n")
      pare  

      caso 8: caso 9: caso 10:  
        limpa()
        escreva("Utensílios domésticos\n")
      pare  
        
      caso contrario:  
        limpa()
        escreva("Código Inválido\n")
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
