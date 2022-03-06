//
//  InsertionSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 02/03/22.
//

import Foundation

class InsertionSort {

    //Insertion Sort Algorithm O(N²)

    /*
     Ordenação por inserção (Insertion Sort), é um algoritmo de ordenação que, dado uma estrutura (array, lista) constrói uma matriz final com um elemento de cada vez, uma inserção por vez. Assim como algoritmos de ordenação quadrática, é bastante eficiente para problemas com pequenas entradas, sendo o mais eficiente entre os algoritmos desta ordem de classificação.
     Podemos fazer uma comparação do Insertion Sort com o modo como algumas pessoas organizam um baralho num jogo de cartas. Imagine que você está jogando ás cartas. Você está com as cartas na mão e elas estão ordenadas. Você recebe uma nova carta e deve colocá-la na posição correta da sua mão de cartas, de forma a que as cartas obedeçam à ordenação.
     A cada nova carta adicionada à sua mão de cartas, a nova carta pode ser menor que algumas das cartas que você já tem na mão ou maior, e assim, você começa a comparar a nova carta com todas as cartas na sua mão até encontrar sua posição correta. Você insere a nova carta na posição correta, e, novamente, a sua mão é composta de cartas totalmente ordenadas. Então, você recebe outra carta e repete o mesmo procedimento. Então outra carta, e outra, e assim em diante, até não receber mais cartas.
     Esta é a ideia por trás do Insertion Sort. Percorra as posições do array, começando com o índice 1. Cada nova posição é como a nova carta que você recebeu, e você precisa inseri-la no lugar correto no subarray ordenado à esquerda daquela posição.

     O Algoritmo abaixo apresenta essa abordagem, para a ordenação crescente da sequência. Ele aplica a estratégia de dividir para conquistar (Divide and Conquer). Durante o processo de ordenação, a sequência está dividida em duas partes: a parte inicial da sequência está ordenada e a parte final está desordenada. A cada iteração do algoritmo, um elemento é retirado da parte desordenada e deslocado para a parte ordenada.
     */

    static func insertionSort(array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 1..<(sortedArray.count - 1) {
            let aux = sortedArray[i]
            var position = i - 1
            while(position >= 0 && sortedArray[position] > aux) {
                sortedArray[position + 1] = sortedArray[position]
                position -= 1
            }
            sortedArray[position + 1] = aux
        }
        return sortedArray
    }

    /*
     O algoritmo começa por considerar que o primeiro elemento da sequência já está ordenado e depois ordena os restates elementos da sequência, ou seja, desde o segundo ao último elemento. Cada elemento a ordenar é previamente copiado para uma variável temporária (aux), de forma a abrir uma posição live que permita o deslocamento dos elementos que estão atrás de si, ou seja, na parte ordenada da sequência, e que são maiores do que ele. Enquanto houver elementos na parte ordenada da sequência, maiores do que o elemento a ordenar, eles são deslocados uma posição para a frente. Quando o deslocamento dos elementos termina, o elemento a ordenar é colocado na posição que foi aberta pelo deslocamento dos elementos. Se o elemento já estiver na posição correta, porque é maior do que todos os que estão atrás de si, então não há deslocamento de elementos. Nesta situação, é feita uma instrução de cópia inutilmente. Esta ineficiência é caracteristica do Insertion Sort.

     O algoritmo faz praticamente tantas comparações quantos deslocamentos. Mais concretamente, para ordenar cada elemento faz mais uma comparação do que deslocamentos, de modo a poder detetar o fim dos deslocamentos. Para uma sequência de 10 elementos o algoritmo faz um total de 31 comparações e 25 deslocamentos de elementos para ordenar a sequência.

     Portanto, em termos de comparações, esse algoritmo (tendo em atenção o pior caso e o caso médio) tem complexidade quadrática O(N²), mas tem um caso médio melhor do que o Bubble Sort. Se a sequência estiver parcialmente desordenada, este é o melhor algoritmo de ordenação de todos os algoritmos simples com complexidade quadrática. No entanto, este algoritmo tem um problema; se os elementos da sequência estiverem muito longe do sítio de inserção, o seu arrastamento até ao local de inserção custa muitas operações de cópias de elementos. Existe uma implementação otimizada deste algoritmo criada em 1959 por Donald L. Shell (Shell Sort), que, em vez de comparar elementos adjacentes, compara elementos distanciados de um incremento que vai sendo, progressivamente diminuído até qua na última passagem compara elementos adjacentes. Assim a inserção de elementos distantes é feita de forma mais rápida.
     */
}

// Falar se ele é stable ou unstable
