//
//  SelectionSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 02/03/22.
//

import Foundation

class SelectionSort {

    //Selection Sort Algorithm O(N²)

    /*
     Na ciência da computação, a ordenação por seleção (Selection Sort) é um algoritmo de ordenação por comparação no local (in-place comparison). Ele tem uma complexidade de tempo quadrática, o que o torna ineficiente em listas grandes e geralmente tem um desempenho pior do que a sua semelhante ordenação por inserção (Insertion Sort). A ordenação por seleção é conhecida por sua simplicidade e tem vantagens de desempenho sobre algoritmos mais complicados em certas situações, particularmente onde a memória auxiliar é limitada.
     O algoritmo abaixo apresenta essa técnica para fazer a ordenação crescente da sequência, otimizando o número de trocas. Cada elemento da sequência é comparado com os restantes elementos finais da mesma. Antes da comparação começar, a posição do elemento que está a ser processado é memorizada. Sempre que é detectado um elemento de menor valor, este elemento é o novo menor elemento até então detectado, sendo atualizada a sua posição na sequência. No final do varrimento da sequência, se o menor elemento não for o elemento inicial, é sinal de que o menor elemento não está na posição inicial, sendo preciso trocar os elementos. Para uma sequência de 10 elementos, o número de trocas é de apenas 7 contra 25 do algoritmo Sequential Sort
     Este algoritmo também compara cada elemento da sequência com todos os restantes elementos da sequência de forma incondicional. Portanto, em termos de comparações, tem apenas o caso sistemático com complexidade quadrática, mas tem complexidade linear para trocas (O(N²) comparisons, O(N) swaps).
     */
    static func selectionSort(array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 0..<(sortedArray.count - 1) {
            var min = i
            for j in (i + 1)..<sortedArray.count {
                if (sortedArray[min] > sortedArray[j]) { min = j }
            }
            if (min != i) {  sortedArray.swapAt(i, min) }
        }
        return sortedArray
    }
}

// Falar se ele é stable ou unstable
