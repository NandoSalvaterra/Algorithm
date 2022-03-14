//
//  SequentialSearch.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import Foundation

class SequentialSearch {

    //Disordered Sequential Search Algorithm O(N)

    /*
     Também conhecida como Linear Search, aplica a estratégia da Pesquisa Exaustiva (também conhecida como Brutal Force). Consiste em analisar todos os elementos da sequencia de forma metódica. A pesquisa começa no elemento inicial da sequência e avança, elemento a elemento, até encontrar o valor procurado ou até esgotar a sequência.
     Esse método de pesquisa é normalmente demorado, é dependente do tamanho da sequência mas não depende do arranjo interno dos elementos na sequência. Aliás, quando uma sequência está desordenada, este é o único método de pesquisa que podemos utilizar independentemente da forma como a informação está armazenada na sequência, o valor procurado será encontrado caso ele exista na sequência.
     */
    static func disorderedSequentialSearch(array: [Int], searchableValue: Int) -> Int? {
        for index in 0..<array.count {
            if array[index] == searchableValue { return index }
        }
        return nil
    }

    //Ordered Sequential Search Algorithm O(N)

    /*
     No caso de estarmos perante uma sequência ordenada, por exemplo, por ordem crescente podemos otimizar a pesquisa sequencial de maneira a detectar a inexistência do valor procurado, o mais rapidamente possivel, sem ter que percorrer toda a sequência.
     O Algorimto abaixo apresenta a versão otimizada da pesquisa sequencial para sequências ordenadas por ordem crescente. Assim que se encontra um elemento da sequência que é maior do que ou igual ao valor procurado, o ciclo de pesquisa termina. Por mais otimizado que a versão abaixo seja, a complexidade continua linear O(N).
     */
    static func orderedSequentialSearch(array: [Int], searchableValue: Int) -> Int? {
        for index in 0..<array.count {
            if array[index] > searchableValue { break }
            if array[index] == searchableValue {
                return index
            }
        }
        return nil
    }
}
