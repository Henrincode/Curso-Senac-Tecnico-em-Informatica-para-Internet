# 9 Desafios de Algoritmos

### **Nome:** Henrique AR Marques <br /> **Curso:** Técnico em Informática para Internet <br /> **Instituição:** SENAC Americana - SP <br /> **Data:** 30/08/2025 <br /> **UC:** 06

Nessas páginas você encontrará as soluções de 9 desafios que o professor me propôs: primeiro desenhei os fluxogramas no Figma para planejar a lógica e, em seguida, converti cada solução para Portugol. A proposta é mostrar como penso e resolvo problemas — do esboço visual à implementação — com um layout pronto para GitHub e para impressão.

## Desafio 01

Faça um programa que leia do usuário uma temperatura em Fahrenheit, converta-a para graus Celsius e escreva o novo valor na tela. A fórmula de conversão de Fahrenheit (F) para Celsius é C = ( ( F - 32 ) * 5 ) / 9. Exemplo: 100 Fahrenheit = 37,77 Celsius.

---

- ### Fluxograma:

![alt text](<01 Fahrenheit para celsius/fluxograma.png>)

---

- ### Código:

```javascript
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
```

---

## Desafio 02

Escreva um programa que pede o raio de um círculo, e em seguida exiba o perímetro e área do círculo. Para saber o valor do pi, use a biblioteca Matematica e função Matematica.PI

---

- ### Fluxograma

![alt text](<02 Encontrar perimetro e area/fluxograma.png>)

---

- ### Código:

```javascript
programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t
  
  const real PI = m.PI

  funcao inicio() {
    real raio, perimetro, area

    escreva("Informe o raio para saber perímetro e área\n")
    leia(raio)

    perimetro = m.arredondar(2 * PI * raio, 2)
    area = m.arredondar(PI * m.potencia(raio, 2), 2)

    limpa()
    escreva("Você informou um raio de ", raio, " portanto:\n")
    escreva("Perímetro: ", perimetro, "\n")
    escreva("Área: ", area, "\n")

    reiniciar()
  }

  // Reiniciar o programa ou fechar
  funcao reiniciar() {
    caracter repetir

    escreva("\nGostaria de fazer outro cálculo, s/n? \n")
    leia(repetir)

    se(t.caixa_baixa(repetir) == 's') {
      limpa()
      inicio()
    }

    limpa()
  }
}
```

---

## Desafio 03

Um novo modelo de carro, super econômico foi lançado. Ele faz 20 km com 1 litro de combustível. Cada litro de combustível custa R$ 5,00. Faça um programa que pergunte ao usuário quanto de dinheiro ele tem e em seguida diga quantos litros de combustível ele pode comprar e quantos kilometros o carro consegue andar com este tanto de combustível.

---

- ### Fluxograma:

![alt text](<03 Calcular combustivel/fluxograma.png>)

---

- ### Código:

```javascript
programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t
  
  const real AUTONOMIA = 20, PRECO = 5

  funcao inicio() {

    real dinheiro, abastecido, distancia

    escreva("Quanto de dinheiro você tem para abastecer?\n")
    leia(dinheiro)

    dinheiro = m.arredondar(dinheiro, 2)
    abastecido = m.arredondar(dinheiro / PRECO, 2)
    distancia = m.arredondar(abastecido * AUTONOMIA, 2)
    
    limpa()
    escreva("Com o combustível à R$", PRECO, " e abastecendo R$", dinheiro, ", você compra ",
    abastecido, " litros \ne tem uma autonomia de ", distancia, "km com o novo carro!\n")

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
```

---

## Desafio 04

Faça um Programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês. Calcule e mostre o total do seu salário no referido mês, sabendo-se que são descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato, faça um programa que nos dê:

- salário bruto.
- quanto pagou ao INSS.
- quanto pagou ao sindicato.
- o salário líquido.

### calcule os descontos e o salário líquido, conforme a tabela abaixo:
- \+ Salário Bruto : R$
- \- IR (11%) : R$
- \- INSS (8%) : R$
- \- Sindicato ( 5%) : R$
- = Salário Liquido : R$


---

- ### Fluxograma:

![alt text](<04 Imposto salario/fluxograma.png>)

---

- ### Código:

```javascript
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
```

---

## Desafio 05

A empresa XKW concedeu um bônus de 20% do valor do salário a todos os funcionários com tempo de trabalho na empresa igual ou superior a 5 anos e de 10% aos demais. Faça um programa que receba o salário e o tempo de serviço de um funcionário, calcule e mostre o valor do bônus recebido por ele.

---

- ### Fluxograma:

![alt text](<05 Bonus salarial/fluxograma.png>)

---

- ### Código:

```javascript
programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  funcao inicio() {

    real salario, anos, bonus

    escreva("Informe o salário atuao do funcionário\n")
    leia(salario)

    limpa()
    escreva("Informe o tempo de serviço do funcionário em anos\n")
    leia(anos)

    se (anos >= 5) {
      bonus = m.arredondar(salario * 0.2, 2)
      salario += bonus

      limpa()
      escreva("Como o funcionário tem mais de 5 anos ele recebe um bônus de 20%\n")
      escreva("Valor do bônus: R$", bonus, "\n")
      escreva("Novo salário com bônus: R$", salario, "\n")

    } senao {
      bonus = m.arredondar(salario * 0.1, 2)
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

    se(t.caixa_baixa(repetir) == 's') {
      limpa()
      inicio()
    }
    limpa()
  }
}
```

---

## Desafio 06

Implemente um código para aprovar empréstimo bancário. O código deve pedir 3 informações: valor do empréstimo, número de parcelas e salário do solicitante. Aprovar empréstimo caso o valor das parcelas representem no máximo 30% do salário do solicitante.

---

- ### Fluxograma:

![alt text](<06 Emprestimo/fluxograma.png>)

---

- ### Código:

```javascript
programa {

  inclua biblioteca Matematica --> m
  inclua biblioteca Texto --> t

  funcao inicio() {

    real emprestimo, parcelas, salario

    escreva("Informe o valor do empréstimo:\n")
    leia(emprestimo)

    limpa()
    escreva("Informe o número de parcelas:\n")
    leia(parcelas)
    
    limpa()
    escreva("Informe seu salário:\n")
    leia(salario)

    se ((salario * 0.3) >= (emprestimo / parcelas)) {
      limpa()
      escreva("Parabéns, seu empréstimo foi aprovado!\n")
      escreva("Valor das parcelas: R$", m.arredondar(emprestimo / parcelas, 2), "\n")
    } senao {
      limpa()
      escreva("Negado! O valor das parcelas são de R$", m.arredondar(emprestimo / parcelas, 2), "\n")
      escreva("O valor máximo das parcelas para aprovação devem ser de R$", m.arredondar(salario * 0.3, 2), "\n")
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
```

---

## Desafio 07

Construa um programa que leia o código de um determinado produto e mostre a sua classificação.

Código Classificação

- 1 - Alimento não-perecível
- 2, 3 ou 4 - Alimento perecível
- 5 ou 6 - Vestuário
- 7 - Higiene pessoal
- 8, 9, 10 - Utensílios domésticos
- Qualquer outro código Inválid

---

- ### Fluxograma:

![alt text](<07 Classificacao/fluxograma.png>)

---

- ### Código:

```javascript
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
```

---

## Desafio 08

O Sr. Manoel Joaquim possui uma grande loja de artigos de R$ 1,99, com cerca de 10 caixas. Para agilizar o cálculo de quanto cada cliente deve pagar ele desenvolveu uma tabela que contém o número de itens que o cliente comprou e ao lado o valor da conta. Desta forma a atendente do caixa precisa apenas contar quantos itens o cliente está levando e olhar na tabela de preços. Você foi contratado para desenvolver o programa que monta esta tabela de preços, que conterá os preços de 1 até 50 produtos, conforme o exemplo abaixo:

Lojas Quase Dois - Tabela de preços:

- 1 - R$ 1.99
- 2 - R$ 3.98
- ...
- 50 - R$ 99.50

---

- ### Fluxograma:

![alt text](<08 Quantidade itens valor/fluxograma.png>)

---

- ### Código:

```javascript
programa {
  
  real PRECO = 1.99

  funcao inicio() {

    escreva("====================\n")
    escreva("TABELA DE PREÇOS\n")
    escreva("====================\n")

    para(inteiro i = 1; i <= 50; i++){
      se(i < 10) {
        escreva("0", i, " - R$", PRECO * i, "\n")
      } senao {
        escreva(i, " - R$", PRECO * i, "\n")
      }
    }
  }
}
```

---

## Desafio 09

O Sr. Manoel Joaquim acaba de adquirir uma panificadora e pretende implantar a metodologia da tabelinha, que já é um sucesso na sua loja de 1,99. Você foi contratado para desenvolver o programa que monta a tabela de preços de pães, de 1 até 50 pães, a partir do preço do pão informado pelo usuário, conforme o exemplo abaixo:

Preço do pão: R$ 0.18.

Panificadora Pão de Ontem - Tabela de preços:

- 1 - R$ 0.18
- 2 - R$ 0.36
- ...
- 50 - R$ 9.00

---

- ### Fluxograma:

![alt text](<09 Quantidade paes valor/fluxograma.png>)

---

- ### Código:

```javascript
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
```