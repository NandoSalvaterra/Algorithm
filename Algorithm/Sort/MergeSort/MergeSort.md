# Merge Sort - Ordenação Merge

**Best Time Complexity:** `O(n log n)`

**Average Time Complexity:** `O(n log n)`

**Worst Time Complexity:** `O(n log n)`

**Space Complexity:** `O(n)`

**Stability:** `Stable` <br/> <br/>


## Introdução

Inventado em 1945 por **John von Neumann**, o `Merge Sort` é um dos mais eficientes algoritmo de ordenação. A ideia por trás dele é aplicar a técnica dividir e conquistar (`Divide and Conquer`) para quebrar um grande problema em pequenos problemas. Um mantra útil para lembrar dele é: dividir primeiro e mergear depois.

Imagine ter uma sequência com dez valores aleatórios e não ordenados. Divida o tamanho em 2 para ter um problema menor e continue fazendo isso até ter dez listas de um único valor, isso é feito para garantir que o `merge` das listas coloque todos os elementos em ordem. O processo vai ser parecer com a imagem abaixo. <br/> <br/>

<img src="https://i.imgur.com/iFFk8h7.png" alt="drawing" width="800"/>

<br/> 

A função `mergeSort(array: [Int]) -> [Int]` tem como objetivo fazer exatamente o que foi exemplificado na imagem acima: dividir a sequência. Para isso usa da abordagem recursiva (chama a si mesma) varias vezes até que que primeira linha falhe na verificação, quando isso acontece, não são executadas as demais linhas de código abaixo e a recursão é parada.

<br/> 

```swift
func mergeSort(array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }

  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
  let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
  
  return merge(left: leftArray, right: rightArray)
}
```

<br/> 

Perceba que depois de encontrado o meio do array pela operação `array.count / 2` é passado dois arrays de forma recursiva para a função, um sendo a primeira metade (`array[0..<middleIndex]`) e o outro sendo a última metade (`array[middleIndex..<array.count]`) e o resultado dessa operação é então enviada a função `merge`.

Depois de feito todo o processo de separação da lista original em listas de um único elemento, começa o processo de `merge` de forma ordenada, para isso utilizaremos o método `merge(left: [Int], right: [Int]) -> [Int]` mostrado abaixo. Sempre feito com somente 2 sub-sequências por vez, esse processo é parecido com o fato de escolher cartas em topos de pilhas de baralho. Pega-se a primeira carta do topo de uma pilha juntamente com a primeira carta do topo da outra pilha e compara-se os valores, pega-se o menor (ou maior, dependendo da ordenação que estiver sendo feita) e coloca na posição inicial de uma sequência auxiliar (`orderedArray`) usada para fazer a ordenação e o `merge` das duas listas. <br/> <br/>


```swift
func merge(left: [Int], right: [Int]) -> [Int] {
  var leftIndex = 0
  var rightIndex = 0

  var orderedArray: [Int] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      orderedArray.append(rightElement)
      rightIndex += 1
    } else { 
      orderedArray.append(leftElement)
      leftIndex += 1
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }

  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }

  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  return orderedArray
}
```

<br/> 

O início da função começa por declarar os índices de controle das sequências da direita e da esquerda, sempre que for encontrado um valor em uma dessas sequências, ele é adicionado na lista auxiliar e o seu índice é incrementado para não olharmos mais para aquele elemento.
O primeiro laço de repetição `while` garante que todos os elementos das duas sequências sejam comparados e adicionados no sequência auxiliar **se e somente se** ambos os índices forem validos e não estourarem um erro do tipo `Out of Bounds`. Quando esse laço termina, podem existir elementos restantes em quaisquer das duas sequências, e para essa situação existe os dois últimos laços `while`. Nesse momento podemos garantir que todos os elementos já estão pré ordenados (afinal estamos dentro de uma função merge de sequências já ordenadas) e podemos seguramente adicioná-los ao final da sequência auxiliar.

O processo de merge é sempre feito de baixo para cima, ou seja, de todas as sequências que contém um único elemento até que se consiga toda a sequência unida novamente, como ilustrado na imagem abaixo. Com a recursividade, os últimos niveis de recursão (aqueles com as listas de um único elemento) vão sendo ordenadas e retornandos para os níveis de cima que termina por odenar a lista da primeira recursão, que equivale a toda sequência. <br/> <br/>

<img src="https://i.imgur.com/J9MFOeV.png" alt="drawing" width="800"/>

<br/>

O método de `merge` desse algoritmo é um processo bastante eficiente com complexidade linear `O(n)`. No melhor caso, quando a sequência está ordenada por ordem crescente, os elementos da segunda metade da sequência são maiores do que os elementos da primeira metade da sequência, pelo que faz apenas **N/2** comparações para fazer a fusão. No pior caso, quando as duas metades da sequência têm elementos alternados em valor, faz **N/2+N/2-1 = N-1** comparações para fazer a fusão intercalada dos elementos.


O Merge Sort tem complexidade linear-logarítmica, mas necessita de memória auxiliar (uma sequência com a mesma dimensão da sequência original) para executar o processo de `merge`, tendo por isso complexidade de espaço **linear** `O(n)`. Esta necessidade de memória extra desfavorece-o em relação aos outros algoritmos de igual complexidade, como são os casos do `Heap Sort` e do `Quick Sort`.
Existe uma implementação alternativa que não precisa de usar uma sequência auxiliar, mas, em vez de usar o princípio de `merge` que tem complexidade linear, usa o princípio de `inserção`, que é menos eficiente porque tem complexidade quadrática.
