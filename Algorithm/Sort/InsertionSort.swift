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
        for i in 1..<(sortedArray.count) {
            let aux = sortedArray[i]
            var position = i
            while(position > 0 && sortedArray[position - 1] > aux) {
                sortedArray[position] = sortedArray[position - 1]
                if (position != i) { sortedArray[position] = aux }
                position -= 1
            }
        }
        return sortedArray
    }
}
