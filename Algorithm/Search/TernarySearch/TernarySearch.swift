//
//  TernarySearch.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import Foundation

class TernarySearch {

    //Ternary Search Algorithm O(log3 N)

    /*
     A pesquisa ternária é um método de pesquisa que só pode ser aplicado a uma sequência ordenada e que aplica a estratégia de dividir para conquistar com um fator constante de 3, para diminuir mais rapidamente o número de elementos a analisar. Com quatro comparações - ou três na versão mais eficiente - divide sucessivamente a sequência em  três partes e seleciona a terça parte da sequência onde se encontra o valor procurado. A pesquisa começa por selecionar dois elementos pivô igualmente distanciados na sequência, a um terço e a dois terços do inicio da sequência. O valor é comparado com estes dois elementos pivô, de maneira a escolher a terça parte da sequência, que vai continuar a ser pesquisada, caso seja necessário. O processo é repetido até que um dos dois elementos pivô seja o valor procurado ou até que a sequência obtida não tenha elementos para serem analisados, o que significa que o valor procurado não existe na sequência. Em cada passo da pesquisa ternária, a eliminação de elementos da sequência que não precisam de ser processados é maior do que na pesquisa binária.
     */
    static func ternarySearch(array: [Int], searchableValue: Int) -> Int? {
        var min = 0
        var max = (array.count - 1)
        var firstPivot = 0
        var secondPivot = 0

        while (min <= max) {
            let totalElements = (max - min + 1)

            if (totalElements % 3 == 0) {
                firstPivot = min + (totalElements / 3) - 1
                secondPivot = min + (2 * totalElements / 3) - 1
            } else {
                firstPivot = min + (totalElements / 3)
                secondPivot = min + (2 * totalElements / 3)
            }

            if (array[firstPivot] == searchableValue) {
                return firstPivot
            }
            else if (array[firstPivot] > searchableValue) {
                max = firstPivot - 1
            }
            else if (array[secondPivot] == searchableValue) {
                return secondPivot
            }
            else if (array[secondPivot] > searchableValue) {
                min = firstPivot + 1 ; max = secondPivot - 1
            }
            else {
                min = secondPivot + 1
            }
        }
        return nil
    }

    /*
     Existem várias versões mais eficientes da pesquisa ternária alternativas ao algoritmo acima. No entanto, uma forma de otimizar a máximo a pesquisa ternária consiste em aplicar a mesma estratégia usada a versão mais eficiente da pesquisa binária.
     Para eliminar a pesquisa explícita do valor procurado e reduzir sucessivamente a sequência ao terço onde se encontra o valor procurado, é preciso fazer apenas dois testes condicionais dentro do ciclo repetitivo. Finalmente, quando a sequência tiver um único elemento, este elemento é testado para determinar se a pesquisa teve ou não sucesso. O Algoritmo abaixo implementa esta estratégia. Esta versão da pesquisa ternária é a mais eficiente que se consegue implementar. Tem ainda a vantagem de efetuar tantas comparações para determinar se o valor procurado existe na sequência, como para determinar que ele não existe. Ou seja, não se degrada quando se procuram valores inexistentes na sequência.
     */
    static func optimizedTernarySearch(array: [Int], searchableValue: Int) -> Int? {
        var min = 0
        var max = (array.count - 1)
        var firstPivot = 0
        var secondPivot = 0

        while (min < max) {
            let totalElements = (max - min + 1)

            if (totalElements % 3 == 0) {
                firstPivot = min + (totalElements / 3) - 1
                secondPivot = min + (2 * totalElements / 3) - 1
            } else {
                firstPivot = min + (totalElements / 3)
                secondPivot = min + (2 * totalElements / 3)
            }

            if (array[firstPivot] > searchableValue) { max = firstPivot - 1 }
            else if (array[secondPivot] > searchableValue) { min = firstPivot ;  max = secondPivot - 1 }
            else { min = secondPivot }

        }
        if (array[min] == searchableValue) { return min }
        else { return nil }
    }

    /*
     A pesquisa ternária também pode ser implementada de forma recursiva, analisando cada nova pesquisa um dos terços da sequência anteriormente analisada até que o valor seja encontrado ou até não existirem mais elementos para analisar. A verso recursiva é apresentada a baixo. Ela começa por testar a situação de paragem no caso da pesquisa sem sucesso, o que acontece quando as posições inicial e final trocam de posição. Nesse caso, retorna nulo como sinal de pesquisa falhada. Caso tal não se verifique, calcula os índices dos elementos pivô. Se um dos elementos pivô for o valor procurado, estamos perante a situação de paragem com sucesso, e o algoritmo devolve o índice do elemento pivô da sequência. Caso contrário, em resultado da comparação do valor procurado com os valores pivô, o algoritmo é invocado alternativamente para um dos terços da sequência, onde vai continuar a pesquisa.
     */
    static func recursiveTernarySearch(array: [Int], start: Int, end: Int, searchableValue: Int) -> Int? {
        var start = start
        var end = end
        var firstPivot = 0
        var secondPivot = 0

        if (start > end) { return nil }
        let totalElements = (end - start + 1)
        if (totalElements % 3 == 0) {
            firstPivot = start + (totalElements / 3) - 1
            secondPivot = start + (2 * totalElements / 3) - 1
        } else {
            firstPivot = start + (totalElements / 3)
            secondPivot = start + (2 * totalElements / 3)
        }

        if (array[firstPivot] == searchableValue) { return firstPivot }
        else if (array[firstPivot] > searchableValue) { end = firstPivot - 1 }
        else if (array[secondPivot] == searchableValue) { return secondPivot }
        else if (array[secondPivot] > searchableValue) { start = firstPivot + 1 ; end = secondPivot - 1 }
        else { start = secondPivot + 1 }

        return recursiveTernarySearch(array: array, start: start, end: end, searchableValue: searchableValue)
    }

    /*
     A implementação recursiva é um caso de recursividade terminal que não tem qualquer vantagem sobre a implementação repetitiva apresentada nos algoritmos anteriores, portanto é de se esperar uma complexidade idêntica. A pesquisa ternária, independentemente de a implementação ser mais ou menos eficiente, é um algoritmo com complexidade logarítmica O(log 3 N), que se degrada pouco, ou mesmo nada, no caso de pesquisa sem sucesso.
     Comparando as pesquisas ternária e binária, temos que a pesquisa ternária diminui o número de iterações necessárias para encontrar um valor, porque a sua árvore de decisão é menos alta. Mas, como ela aumenta o número de comparações por iteração, mais concretamente, faz o dobro das comparações para a partir da sequência em três partes e para testar os dois elementos do pivô, é menos eficiente do que a pesquisa binária.
     */
}
