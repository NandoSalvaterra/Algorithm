# Sorting Algorithms - Algoritmos de Ordenação

## Introdução

Uma das tarefas mais comuns nas aplicações informáticas é a pesquisa de informação. Mas quanto mais ordenada estiver a informação, mais eficiente poderá ser o método de pesquisa, por isso é que a ordenação da informação também é uma tarefa muito comum.

A ordenação é o processo de organizar um conjunto de elementos segundo uma determinada ordem, admitindo que os elementos são comparáveis e ordenáveis. Podemos ordenar informação numérica ou alfabética (`Strings`), ou ainda registros de bases de dados, sendo que neste caso eles são ordenados pela sua chave primária do registo que identifica o elemento. Se a informação estiver ordenada, é possivel utilizar algoritmos de pesquisa mais eficientes. Assim, a ordenação é uma tarefa muito importante no processamento de dados e é feita para facilitar a pesquisa. Mas, também é usada em algoritmos mais complexos, para pré ou pós-ordenar a informação processada. No entanto, a ordenação (assim como a pesquisa e a seleção) é computacionalmente dispendiosa, porque a sequência pode ser constituída por centenas, ou mesmo milhares, de elementos, pelo que exige o desenvolvimento de algoritmos eficientes.

## Tipagem e Categorias

Os algoritmos de ordenação são classificados em dois tipos: a ordenação de informação armazenada em sequências designa-se por **ordenação interna** e a ordenação de informação armazenada em ficheiros designa-se por **ordenação externa**. Vamos apresentar apenas algoritmos de ordenação interna, se bem que um deles também possa ser usado para fazer ordenação externa. Um algoritmo de ordenação diz-se estável quando preserva a ordem relativa de elementos repetidos existentes a sequência. Existem algoritmos de ordenação que não utilizam memória extra, à parte de algumas, poucas, variáveis auxiliares. Ou seja, ordenam os elementos da sequência na própria sequência fazendo para o efeito um rearranio interno dos seus elementos. Por outro lado, existe um algoritmo de ordenação que necessita de uma sequência extra para servir de suporte para a sequência que vai ser ordenada. Mas, em contrapartida, ele também pode ser usado para ordenar informação armazenada em ficheiros.

Os algoritmos de ordenação têm duas operações básicas: a comparação de elementos e a troca de elementos. Em alternativa às trocas, alguns algoritmos fazem deslocamentos ou cópias de elementos. A dimensão de entrada do problema é o número de elementos da sequência. Uma vez que uma sequência pode ter elementos repetidos, quando referimos **ordenação crescente** e **ordenação decrescente**, para sermos mais corretos, deviamos referir, respetivamente, **ordenação não decrescente** e **ordenação não crescente**.

## Métodos de Ordenação

Existem algoritmos de ordenação que são simples mas pouco eficientes `O(N²)` - complexidade quadrática, pelo que só devem ser usados para ordenar sequências de pequenas dimensões. Estes algoritmos de ordenação simples enquadram-se num dos três métodos seguintes: **ordenação por seleção**, **ordenação por troca** e **ordenação por inserção**.

Os algoritmos de ordenação por seleção utilizam a pesquisa sequencial, ou seja, apicam a estratégia de força bruta (`Brute Force`). Eles fazem passages sucessivas sobre todos os elementos de uma parte da sequência e, em cada passagem, selecionam o elemento de menor valor de todos os elementos analisados, no caso de se pretender uma ordenação crescente, ou, em alternativa, o elemento de maior valor de todos os elementos analisados, no caso de se pretender uma ordenação decrescente, colocando esse valor nas sucessivas posições iniciais da sequência. Em cada passagem, um elemento, de entre todos os restantes elementos da sequência ainda não ordenados, é colocado no lugar certo. Mais concretamente, no caso de uma ordenação crescente, na primeira passagem o menor valor de todos fica colocado na primeira posição da sequência, na segunda passagem o segundo menor valor fica colocado a segunda posição da sequência, e assim sucessivamente, até que na última passagem o penúltimo menor valor, ou seja, o segundo maior valor fica colocado na penúltima posição da sequência e, naturalmente, o maior valor fica automaticamente colocado a última posição da sequência.

Existem dois algoritmos simples que aplicam este método de ordenação: o **Sequencial** (`Sequential Sort`), também designado por `Exchange Sort` e o **Seleção** (`Selection Sort`). O algoritmo de ordenação **Heap** (`Heap Sort`) também se poderia considerar um algoritmo por seleção, mas é muito mais eficiente do que os dois algoritmos acima - tem complexidade linear-logaritmica. Ele seleciona sucessivamente o maior elemento da sequência e coloca-o nas sucessivas posições finais da sequência. No entanto, este algoritmo aplica a estratégia de dividir para conquistar (`Divide and Conquer`), processando uma sequência (array) como se fosse um **amontoado binário** (`Binary Heap`). Ao transformar o array em um amontoado binário, tira vantagem da maior eficiência dos algoritmos desta estrutura de dados para extrair sucessivamente o maior valor de todos e colocá-lo na parte final ordenada da sequência (do fim para o início), até o menor valor ficar automaticamente colocado na primeira posição da sequência.

Os algoritmos de ordenação por troca também aplicam uma estratégia do força bruta. Eles fazem passagens sucessivas sobre a sequência, comparando elementos adjacentes, que, caso estejam fora de ordem, são trocados. Quando durante uma passagem, não se tiver efetuado qualquer troca, então é sinal de que os elementos consecutivos já estão ordenados, pelo que a ordanação termina, Existem dois algoritmos que aplicam este método de ordenação: o **Bubble** (`Bubble Sort`) e o **Shaker** (`Shaker Sort).

Os algoritmos de ordenação por inserção aplicam uma estratégia de dividir para conquistar (`Divide and Conquer`). Eles determinam, para cada elemento da sequência, a sua posição de inserção para que a sequência fique ordenada, deslocando para o efeito os restantes elementos. Durante o processo de ordenação, a sequência encontra-se dividida em duas partes: a parte ordenada e a restante parte da sequência com elementos ainda não processados. Cada elemento ainda por ordenar é deslocado para a parte ordenada até ser colocado na posição correta. Existem dois algoritmos que aplicam este método de ordenação: o **Inserção** (`Insertion Sort`) e o de **Shell** (`Shell Sort`), sendo que este último atua por etapas e só na última etapa é que aplica o princípio de inserção a elementos adjacentes.

Em contrapartida, existem algoritmos que são muito eficientes (complexidade linear--logarítmica) e que podem ser usados para ordenar sequências de grandes dimensões. Estes algoritmos complexos aplicam a estratégia de dividir para conquistar (`Divide and Conquer`) de forma recursiva e enquadram-se num dos dois métodos seguintes: **ordenação por fusão** e **ordenação por separação**. separação. A estratégia de dividir para conquistar ordena uma sequência, aplicando sucessivamente de forma recursiva a partição da sequência em duas sequências parcelares até que tenham apenas um elemento. Na ordenação por fusão como o algoritmo **Merge** (`Merge Sort`), a partição da sequência, que consiste em calcular metade do número de elementos, apenas define as duas subsequências da próxima invocação recursiva. Depois, é o processo de fusão das sequências parcelares já ordenadas que as combina para obter a sequência final ordenada. Na ordenação por separação, algoritmo **Quick** (`Quick Sort`), é a separação dos elementos (elementos menores do que um elemento pivô previamente escolhido para um lado e elementos maiores do que o pivô para outro lado) que faz a ordonação e que define as duas subsequências (não necessariamente equilibradas em número de elementos) da próxima invocação recursiva.

Existe ainda o principio de ordenação por distribuição, cujo único algoritmo que o apilca (`Radix Sort`) não será estudado neste momento.

## Algoritmos de ordenação **Estáveis** e **Não Estáveis**

Um algoritmo de ordenação é considerado estável (`Stable`) quando ordena elementos iguais na mesma ordem em que aparecem na sequência de entrada desordenada. Por exemplo, em um algoritmo de ordenação de cartas de baralho, as cartas são classificadas por seu valor, mas seu naipe está sendo ignorado. Isso permite a possibilidade de várias versões diferentes ordenadas corretamente da lista original (listas ordenadas com 5 de copas aparecendo na frente do 5 de espadas e etc). Algoritmos de ordenação estáveis ​​escolhem um deles, de acordo com a seguinte regra: se dois itens se comparam como iguais (como as duas cartas 5), então sua ordem relativa será preservada, ou seja, se um vier antes do outro na entrada, virá antes do outro na saída.

A estabilidade é importante para preservar a ordem depois de passar por várias ordenações no mesmo conjunto de dados. Por exemplo, digamos que os registros dos alunos que consistem em nome e seção de classe (4 série A, 4 série B e etc) são classificados dinamicamente, primeiro por nome e depois por seção de classe. Se um algoritmo de classificação estável for usado em ambos os casos, a operação de classificação por seção de classe não alterará a ordem dos nomes; com uma classificação instável, pode ser que a classificação por seção embaralhe a ordem dos nomes, resultando em uma lista não alfabética de alunos.

Mais formalmente, os dados que estão sendo ordenados podem ser representados como um registro ou tupla de valores, e a parte dos dados que é usada para classificação é chamada de chave. No exemplo das cartas, as cartas são representadas como uma classe (`Orientação a Objetos`) com 2 atributos: número e naipe, e a chave é o número. Um algoritmo de ordenação é estável se sempre que houver dois registros R e S com a mesma chave, e R aparecer antes de S na lista original, então R sempre aparecerá antes de S na lista ordenada também. 

### **Quando isso se torna um problema?**

A primeira coisa que vem a mente é: Ao ordenar uma lista de números, isso não vai trazer problema nenhum, pois não tem como saber a diferença se dois números iguais aparecerem na lista certo? O mesmo vale para casos onde não existem elementos com a mesma chave (`key`) usada para fazer a ordenação. Portanto a regra é: Quando elementos iguais são indistinguíveis, como com listas que só contém `Ints` ou qualquer dado em que o elemento todo é a chave (Listas de `Strings`, `Doubles` e tipos primitivos), a estabilidade não é um problema, pois não são passíveis de serem diferenciados um dos outros. A estabilidade também não é um problema se todas as chaves forem diferentes, porque por motivos óbvios todo elemento ficará na posição correta e sem duplicatas.

A estabilidade se torna um problema quando estamos trabalhando com estruturas de dados compostos como `Classes` e `Structs`. Para exemplificar imagine um sistema escolar onde todos os alunos estão agrupados no banco de dados com a seguinte estrutura: 
\
&nbsp;
 ![](https://i.imgur.com/8tE30FI.png)

Como podemos ver, cada aluno tem 3 propriedades: `Name`, `Age` e `Class`. Agora vamos ordenar a lista por ordem alfabética usando qualquer algoritmo de ordenação, seja estável ou não estável:
\
&nbsp;
 ![](https://i.imgur.com/RI2qzMl.png)

Agora temos uma lista ordenada alfabeticamente. Porém, em um segundo momento, caso alguem decida ordenar a lista agora pela classe para que cada professor tenha acesso a lista de alunos de cada classe, usar um algoritmo estável ou não estável faz toda diferença. Caso um algoritmo não estável seja usado, a ordenação feita no primeiro momento é totalmente perdida, levando a um resultado que não é interessante para os professores:
\
&nbsp;
 ![](https://i.imgur.com/A7R5SXM.png)

Como podemos ver, após uma segunda ordenação (pela classe) a primeira que foi feita (pelo nome) foi totalmente perdida, pois `Carlos` aparece na frente de `Ana` e `Rafael` aparece na frente de `Lucas`. Essa é a caracteristica de um algoritmo de ordenação não estável, não respeitar a ordem de entrada dos elementos na sequência original (antes da ordenação). Ao realizar a mesma ordenação usando um algoritmo estável, o resultado muda: 
\
&nbsp;
 ![](https://i.imgur.com/lmZMOZY.png)

Agora o resultado leva em consideração a ultima ordenação realizada (por classe), porém o resultado também é ordenado por ordem alfabética, que foi a ordenação previamente feita, pois algoritmos estáveis preservam a ordem de entrada dos elementos que contém a mesma chave.
