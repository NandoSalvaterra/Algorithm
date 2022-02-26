//
//  BinarySearch.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import Foundation

class BinarySearch {

    //Binary Search Algoritm O(log2 N)

    /*
     A pesquisa binária é um método de pesquisa que só pode ser aplicado a uma sequência ordenada que aplica a estratégia de decrementar para conquistar com um fator constante de 2. Com duas comparações - ou uma na versão mais eficiente - divide sucessivamente a sequência ao meio e seleciona a metade da sequência onde se encontra o valor procurado. Este modo acelera o processo de pesquisa, comparativamente com a pesquisa sequencial, que elimina apenas um elemento da sequência para cada comparação efetuada.
     O processo é repetido até se encontrar o valor procurado ou até que a sequência obtida não tenha elementos para serem analisados, o que significa que o valor procurado não existe na sequência. O Algoritmo abaixo apresenta a versão mais usual da pesquisa binária, que verifica se o elemento central da sequência é o valor procurado. Em caso de insucesso, faz mais uma comparação a partir da sequência ao meio.
     */
    static func repetitiveBinarySearch(array: [Int], searchableValue: Int) -> Int? {
        var min = 0
        var max = (array.count - 1)

        while(min <= max) {
            let mid = (min + max) / 2
            if (array[mid] == searchableValue) { return mid }
            else if (array[mid] < searchableValue) { min = mid + 1 }
            else { max = mid - 1 }
        }
        return nil
    }

    /*
     Como a grande maioria dos elementos está nos últimos níveis da árvore de decisão, então uma forma de otimizar a pesquisa binária consiste em dar prioridade à partição da sequência ao meio, usando para esse efeito o menor número de comparações possível, em detrimento da detecção do valor procurado na posição central da sequência.
     O algoritmo abaixo aplica essa estratégia alternativa, trocando a ordem das comparações e dando prioridade à detecção do valor na segunda metade da sequência. Ou seja, compara primeiro se o elemento central da sequência é menor do que o valor procurado e só depois se ele é maior.
     */
    static func optimizedRepetitiveBinarySearch(array: [Int], searchableValue: Int) -> Int? {
        var min = 0
        var max = (array.count - 1)

        while(min <= max) {
            let mid = (min + max) / 2

            if (array[mid] < searchableValue) { min = mid + 1 }
            else if (array[mid] > searchableValue) { max = mid - 1 }
            else { return mid }
        }
        return nil
    }

    /*
     A estatégia de atravessar a árvore binária de pesquisa rapidamente, em detrimento da detecção do valor procurado, torna o algoritmo mais eficiente. Por isso, uma forma de otimizar ainda mais a pesquisa binária consiste em diminuir o número de comparações efetuadas em cada iteração, eliminando a pesquisa explícita do valor procurado, e reduzir sucessivamente a sequência à metade onde se encontra o valor procurado, usando apenas uma comparação dentro do ciclo repetitivo. Finalmente, quando a sequência tiver um único elemento, este elemento é testado para determinar se a pesquisa teve ou não sucesso.
     Depois, o algoritmo faz ainda uma comparação final para determinar se a pesquisa teve ou não sucesso. Como em cada iteração é feita apenas uma comparação, então o melhor caso, o pior caso e os casos médios, em que a pesquisa tem sempre sucesso e em que a pesquisa por vezes não é bem sucedida, fazem sempre K+1 comparações.
     Esta versão da pesquisa binária é a mais eficiente de todas e tem ainda a vantagem de efetuar tantas comparações para determinar se o valor procurado existe na sequência, como para determinar que ele não existe. Ou seja, não se degrada quando se procuram valores inexistentes a sequência.
     */
    static func bestOptimizedRepetitivedBinarySearch(array: [Int], searchableValue: Int) -> Int? {
        var min = 0
        var max = (array.count - 1)

        while(min < max) {
            let mid = (min + max) / 2
            if (array[mid] < searchableValue) { min = mid + 1 }
            else { max = mid }
        }
        if (array[min] == searchableValue) { return min }
        else { return nil }
    }


    /*
     A pesquisa binária também pode ser implementada de forma recursiva, analisando cada nova pesquisa uma das metades da sequência anteriormente analisada até que o valor seja encontrado ou até não existirem mais elementos para analisar.
     Ele começa por testar a situação de paragem no caso da pesquisa sem sucesso, o que acontece quando as posições inicial e final trocam de posição. Nesse caso, retorna nulo como sinal de pesquisa falhada. Caso tal não se verifique, calcula o indice do elemento central da sequência em análise. Se o elemento for o valor procurado, estamos perante a situação de paragem com successo, e o algoritmo devolve o indice do elemento central da sequência. Caso contrário, em resultado da comparação do valor procurado com o valor central, o algoritmo é invocado alternativamente para a primeira metade ou para a segunda metade da sequência, onde vai continuar a pesquisa.
     A implementação recursiva é um caso de recursividade terminal que não tem qualquer vantagem sobre a implementação repetitiva apresentada acima, portanto podemos esperar uma complexidade idêntica O(log2 N).
     */
    static func recursiveBinarySearch(array: [Int], start: Int, end: Int, searchableValue: Int) -> Int? {
        if (start > end) { return nil }
        let mid = (start + end) / 2
        if (array[mid] == searchableValue) { return mid }
        if array[mid] > searchableValue { return recursiveBinarySearch(array: array, start: start, end: mid-1, searchableValue: searchableValue) }
        else { return recursiveBinarySearch(array: array, start: mid + 1, end: end, searchableValue: searchableValue) }
    }

    /*
     A pesquisa binaria, independentemente da implementação ser mais ou menos eficiente, é um algoritmo de complexidade logarítmica O(log2 N), que se degrada pouco, ou mesmo nada, no caso da pesquisa sem sucesso.
     */

}
