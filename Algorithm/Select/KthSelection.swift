//
//  KthSelection.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 25/02/22.
//

import Foundation

class KthSelection {

     //Complexity: O(n log n), where n is the length of the collection.

    func kMinSelect(array: inout [Int], value: Int) -> Int { // O(n log n)
        array = array.sorted(by: >)
        return array[array.count - value]
    }


    /*
     As versões repetitivas dos algoritmos de seleção têm dois parâmetros de entrada: a sequência identificada pelo parâmetro array e têm como resultado de saída o valor procurado. O algoritmo do K-ésimo menor valor tem mais um parâmetro, que é o número de ordem, que serve de referência à pesquisa, identificado pelo parâmetro k. Nas versões recursivas dos algoritmos têm dois parâmetros que representam os índices da sequência one começa e termina a pesquisa, identificados, respetivamente  pelos parâmetros start e end.
     */



    /*
     Consideremos que se pretende determinar não o menor/maior elemento de uma sequência, mas sim o segundo menor/maior elemento, ou o terceiro menor/maior elemento, ou de forma mais geral, o K-ésimo menor/maior elemento. Existem varias maneiras de o fazer: A primeira que vem à ideia é ordenar a sequência e depois, tendo em conta que os indices da sequência começam em O, aceder ao elemento armazenado na posição K-1 da sequência. Só que o melhor algoritmo de ordenação é linear-logarítmico. Contudo, existem outas maneiras que não exigem ordenar completamente os elementos e são potencialmente mais eficientes.
     A primeira solução passa por aplicar a estratégia de dividir para conquistar associada à pesquisa exaustiva, fazendo a seleção sucessiva do menor elemento agindo do seguinte modo: pesquisar o menor elemento da sequência e colocá-lo na posição inicial, depois passar à sequência constituída pelos elementos restantes e repetir o processo. Ao fim de K repetições teremos os K menores elementos da sequência colocados nas primeiras K posições da sequência por ordem crescente.
     A primeira iteração começa por selecionar o elemento inicial da sequência como sendo o menor e depois analisa toda a restante sequência à procura de um valor ainda menor. Depois troca os dois elementos colocando o menor elemento detectado na posição inicial da sequência. A segunda iteração começa por selecionar o elemento inicial da sequência ainda por processar como sendo o menor e depois analisa toda a restante sequência à procura de um valor ainda menor, depois troca os dois elementos colocando na segunda posição da sequência, e assim sucessivamente. Generalizando, a i ésima iteração considera o elemento da posição i como sendo o menor e compara-o com todos os elementos desde a posição seguinte até a ultima posição da sequência para determinar o menor elemento existente na restante parte da sequência em análise, que é a sequência constituída pelos elementos das posições i+1 a n-1. O menor elemento detectado (caso não seja o elemento inicialmente considerado da posição i) é depois trocado com o elemento da posição i. No fim das K iterações, as primeiras posições da sequência armazenarão os menores valores da mesma.
     */


    /*
     O Algoritmo abaixo implementa esta estratégia de forma repetitiva e utiliza o método swap para trocar dois elementos da sequência. Após a execução do algoritmo, o K-ésimo menor elemento encontra-se armazenado na posição K-1 da sequência.
     Ele tem complexidade linear O(value*N). O problema é que, quando value é muito proximo de N, tem complexidade quadrática O(N²). Em alternativa, quando value é maior que (N / 2), é melhor fazer o contrário, ou seja, determinar o (K-value)-ésimo maior elemento da sequência. Este método é razoavelmente rápido para determinar elementos próximos das extremidades da sequência, mas é ruim para determinar elementos no centro da sequência, como é o caso da mediana (valor central da sequência), ou seja, value = (N / 2).
     */
    func kMinSelect(array: [Int], value: Int) -> [Int] {
        var sortedArray = array
        for i in 0..<value {
            var position = i
            var min = sortedArray[position]

            for j in (i + 1)..<(sortedArray.count - 1) {
                if (sortedArray[j] < min) { min = sortedArray[j] ; position = j }
            }

            if (i != position) { sortedArray.swapAt(sortedArray[i], sortedArray[position]) }
        }
        return sortedArray
    }

    /*
     A segunda solução passa por aplicar uma estratégia de dividir para conquistar associada à separação de elementos da sequência, em menores para um lado, maiores para o outro lado. De maneira que, num dado instante, comparando o elemento armazenado na posição k-1 da sequência (que armazena n elementos) com todos os restantes elementos, se verifica que ele é maior do que ou igual a todos os elementos da sequência nas posições 0 a k-2 e que ele é menor do que ou igual a todos os elementos da sequência nas posições k a n-1. Nesta situação, ele é o K-ésimo menor elemento da sequência, mesmo sem que tenha sido necessário ordenar completamente a sequência.
     O Algoritmo abaixo apresenta este método de seleção do K-ésimo menor elemento de uma sequência, também conhecido como Quick Select, e que foi criado por Charles A. R. Hoare. É um algoritmo recursivo (que utiliza o mesmo método de separação de elementos do algoritmo de ordenação Quick Sort) mas com uma só invocação recursiva, que vai reduzindo a sequência de entrada à parte onde se encontra armazenado o K-ésimo menor elemento. O algoritmo utiliza a operação Swap para trocar dois elementos da sequência.
     */

    func kMinSelectRecursive(array: inout [Int], begin: inout Int, end: inout Int, value: inout Int) -> [Int] {
        var i = begin
        var j = end
        value -= 1
        let pivot = array[value]

        if (1 < 2) {
            repeat {
                while(array[i] < pivot) { i += 1 }
                while(array[j] > pivot) { j -= 1 }
                if (i <= j) && (i != j) {
                    array.swapAt(i, j)
                    i += 1
                    j -= 1
                }
            } while (i <= j)
            if (j < value) { begin = i }
            if (value < i) { end = j }
            value += 1
            return kMinSelectRecursive(array: &array, begin: &begin, end: &end, value: &value)
        } else {
            return array
        }
    }

    /*
    O algoritmo usa o K-ésimo elemento da sequência como pivô. Depois, percorre a sequência da esquerda para a direita para encontrar elementos maiores do que o pivô e da direita para a esquerda para encontrar elementos menores do que ele. Caso existam, troca-os para fazer a separação dos elementos. Quando as trocas acabam, todos os elementos menores do que o pivô estão à sua esquerda e todos os elementos maiores do que ele estão à sua direita, sendo que existem três situações possíveis: Se o pivô for menor do que o K-ésimo menor elemento (k >= i > i), então é necessário procurar o elemento na segunda metade da sequência, atualizando para isso a posição de inicio da pesquisa (start = 1), obtendo assim uma partição com n-i elementos; se o pivô for maior do que o K-ésimo menor elemento (k <= j < i), então é necessário procurar o elemento na primeira metade da sequência, atualizando para isso a posição de fim da pesquisa (end = j), obtendo assim uma partição com j+1 elementos; se existem vários elementos iguais ao pivô (j < k < 1), então os indicadores de inicio e de fim de pesquisa trocam, pelo que a partição da próxima invocação recursiva não tem elementos, o que não produz qualquer efeito, e o pivô ja é o K-ésimo menor elemento. Após a execução do algoritmo, o K-ésimo menor elemento encontra-se armazenado na posição K-1 da sequência. Para obter o K-ésimo maior elemento em vez do K-ésimo menor elemento, basta inverter os operadores relacionais nos ciclos while (< para > e > para <).
     Ele possui complexidade quadrática O(N²), mas a solução acima é um caso de recursividade terminal, então podemos criar uma solução repetitiva que se apresenta no algoritmo abaixo. É preciso ter em consideração que um algoritmo repetitivo é mais eficiente do que um algoritmo recursivo, porque não tem a desvantagem associada à invocação sucessiva de subprogramas (alocação da memória stack).
     */
    //func kMinSelectRepetitive(array: [Int], value: Int) -> [Int] {
    //
    //    var start  = 0
    //    var end = (array.count - 1)
    //    var value = value -= 1
    //
    //    while(start < end) {
    //        var i = start
    //        var j = end
    //        var pivot = array[value]
    //
    //        repeat {
    //
    //            while (array[i] < pivot) { i += 1 }
    //            while (array[j] > pivot) { j -= 1 }
    //            if (i <= j) && (i != j) {
    //                array.swapAt(i, j)
    //                i += 1
    //                j -= 1
    //            }
    //        } while (i <= j)
    //        if (j < value) { start = i }
    //        if (value < i) { end = j }
    //    }
    //}


https://jayeshkawli.ghost.io/implementing-quick-select-algorithm-finding-kth-largest-smallest-element/
https://www.youtube.com/watch?v=XEmy13g1Qxc&t=99s
}
