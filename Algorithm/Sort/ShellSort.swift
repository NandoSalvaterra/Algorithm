//
//  ShellSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 03/03/22.
//

import Foundation

class ShellSort {

    /*
     O algoritmo de Shell Sort foi criado por Donald Shell, que publicou sua primeira versão em 1959. É uma classificação de comparação in-place (na própria sequência) e pode ser visto como uma otimização do algoritmo Insertion Sort, que permite a troca de itens que estão distantes. O método começa classificando pares de elementos distantes um do outro, reduzindo progressivamente o intervalo entre os elementos a serem comparados. Ao começar com elementos distantes, ele pode mover alguns elementos fora do lugar para a posição mais rapidamente do que uma simples troca de vizinho mais próximo O tempo de execução do Shell Sort depende muito da sequência de intervalos que ele usa. Para muitas variantes práticas, determinar sua complexidade de tempo continua sendo um problema em aberto.
     A ideia é organizar a lista de elementos de forma que, começando em qualquer lugar, tomando cada h-ésimo elemento produza uma lista ordenada. Essa lista é dita h-ordenada (h-sorted). Também pode ser considerado como h listas intercaladas, cada uma classificada individualmente. Começar com grandes valores de h permite que os elementos se movam por longas distâncias na lista original, reduzindo grandes quantidades de desordem rapidamente e deixando menos trabalho para etapas menores de h-sort. Se a lista é então k-sorted para algum inteiro menor k, então a lista permanece h-sorted. Seguir essa ideia para uma sequência decrescente de valores h terminando em 1 é garantido para deixar uma lista ordenada no final.
     Em termos simplistas, isso significa que se tivermos uma sequência de 1024 números, nossa primeira lacuna (h) pode ser 512. Em seguida, percorremos a lista comparando cada elemento da primeira metade com o elemento da segunda metade. Nossa segunda lacuna (k) é 256, que divide a matriz em quatro seções (começando em 0, 256, 512, 768), e garantimos que os primeiros itens em cada seção sejam classificados em relação um ao outro, depois o segundo item em cada seção e assim por diante . Na prática, a sequência de intervalos pode ser qualquer coisa, mas o último intervalo é sempre 1 para finalizar a classificação (efetivamente terminando com uma classificação por inserção comum).
     */


    static func shellSort(array: [Int]) -> [Int] {
        var sortedArray = array
        var gapSize = 1

        while gapSize < sortedArray.count / 3 {
           // print("tamanho dividido por 3 : \(sortedArray.count / 3)")
           // print("antes: \(h)")
            gapSize = 3 * gapSize + 1
           // print("dps: \(h)")
        }
        print("final valor de gapSize: \(gapSize)")
        while gapSize >= 1 {
            for i in gapSize..<sortedArray.count {
                print("valor de i: \(i)")
                for j in stride(from: i, to: gapSize - 1, by: -gapSize) {
                    print("valor de j: \(j)")
                    if sortedArray[j] < sortedArray[j - gapSize] {
                        sortedArray.swapAt(j, j-gapSize)
                    } else {
                        break
                    }
                }
            }
            gapSize /= 3
            print("valor de gapSize dps da divisao: \(gapSize)")
        }
        return sortedArray
    }



// Parte do livro

/*
O algoritmo apresenta o Shell Sort para a ordenação crescente da sequência. O algoritmo processa a sequência constituída pelos elementos que estão à distância de comparação e para cada um deles faz a sua inserção na posição correta, de forma que esta subsequência fique ordenada. Depois, passa à distância de comparação seguinte, que é menor do que a anterior. Quando a distância de comparação é unitária, estamos perante o algoritmo de inserção linear. Até esta inserção unitária final, não há garantia de que algum elemento da sequência já esteja ordenado. Na versão original, o primeiro incremento é igual a metade da dimensão da sequência e cada incremento seguinte é metade do incremento anterior, até ser atingido o incremento unitário.
 */

static func shellSort1(array: [Int]) -> [Int] {
    var sortedArray = array
    var gapSize = sortedArray.count / 2
    var position = 0

    while(gapSize > 0) {
        print("GAP SIZE: \(gapSize)")
        for i in gapSize..<sortedArray.count {
            print("I Position : \(i)")
            let aux = sortedArray[i]
            position = i
            while (position >= gapSize) {
                print("POSITION VALUE: \(position)")
                if (aux < sortedArray[position - gapSize]) { sortedArray[position] = sortedArray[position - gapSize] }
                else { break }
                sortedArray[position - gapSize] = aux
                position -= gapSize
            }
        }
        gapSize /= 2
    }
    return sortedArray
}

/*
 Para uma sequência com 10 elementos, com o primeiro incremento, que é 5, o algoritmo divide a sequência em cinco sequências de dois elementos cada, que são ordenadas em separado. Com o segundo incremento, que é 2, algoritmo divide a sequência em duas sequências de cinco elementos cada, que são ordenadas em separado. Com o incremento unitário, o algoritmo faz a inserção linear de sequência completa e ajusta os elementos que ainda estão desordenados. Neste exemplo, o algoritmo faz um total de 29 comparações e 55 instruções de atribuição, para efetuar 11 deslocamentos de elementos necessários para ordenar a sequência, o que é equivalente a, aproximadamente, 18 trocas.
 */

}


// Falar se ele é stable ou unstable
