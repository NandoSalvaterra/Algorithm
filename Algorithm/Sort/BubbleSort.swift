//
//  BubbleSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 02/03/22.
//

import Foundation

class BubbleSort {

    //Bubble Sort Algorithm O(N²) - Stable

    /*
     Na ciência da computação, o Bubble Sort, ou ordenação por flutuação (literalmente "por bolha"), é um algoritmo de ordenação dos mais simples. A ideia é percorrer a sequência diversas vezes, e a cada passagem fazer flutuar para o topo o maior elemento da sequência. Essa movimentação lembra a forma como as bolhas em um tanque de água procuram seu próprio nível, e disso vem o nome do algoritmo. No melhor caso, o algoritmo executa N operações relevantes, onde N representa o número de elementos da sequência. No pior caso, são feitas N² operações. A complexidade desse algoritmo é de ordem quadrática. Por isso, ele não é recomendado para programas que precisem de velocidade e operem com quantidade elevada de dados.

     Para todos os elementos finais da sequência, desde o último até o segundo elemento, cada elemento é comparado com o elemento atrás dele e, caso o valor seja menor, trocam-se os elementos. Deste modo, os elementos de menor valor vão sendo deslocados em direção à parte inicial da sequência. Em cada passagem, contabiliza-se o número de trocas ou sinaliza-se a realização de trocas. Quando uma passagem não tiver efetuado qualquer troca, então é sinal de que a sequência já está ordenada. Em cada passagem, pelo menos um novo elemento fica ordenado, pelo que o elemento inicial de terminação da passagem ascendente é atualizado para o elemento seguinte, de maneira a evitar fazer-se comparações desnecessárias com os elementos que já estão ordenados na parte inicial da sequência. Portanto, a ordenação também acaba quando se esgota a sequência, ou seja, ao fim de N - 1 passagens.

     Para uma sequência com 10 elementos, o algoritmo executa 9 passagens, se bem que na última não efetua qualquer troca. No entanto, mesmo que efetuasse trocas na nona passagem, o algoritmo terminaria na mesma, uma vez que o indicador de posição inicial excede o fim da sequência. Ele faz um total de 45 comparações e 25 trocas para ordenar a sequência.
     */


    /*
     Na primeira versão desse algoritmo, vemos o uso de um laço while e uma variável booleana para controlar a repetição, quando dentro do laço for não for realizado nenhuma troca, podemos considerar que a ordenação terminou e o laço while termina sendo que `swap = false`. Ele também utiliza do recurso de variável auxiliar para fazer a movimentação dos elementos para suas posições corretas.
     */
    static func whileBubbleSort(array: [Int]) -> [Int] {
        var sortedArray = array
        var swap = true

        while swap == true {
            swap = false
            for i in 0..<sortedArray.count - 1 {
                if sortedArray[i] > sortedArray[i + 1] {
                    let temp = sortedArray[i + 1]
                    sortedArray[i + 1] = sortedArray[i]
                    sortedArray[i] = temp
                    swap = true
                }
            }
        }
        return sortedArray
    }

    /*
     Na segunda versão, também usamos o laço while e o mesmo mecanismo da variável booleana para controlar a repetição, porém fazemos isso de forma reversa utilizando o método `reversed() O(1)` e com o auxílio do método `swapAt O(1)` para fazer a troca de elementos, ao invés de utilizar o método de variável auxiliar.
     */
     static func reversedBubbleSort(array: [Int]) -> [Int] {
         var swaps = true
         var sortedArray = array
         var index = 1

         while swaps == true {
             swaps = false
             for i in (1..<sortedArray.count).reversed() {
                 if (sortedArray[i-1] > sortedArray[i]) {
                     sortedArray.swapAt(i, (i-1))
                     swaps = true
                 }
                 index += 1
             }
         }
         return sortedArray
     }

    /*
     Na terceira versão, usamos um laço for para controlar a ordenação da lista total no lugar de um laço while. O segundo laço for vai sendo decrementado conforme o primeiro laço anda a medida que comparamos ele com `sortedArray.count-i-1`. Também usamos o método `swapAt O(1)` ao invés de variável auxiliar nessa versão.
     */
    static func repetitiveBubbleSort(array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        var sortedArray = array
        for i in 0..<sortedArray.count {
            for j in 0..<sortedArray.count-i-1 {
                if sortedArray[j] > sortedArray[j + 1] {
                    sortedArray.swapAt(j + 1, j)
                }
            }
        }
        return sortedArray
    }

    /*
     Como este algoritmo tem a capacidade de, após cada passagem, determinar se a sequência está ou não ordenada, então é indicado para ordenar sequências que estejam parcialmente desordenadas. No entanto, caso a sequência esteja muito desordenada é um mau algoritmo de ordenação, porque faz muitas trocas.

     Contudo, è possível otimizar o algoritmo minimizando o número de comparações. Na versão normal do algoritmo, em cada passagem pela sequência, pelo menos um novo elemento fica ordenado. De facto, todos os elementos atrás do elemento onde foi feita a última troca já estão ordenados, pelo que podemos colocar a variável que representa o elemento de parte inicial da sequência, onde termina a comparação de elementos em cada passagem ascendente, na posição seguinte à posição onde foi feita a última troca. Desta forma, evita-se fazer ainda mais comparações desnecessárias com os elementos que já estão ordenados na parte inicial da sequência.
     */
}
