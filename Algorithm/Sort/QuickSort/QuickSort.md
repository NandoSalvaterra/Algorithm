# Quick Sort - Ordenação Rápida

**Best Time Complexity:** `O(n log n)`

**Average Time Complexity:** `O(n log n)`

**Worst Time Complexity:** `O(n²)`

**Space Complexity:** `O(n)`

**Stability:** `Unstable` <br/> <br/>


## Introdução


O algoritmo `Quick Sort` é um método de ordenação muito rápido e eficiente, inventado por **Charles Antony Richard Hoare** (também conhecido como **Tony Hoare**) em 1959-1960, quando visitou a **Universidade de Moscovo** como estudante. Naquela época, Hoare trabalhou em um projeto de tradução de máquina para o **National Physical Laboratory** . Ele criou o `Quick Sort` ao tentar traduzir um dicionário de inglês para russo, ordenando as palavras, tendo como objetivo reduzir o problema original em sub-problemas que possam ser resolvidos mais fácil e rápido. Foi publicado em 1962 após uma série de refinamentos.

O `Quick Sort` adota a estratégia de dividir para conquistar (`Divide and Conquer`) que consiste em rearranjar os elementos de modo que os elementos "menores" precedam os elementos "maiores". Em seguida ele ordena as duas sub-listas de elementos menores e maiores recursivamente até que a lista completa se encontre ordenada. Ele uiliza o seguinte principio: escolher um elemento para pivô da sequência e dividi-la em duas partes. Na parte da esquerda colocam-se os valores menores do que o pivô e na parte direita colacam-se os valores maiores do que o pivô. Se cada parte da sequência for sucessivamente dividida em duas partes, e se for aplicado este princípio de forma recursiva, então quando o processo terminar, ao se atingir sequências com apenas um elemento, a sequência está ordenada. O algoritmo base do `Quick Sort` está apresentado abaixo: <br/> <br/>


```swift
func quickSort(array: inout [Int], begin: Int, end: Int) {
        if begin < end {
            let pivot = partition(array: &array, begin: begin, end: end)
            quickSort(array: &array, begin: begin, end: pivot - 1)
            quickSort(array: &array, begin: pivot + 1, end: end)
        }
}
```

<br/> 

A algoritmo utiliza o principio da recursividade para ordenar a partir do método `partition()`, o caso base da recursão (ponto de parada) são as listas de tamanho zero ou um, que estão sempre ordenadas. Esse caso é atingido quando as variáveis `begin` e `end` são iguais ou `begin` é maior que `end`. O processo é finito, pois a cada iteração pelo menos um elemento é posto em sua posição final e não será mais manipulado na iteração seguinte. Também é utilizado um parâmetro do tipo `inout` que modifica a variável original passada por parâmetro ao invês de ter um retorno, o que torna o algoritmo mais eficiente em relação a complexidade de espaço pois não tem necessidade de alocar uma nova sequência na memória, toda a troca é feita `in place` (na própria sequência de entrada).

O resultado do método `partition()` é a posição de um pivô que garante que todos os elementos que estão a sua esquerda são menores que ele, e todos os elementos a sua direita são maiores que ele. Assim sendo, é possível presumir que o pivô está na posição certa, mesmo que todos os valores à direita e à esquerda não estão necessariamente ordenados, a certeza é de que eles são,em ordem, menores e maiores que o pivô. Portanto ao fazer a recursvidade é possível ignorar a posição do pivô como é feito no algoritmo acima. A escolha do pivô e os passos do método `partition()` podem ser feitos de diferentes formas e a escolha de uma implementação específica afeta fortemente a performance do algoritmo. Existem três métodos principais de partição para selecionar o pivô e fazer a separação dos elementos da sequência: as partições de `Hoare`, de `Lomuto` e a `Mediana de Três`.

A partição original de **Charles Antony Richard Hoare** foi proposta para os algoritmos `Quick Select` para seleção do K-ésimo menor (ou maior) elemento de uma sequência e também para o algoritmo `Quick Sort`. Ele escolhe para pivô o elemento inicial da sequência. Em alternativa, pode ser escolhido, por exemplo, o elemento central da sequência ou um elemento aleatório, falaremos mais sobre a importância da escolha de um bom pivô depois. Na versão original, a partição devolve as posições das pesquisas ascendente e descendente (variáveis i e j), porque todos os elementos entre essas posições são iguais ao pivô e já estão ordenados. Assim, as subsequências que vão ser usadas nas invocações recursivas da ordenação são: a primeira parte da sequência é composta pelos elementos das posições begin a j, e a segunda parte da sequência pelos elementos das posições i a end. Nesta implementação é devolvida a posição do pivô, permitindo assim que o algoritmo possa ser implementado em linguagens de programação que nao tem passagem de parâmetros por referência. A partição de `Hoare` é exibida a baixo: <br/> <br/>


```swift
   func hoarePartition(array: inout [Int], begin: Int, end: Int) -> Int {
        var i = begin
        var j = end
        
        var position = begin
        let pivot = array[begin]
        
        repeat {
            while (array[i] < pivot) { i += 1 }
            while (array[j] > pivot) { j -= 1 }
            
            if (i <= j) {
                if (i != j) {
                    array.swapAt(i, j)
                    if (i == position) { position = j }
                    else if (j == position) {  position = i }
                }
                i += 1
                j -= 1
            }
        } while (i <= j)
        if (i < position) {
            array.swapAt(i, position)
            position = i
        } else if (position < j) {
            array.swapAt(j, position)
            position = j
        }
        return position
    }
```

<br/>

Na partição de `Hoare` vemos quatro variáveis importantes para seu funcionamento: `i` e `j` começam no inicio e fim da sequência respectivamente e são para controle das partes direita e esquerda da sequência, elas vão sendo avançadas em direção ao centro e, quando encontram um valor maior que o pivô na parte esquerda (que indica que está no lugar errado) e menor que ele na parte direita (que também indica que está no lugar errado), os loops `while` param e esperam pela sua troca.
O pivô é representado pela variável `pivot` e é utulizado na comparação com os valores que estão nas posições `i` e `j` e vem avançando. Também é necessário uma variável que representa a posição do pivô, aqui chamada de `position`, pois quando existe um elemento maior atrás do pivô, mas não existe um elemento menor à frente do pivô, ou vice-versa, a troca envolve o pivô, o que implica atualizar a sua posição. Todo esse bloco de repetição acontece até que `j` seja menor que `i`, ou seja, os ponteiros se invertem. 
Quando as trocas acabam, pode ser preciso colocar o pivô na posição correta. Se o pivô estiver à frente da posição da pesquisa ascendente, então é necessário trocar esses dois elementos `position` e `i`. Mas, se estiver atrás da posição da pesquisa descendente, então é necessário trocar esses dois elementos `position` e `j`. Este método de partição tem a vantagem de diminuir a possibilidade de o algoritmo cair na situação do pior caso. No entanto, tem a desvantagem de fazer mais comparações do que a partição de Lomuto. Para uma sequência com dimensão N (com N ≥ 2), o varrimento da sequência faz entre N e N+2 comparações para separar os elementos.


```swift
    func lomutoPartition(array: inout [Int], begin: Int, end: Int) -> Int {
        let pivot = array[begin]
        var position = begin
        
        for i in stride(from: begin + 1, through: end, by: 1) {
            if (array[i] < pivot) {
                position += 1
                if (i != position) { array.swapAt(i, position) }
            }
        }
        array.swapAt(begin, position)
        return position
    }
```

```swift
    func lomutoPartitionVariation(array: inout [Int], begin: Int, end: Int) -> Int {
        let pivot = array[end]
        var i = begin
        
        for j in begin..<end {
            if array[j] <= pivot {
                (array[i], array[j]) = (array[j], array[i])
                i += 1
            }
        }
        (array[i], array[end]) = (array[end], array[i])
        return i
    }
```


/// PARTE DO LIVRO AQUI EM BAIXO



/// ALGORITMO AQUI





/// ALGORITMO AQUI




A partição de Lomuto, que se apresenta no Algoritmo 3.13, escolhe para pivô o elemento inicial da sequência. Se o elemento inicial da sequência for um dos menores (ou um dos maiores) elementos da sequência, as duas partes da sequência podem ficar muito desiguais, prejudicando assim o desempenho do algoritmo, aumentando a possibilidade de este cair na situação do pior caso. No entanto, tem a vantagem de fazer menos comparações do que os outros métodos de partição. Para uma sequência com dimensão N (com N >= 2), o varrimento da sequência faz N-1 comparações para separar os elementos.


/// ALGORITMO AQUI


Vamos mostrar como funciona este método de partição na Figura 3.15. Inicialmente, o pivô é o elemento inicial da sequência e depois os restantes elementos da sequência são comparados com ele. Quando na posição em análise está um elemento menor do que o pivô, a posição final do pivô (variável pos) é incrementada para a posição seguinte. Nessa posição, ou está um elemento maior do que o pivô e os dois elementos são trocados, ou está o elemento em análise (se i for igual a pos) e, nesse caso, não é feita a troca, por uma questão de eficiência. Quando a análise dos elementos da sequência termina, o pivô é colocado na sua posição final por troca com o último elemento menor do que o pivô.


// IMAGEM AQUI

A partição Mediana de três, que se apresenta no Algoritmo 3.14, começa por escolher os três seguintes elementos da sequência: o elemento inicial, o elemento central e o elemento final. Depois, ordena esses três elementos colocando: o elemento menor na posição inicial da sequência, o elemento mediano na posição central da seguência, que vai ser o pivô, e o elemento maior na posição final da sequência.


/// ALGORITMO AQUI

De seguida, como se mostra na Figura 3.16, percorre a sequência da esquerda para a direita para encontrar elementos maiores do que o pivô e da direita para a esquerda para encontrar elementos menores do que ele. Caso existam, troca-os para fazer a separação dos elementos. No entanto, quando existe um elemento maior atrás do pivô, mas não existe um elemento menor à frente do pivô, ou vice-versa, a troca envolve o pivô - que é recolocado na posição anterior ou seguinte - o que implica em atualizar a sua posição. Quando as trocas acabam, todos os elementos menores que o pivô estão à sua esquerda e todos os elementos maiores do que ele estão a sua direita, sendo que o pivô pode, casualmente ter sido deslocado da posição central onde se encontrava inicialmente.

// IMAGEM AQUI



Esto método de partição tem a vantagem de minimizar a possibilidade de o algoritmo cair na situação do pior caso. Para que isso aconteça, é preciso que dois dos três elementos escolhidos sejam sistematicamente os dois menores (ou os dois maiores) elementos das sucessivas partições da sequência. No entanto, tem a desvantagem de fazer mais comparações do que a partição de Lomuto. Tal como a partição de Hoare, para uma sequência com dimensão N (com N >= 2), o varrimento da sequência faz entre N e N+2 comparações para separar os elementos.

Existe uma versão alternativa desta partição, que reduz as trocas que envolvem o pivô. Após a escolha do pivô, ele é escondido na penúltima posição da sequência. Os elementos são analisados e trocados até serem todos comparados com o pivô. Quando a análise termina, o pivô é colocado no local, por troca com o elemento que está na posição mais à esquerda da sequência que é maior do que ele, ou seja, com o elemento que está na posição i. O Algoritmo 3.15 apresenta a versão otimizada desta partição.

/// ALGORITMO AQUI

A figura abaixo apresenta a execução do algoritmo para uma sequência com dez elementos utilizando a partição Mediana de três. Os elementos que servem de pivô aparecem a cheio, para se distinguirem dos restantes elementos. O algoritmo faz um total de 28 comparaçoes e 19 trocas de elementos, se for usada a primeira versão, ou um total de 30 comparações e 17 trocas de elementos, se for usada a segunda versão. Se fosse utilizada a partição de Lomuto, o algoritmo faria 33 comparações e 16 trocas de elementos. Este é um mau exemplo da utilização da partição de Lomuto, porque vai fazendo algumas partições muito desiguais. A utilização da partição de Hoare implica a implementação de uma função para gerar aleatoriamente a posição do pivô. Se, por exemplo, a programarmos para escolher sempre o elemento central da sequência, neste caso, a ordenação da sequência fa 27 comparações e 9 trocas de elementos.


/// Falar sobre a importancia de escolher um bom pivot
