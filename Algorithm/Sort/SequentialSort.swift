//
//  SequentialSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 28/02/22.
//

import Foundation

class SequentialSort {

    //Sequential Sort Algorithm O(N²)

    /*
     O Algoritmo abaixo apresenta a ordenação Sequencial (Sequential Sort) para fazer a ordenação crescente da sequência. Cada elemento da sequência é comparado com os restantes elementos finais da mesma. Se o elemento inicial for menor do que o elemento mais à frente, então trocam-se os elementos. Só são analisados os primeiros N-1 elementos de uma sequência de N elementos, porque quando se ordena o penúltimo elemento da sequência, o último elemento fica automaticamente ordenado.
     */
    static func sequentialSort(array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 0..<(sortedArray.count - 1) {
            for j in (i + 1)..<sortedArray.count {
                if (sortedArray[i] > sortedArray[j]) {
                    sortedArray.swapAt(i, j)
                }
            }
        }
        return sortedArray
    }
}

// Falar se ele é stable ou unstable
