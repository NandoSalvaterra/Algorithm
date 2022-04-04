# Insertion Sort - Ordenação por Inserção

**Best Time Complexity:** `O(n)`

**Average Time Complexity:** `O(n²)`

**Worst Time Complexity:** `O(n²)`

**Space Complexity:** `O(1)`

**Stability:** `Stable` <br/> <br/>


## Introdução

A ordenação por inserção (`Insertion Sort`), é um algoritmo de ordenação que, dado uma sequência (array, lista) constrói uma sequência final com um elemento de cada vez, uma inserção por vez. Assim como outros algoritmos de ordenação quadrática, é bastante eficiente para problemas com pequenas entradas, sendo o mais eficiente entre os algoritmos desta ordem de classificação.

Podemos fazer uma comparação do `Insertion Sort` com o modo como algumas pessoas organizam um baralho num jogo de cartas. Imagine que você está jogando ás cartas. Você está com as cartas na mão e elas estão ordenadas. Você recebe uma nova carta e deve colocá-la na posição correta da sua mão de cartas, de forma a que as cartas obedeçam à ordenação.
A cada nova carta adicionada à sua mão de cartas, a nova carta pode ser menor que algumas das cartas que você já tem na mão ou maior, e assim, você começa a comparar a nova carta com todas as cartas na sua mão até encontrar sua posição correta. Você insere a nova carta na posição correta, e, novamente, a sua mão é composta de cartas totalmente ordenadas. Então, você recebe outra carta e repete o mesmo procedimento. Então outra carta, e outra, e assim em diante, até não receber mais cartas.
Esta é a ideia por trás do Insertion Sort. Percorre as posições da sequência, começando com o índice 1. Cada nova posição é como a nova carta que você recebeu, e você precisa inseri-la no lugar correto na sub-sequência ordenada à esquerda daquela posição.
Algoritmos desse tipo aplicam a estratégia de dividir para conquistar (Divide and Conquer). Durante o processo de ordenação, a sequência está dividida em duas partes: a parte inicial da sequência está ordenada e a parte final está desordenada. A cada iteração do algoritmo, um elemento é retirado da parte desordenada e deslocado para a parte ordenada.

<br/>

```swift
func insertionSort(array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 1..<(sortedArray.count) {
            let aux = sortedArray[i]
            var position = i - 1
            while(position >= 0 && sortedArray[position] > aux) {
                sortedArray[position + 1] = sortedArray[position]
                position -= 1
            }
            sortedArray[position + 1] = aux
        }
        return sortedArray
}
```

<br/>


<img src="https://i.imgur.com/0NYvJQR.gif" />



O algoritmo começa por considerar que o primeiro elemento da sequência como já ordenado (pois uma mão de uma única carta ja está ordenado por si só) e depois ordena os restantes elementos da sequência, ou seja, desde o segundo ao último elemento. Cada elemento a ordenar é previamente copiado para uma variável temporária (aux), de forma a abrir uma posição live que permita o deslocamento dos elementos que estão atrás de si, ou seja, na parte ordenada da sequência, e que são maiores do que ele. Enquanto houver elementos na parte ordenada da sequência, maiores do que o elemento a ordenar, eles são deslocados uma posição para a frente. Quando o deslocamento dos elementos termina, o elemento a ordenar é colocado na posição que foi aberta pelo deslocamento dos elementos. Se o elemento já estiver na posição correta, porque é maior do que todos os que estão atrás de si, então não há deslocamento de elementos. Nesta situação, é feita uma instrução de cópia inutilmente. Esta ineficiência é caracteristica do Insertion Sort.

O algoritmo faz praticamente tantas comparações quantos deslocamentos. Mais concretamente, para ordenar cada elemento faz mais uma comparação do que deslocamentos, de modo a poder detetar o fim dos deslocamentos. Para uma sequência de 10 elementos o algoritmo faz um total de 31 comparações e 25 deslocamentos de elementos para ordenar a sequência.

Portanto, em termos de comparações, esse algoritmo (tendo em atenção o pior caso e o caso médio) tem complexidade quadrática O(N²), mas tem um caso médio melhor do que o Bubble Sort. Se a sequência estiver parcialmente desordenada, este é o melhor algoritmo de ordenação de todos os algoritmos simples com complexidade quadrática. No entanto, este algoritmo tem um problema; se os elementos da sequência estiverem muito longe do sítio de inserção, o seu arrastamento até ao local de inserção custa muitas operações de cópias de elementos. Existe uma implementação otimizada deste algoritmo criada em 1959 por Donald L. Shell (Shell Sort), que, em vez de comparar elementos adjacentes, compara elementos distanciados de um incremento que vai sendo, progressivamente diminuído até qua na última passagem compara elementos adjacentes. Assim a inserção de elementos distantes é feita de forma mais rápida.


<br/>
<br/>

## Recursive Insertion Sort

A Ordenação por Inserção Recursiva não tem vantagens de desempenho/implementação, mas pode ser uma boa pergunta para verificar a compreensão de Ordenação por Inserção e recursão.
Se olharmos mais de perto o algoritmo de Ordenação por Inserção, mantemos os elementos processados ​​ordenados e inserimos novos elementos um a um no array ordenado.
Ideia de recursão.
 

Caso Base: Se o tamanho do array for 1 ou menor, retorne.
Classifique recursivamente os primeiros n-1 elementos.
Insira o último elemento em sua posição correta no array ordenado.
Abaixo está a implementação da 

<br/>

```swift
func recursiveInsertionSort(array: inout [Int], size: Int) {
        if size <= 1 { return }
        recursiveInsertionSort(array: &array, size: size - 1)
        let last = array[size - 1]
        var j = size - 2

        while (j >= 0 && array[j] > last) {
            array[j+1] = array[j]
            j = (j - 1)
        }
        array[j+1] = last
 }

```

<br/>

asduhshudhuda
sadsuahdsuhadhusad
asdsauhdhusahudsahud

<br/>

0 Algoritmo abaixo apresenta uma abordagem recursiva pelo método de `merge` muito parecido com o algoritmo `Merge Sort` para fazer a ordenação crescente da sequência. Aplica-se de forma recursiva o princípio de inserção para ordenar uma sequência, partindo-a sucessivamente ao meio e fazendo a inserção linear eficiente das sequências parcelares já ordenadas. Este princípio é aplicado recursivamente até que as sequências obtidas sejam apenas compostas por um único elemento, acabando por ordenar a sequência.
A operação de `merge` das sequências `mergeInsertionSort`, que constitui a parte não recursiva do algoritmo, é que faz efetivamente a ordenação da sequência, através da inserção linear
das duas partes já ordenadas de uma sequência. Mais concretamente, insere a segunda metade na primeira metade, obtendo assim a sequência totalmente ordenada.

<br/> 

```swift
func recursiveMergeInsertionSort(array: inout [Int], start: Int, end: Int) {
        if start < end {
            let middle = (start + end) / 2
            recursiveMergeInsertionSort(array: &array, start: start, end: middle)
            recursiveMergeInsertionSort(array: &array, start: middle + 1, end: end)
            mergeInsertionSort(array: &array, start: start, middle: middle, end: end)

        }
}


func mergeInsertionSort(array: inout [Int], start: Int, middle: Int, end: Int) {
        var left = start
        for i in stride(from: (middle + 1), through: end, by: 1) {
            let temp = array[i]
            var shift = i
            while(shift > left && array[shift - 1] > temp) {

                array[shift] = array[shift - 1]

                shift -= 1
            }
            if (shift != i)  { array[shift] = temp }
            left = (shift + 1)
        }
}
```

<br/> 


Para minimizar o número de comparações, o algoritmo usa a posição onde inseriu o elemento anteriormente deslocado (variável `shift`) no ciclo de deslocamento dos elementos seguintes (variável `left`). Inicialmente, a posição de inserção left é igual à posição inicial da sequência (parâmetro `start`), sendo depois atualizada com `shift + 1`.
Para ordenar a mesma sequência de 10 elementos, o algoritmo faz um total de 34 comparações para mergear as sequências parcelares e executa 49 instruções de atribuição para fazer os deslocamentos de elementos, típico do processo de inserção linear. Este número de cópias é equivalente a, aproximadamente, 16 trocas. Quando comparado com a versão linear sem recursividade, tal como seria de esperar, vemos que esta versão faz mais comparações, devido ao facto de o processo de inserção não tirar totalmente partido das subsequências ja estarem ordenadas, mas faz menos trocas porque o processo de inserção trabalha sobre a própria sequência.

Para o melhor caso temos a complexidade linear `O(n)` idêntica à inserção não recursiva, e no o pior caso temos complexidade quadrática `O(n²)` também idêntica a inserção não recursiva, ou seja, nos casos limites (melhor e pior casos) a implementação recursiva com método `merge` não alterou a complexidade deste método de ordenação.
Já para o caso médio, temos complexidade quadrática `O(n²)` muito semelhante, mas ligeiramente
superior para grandes valores de `N`, à inserção não recursiva. Os resultados experimentais demonstram que o número de comparações é ligeiramente inferior. Podemos concluir então que a implementação recursiva usando o método de `merge` do `Insertion Sort` **não tem qualquer vantagem sobre a implementação repetitiva**.
