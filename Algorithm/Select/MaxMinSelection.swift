//
//  MaxMinSelection.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import Foundation

class MaxMinSelection {

    //Max Select Algorithm - O(N)

    /*
     O algoritmo abaixo determina o maior valor da sequência. No caso da existência de elementos repetidos, devolve a primeira ocorrência do maior valor.
     No início assume que o maior valor é o primeiro elemento da sequência e depois esta é analisada até ao último elemento à procura de um valor ainda maior.
     */
    static func maxSelect(array: [Int]) -> Int {
        var max = 0
        if (array.count == 0) { return 0 }
        max = array[0]
        for i in 1..<array.count {
            print("passando pelo elemento : \(array[i])")
            if (array[i] > max) { max = array[i] }
        }
        return max
    }

    /*
     Min Select - O(N)

     O algoritmo abaixo determina o menor valor da sequência. No caso da existência de elementos repetidos, devolve a primeira ocorrência do menor valor.
     No início assume que o menor valor é o primeiro elemento da sequência e depois esta é analisada até o último elemento à procura de um valor ainda menor.
     */
    static func minSelect(array: [Int]) -> Int {
        var min = 0
        if (array.count == 0) { return 0 }
        min = array[0]
        for i in 1..<array.count {
            if (array[i] < min) { min = array[i] }
        }
        return min
    }

    /*
     Em alternativa, podemos aplicar uma estratégia de dividir para conquistar, partindo sucessivamente a sequência em duas metades, calcular o maior e o menor valores de cada subsequência, e depois comparar os dois maiores para determinar o maior deles e os dois menores para determinar o menor deles. Este processo de cálculo, que se apresenta no Algoritmo abaixo, é mais eficiente do que detetar separadamente o maior e o menor valores. As condições de paragem do algoritmo são, naturalmente: a sequência não tem elementos; numa sequência com apenas um elemento, ele é simultaneamente o maior e o menor; e numa sequência com dois elementos, um é o maior e o outro é o menor, sendo necessário fazer apenas uma comparação para os determinar. Este algoritmo de seleção simultânea do maior e do menor valores tem dois parâmetros de saída e não tem qualquer resultado de saída - ou seja, tem de ser implementado como sendo um procedimento em vez de uma função. Mas, só pode ser implementado numa linguagem de programação que permita a passagem por referência, como é o caso da linguagem C e parâmetros Inout no Swift.
     Esse algoritmo também tem complexidade linear O(N) mas é mais eficiente, porque faz apenas 1.5N comparações contra as 2N comparações da seleção separada.
     */
    func maxMinSelection(array: [Int], start: Int, end: Int, max: inout Int, min: inout Int) {
        let range = (end - start + 1)
        if (range == 0) { return }
        else if (range == 1) { max = array[start] ; min = array[start] }
        else if (range == 2) {
            if(array[start] > array[end]) { max = array[start] ; min = array[end] }
            else { max = array[end] ; min = array[start] }
        } else {
            let middle = start + range / 2
            var max1 = 0
            var min1 = 0
            var max2 = 0
            var min2 = 0

            maxMinSelection(array: array, start: start, end: (middle - 1), max: &max1, min: &min1)
            maxMinSelection(array: array, start: middle, end: end, max: &max2, min: &min2)

            if(max1 > max2) { max = max1 }
            else { max = max2 }
            if(min1 < min2) { min = min1 }
            else { min = min2 }
        }
    }
}
