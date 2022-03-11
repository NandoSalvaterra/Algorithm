//
//  ShellSort.swift
//  Algorithm
//
//  Created by Luiz Fernando Salvaterra on 03/03/22.
//

import Foundation

class ShellSort {

    //Shell Sort Algorithm O(N²) - Unstable

    /*
     O algoritmo Shell Sort foi criado por Donald Shell, que publicou sua primeira versão em 1959. É uma classificação de comparação in-place (na própria sequência) e pode ser visto como uma otimização do algoritmo Insertion Sort, mas permite a troca de itens que estão distantes. O método começa classificando pares de elementos distantes um do outro, reduzindo progressivamente o intervalo entre os elementos a serem comparados. Ao começar com elementos distantes, ele pode mover alguns elementos fora do lugar para a posição mais rapidamente do que uma simples troca de vizinho mais próximo. O tempo de execução do Shell Sort depende muito da sequência de intervalos que ele usa, para muitas variantes práticas, determinar sua complexidade de tempo continua sendo um problema em aberto.
     O algoritmo processa a sequência constituída pelos elementos que estão à distância de comparação e para cada um deles faz a sua inserção na posição correta, de forma que esta subsequência fique ordenada. Depois, passa à distância de comparação seguinte, que é menor do que a anterior. Quando a distância de comparação é unitária, estamos perante o algoritmo de inserção linear. Até esta inserção unitária final, não há garantia de que algum elemento da sequência já esteja ordenado. Na versão original, o primeiro incremento é igual a metade da dimensão da sequência e cada incremento seguinte é metade do incremento anterior, até ser atingido o incremento unitário.
     A ideia é organizar a lista de elementos de forma que, começando em qualquer lugar, tomando cada h-ésimo elemento produza uma lista ordenada. Essa lista é dita h-ordenada (h-sorted). Também pode ser considerado como h listas intercaladas, cada uma classificada individualmente. Começar com grandes valores de h permite que os elementos se movam por longas distâncias na lista original, reduzindo grandes quantidades de desordem rapidamente e deixando menos trabalho para etapas menores de h-sort. Se a lista é então k-sorted para algum inteiro menor k, então a lista permanece h-sorted. Seguir essa ideia para uma sequência decrescente de valores h terminando em 1 é garantido para deixar uma lista ordenada no final.
     Em termos simplistas, isso significa que se tivermos uma sequência de 1024 números, nosso primeiro gap (h) pode ser 512. Em seguida, percorremos a lista comparando cada elemento da primeira metade com o elemento da segunda metade. Nosso segundo gap (k) é 256, que divide a matriz em quatro seções (começando em 0, 256, 512, 768), e garantimos que os primeiros itens em cada seção sejam classificados em relação um ao outro, depois o segundo item em cada seção e assim por diante . Na prática, a sequência de intervalos pode ser qualquer coisa, mas o último intervalo é sempre 1 para finalizar a classificação (efetivamente terminando com uma classificação por inserção comum).
     */


    /*
     O algoritmo abaixo apresenta uma versão que utiliza um gap size decrescente sempre dividindo por 2 (para uma lista de 20 elementos o gapSize ficaria em 10, depois em 5, depois 2, depois finalmente em 1) Ele repete toda a estrutura enquanto o `gapSize` for positivo (1/2 = 0, pois ignoramos os decimais e arredondamos).
     Dentro do loop `for` utilizamos uma variavel auxiliar para ajudar na movimentação dos elementos, o laço `while` que compara `position >= gapSize` é responsável por garantir a repetição de comparações entre os espaços de elementos até o momento que a posicao for menor que o gap, quando isso acontece o laço se encerra para evitar um erro do tipo `Index Out of Bounds` (pois qualquer position sendo menor que o gap resultaria em um acesso negativo).
     Para uma sequência com 10 elementos, com o primeiro incremento, que é 5, o algoritmo divide a sequência em cinco sequências de dois elementos cada, que são ordenadas em separado. Com o segundo incremento, que é 2, algoritmo divide a sequência em duas sequências de cinco elementos cada, que são ordenadas em separado. Com o incremento unitário, o algoritmo faz a inserção linear de sequência completa e ajusta os elementos que ainda estão desordenados. Neste exemplo, o algoritmo faz um total de 29 comparações e 55 instruções de atribuição, para efetuar 11 deslocamentos de elementos necessários para ordenar a sequência, o que é equivalente a, aproximadamente, 18 trocas.
     */
    static func shellSortHalfGapSize(array: [Int]) -> [Int] {
        var sortedArray = array
        var gapSize = sortedArray.count / 2
        var position = 0

        while(gapSize > 0) {
            for i in gapSize..<sortedArray.count {
                let aux = sortedArray[i]
                position = i
                while (position >= gapSize) {
                    if (aux < sortedArray[position - gapSize]) {
                        sortedArray[position] = sortedArray[position - gapSize]
                    } else {
                        break
                    }
                    sortedArray[position - gapSize] = aux
                    position -= gapSize
                }
            }
            gapSize /= 2
        }
        return sortedArray
    }

    /*
     O algoritmo abaixo apresenta uma versão que utiliza um gap size baseado em terços, sempre dividindo por 3 no final da iteração. Para calcular o gap size inicial maior e pegar o último terço da lista ele utiliza um laço `while` isolado. Também faz uso de um duplo laço de repetição `for` para controlar tanto o andamento do gap até o final da lista quanto o decremento do mesmo até uma posição que não cause `Index Out of Bounds`
     */
    static func shellSortThirdGapSize(array: [Int]) -> [Int] {
        var sortedArray = array
        var gapSize = 1

        while gapSize < sortedArray.count / 3 {
            gapSize = 3 * gapSize + 1
        }

        while gapSize >= 1 {
            for i in gapSize..<sortedArray.count {
                for j in stride(from: i, to: gapSize - 1, by: -gapSize) {
                    if sortedArray[j] < sortedArray[j - gapSize] {
                        sortedArray.swapAt(j, j-gapSize)
                    } else {
                        break
                    }
                }
            }
            gapSize /= 3
        }
        return sortedArray
    }
}
