programa {
  inclua biblioteca Texto --> te
  inclua biblioteca Tipos --> ti
  funcao inicio() {
    inteiro input, preco[100], soma = 0, contador = 0, listar = 0

    titulo()

    enquanto(input != 0) {
        escreva("Preco do produto ", contador + 1, ": R$")
        leia(input)
      se(input != 0){
        limpa()
        titulo()
        preco[contador] = input
        soma += preco[contador]
        contador++
      }
    }

    limpa()
    titulo()
    enquanto(listar < contador){
      escreva("Produto 0", listar + 1, ": R$", preco[listar], "\n")
      listar++
    }

    // limpa()
    escreva("Soma = R$", soma, "\n")

    repetir()
  }

  funcao titulo() {
    escreva("====================\n")
    escreva("LOJAS TABAJARA\n")
    escreva("====================\n")
  }

  funcao repetir() {
    caracter repete

    escreva("\nDeseja fazer um novo calculo? S/N\n")
    leia(repete)

    se(te.caixa_baixa(repete) == 's') {
      limpa()
      inicio()
    }
  }
}
