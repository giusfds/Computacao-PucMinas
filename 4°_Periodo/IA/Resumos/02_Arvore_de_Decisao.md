# **Árvore de Decisão**

## **Introdução**

O objetivo da árvore de decisão é "inferir" ou "descobrir" uma regra para um problema.

- Exemplo: Descobrir se um cliente vai ou não esperar por uma mesa em um restaurante a partir de várias variáveis, como se ele está com fome ou não, se já é um cliente recorrente ou não, etc.
    
- É simples e de fácil interpretação.
    
- Navalha de _Occam_: quanto mais simples melhor.
    

A complexidade de uma árvore de decisão é medida por:

- Número total de **nós**.
    
- Número total de **folhas**.
    
- **Profundidade** da árvore.
    
- Número de **atributos**.
    

Pode ser interpretada como uma **disjunção de conjunções** de regras, em que cada caminho da árvore é uma regra.

- **Árvore de Classificação**: Quando uma árvore de decisão é usada para tarefas de **classificação**.
    
- **Árvore de Regressão**: Quando uma árvore de decisão é usada para tarefas de **regressão**.
    

## **Estrutura**

- **Nós** = Testes para variáveis.
    
- **Ramos** = Resultados dos testes.
    
- **Folhas** = Classificação.
    

## **Como Gerar uma Árvore de Decisão**

### 1. Definir os Conceitos do Problema

- Dado um conjunto de dados **D**, queremos classificar as instâncias em categorias (classes).
    
- Cada instância é descrita por **atributos (features)** e uma **classe alvo**.
    
- O objetivo é construir uma **árvore de decisão** que **divide os dados** iterativamente até que todos os exemplos em um nó pertençam à mesma classe.

### 2. Escolher o Melhor Atributo para Dividir os Dados

O esquema usado na aprendizagem de árvores de  decisão para selecionar atributos é projetado para  minimizar a profundidade da árvore final.

A ideia é escolher o atributo que vá o mais longe possível na tentativa de fornecer uma classificação exata dos exemplos.

#### Ganho de Informação (Information Gain - IG)

Medido com base na **Entropia** ($E$), que representa a incerteza do conjunto de dados. A entropia é derivada da teoria da informação e é utilizada para determinar a qualidade de uma divisão (*split*) dos dados em uma árvore de decisão.

A fórmula da entropia para um conjunto $S$ é:

$$
E(S) = - \sum_{i=1}^{c} p_i \log_2(p_i)
$$

onde:

- $Pi$: Refere-se à probabilidade de um dado elemento pertencer à classe $i$. Ou seja, é a razão entre a quantidade de elementos da classe $i$ e o total de elementos no conjunto $S$.

- $\log_2(pi)$: Refere-se ao logaritmo de base 2 da probabilidade $pi$. A escolha da base 2 está relacionada com o fato de a entropia ser medida em “*bits*” na teoria da informação. 

> [!IMPORTANT]
> Se desejar que o ganho e a entropia esteja entre $0$ e $1$, a base do log precisa ser igual ao número de classes.

- Sinal negativo $(-)$: Garante que a entropia seja um valor positivo, pois os logaritmos de probabilidades são números negativos (quando $pi$ < $1$)

> [!NOTE] Nota
> **Entropia alta**: Quando a entropia é alta, significa que as classes estão bem misturadas, ou seja, há uma incerteza maior. Isso indica que o conjunto de dados é "impuro" em termos de classificação.
> 
> **Entropia baixa**: Quando a entropia é baixa, o conjunto de dados é mais homogêneo. Se todos os exemplos em $S$ pertencem à mesma classe, a entropia será zero, representando total pureza e ausência de incerteza.

O **ganho de informação** de um atributo é calculado como:

$$
Ganho(atributo)  = Entropia(classe) - Entropia(atributo)
$$

$$
Entropia(atributo) = \sum_{i=1}^{v} \frac{p_i+n_i}{p+n} I (\frac{p_i}{p+n}, \frac{n_i}{p_i+n_i})
$$

$$
I (\frac{p_i}{p+n}, \frac{n_i}{p_i+n_i}) = -\frac{p}{p+n} * \log_2(\frac{p}{p+n}) -\frac{n}{p+n} * \log_2(\frac{n}{p+n})
$$

> [!TIP]
> A heurística usada na função ESCOLHER-ATRIBUTO é simplesmente escolher o **atributo** com o **maior ganho**.

---
#### Índice de Gini

Outra métrica usada para medir a impureza de um nó:

$$
Gini(S) = 1 - \sum_{i=1}^{c} p_i^2
$$

Quanto menor o índice, mais puro o nó.

### 3. Construir Recursivamente a Árvore

O algoritmo ID3 segue uma abordagem recursiva para dividir os dados:

1. **Se todos os exemplos pertencem à mesma classe, crie um nó folha.**
    
2. **Se não, escolha o melhor atributo** usando o **ganho de informação** (ou outra métrica como Gini).
    
3. **Divida o conjunto de dados** em subconjuntos baseados nos valores desse atributo.
    
4. **Para cada subconjunto, repita o processo recursivamente** até atingir um critério de parada.
    
5. **Se não houver atributos restantes, crie um nó folha com a classe mais comum**.

### 4. Critérios de Parada

A recursão pode parar se:

- Todos os exemplos em um nó pertencem à mesma classe.
    
- Não há mais atributos para dividir (neste caso, usa-se a classe mais frequente no nó como saída).
    
- Um limite de profundidade foi atingido.
    
### 5. Poda da Árvore (Opcional)

Após a construção da árvore, podemos realizar **poda** para evitar **overfitting**. Existem dois tipos principais:

- **Pré-poda**: Define um critério para parar a construção antes que a árvore fique muito complexa.
    
- **Pós-poda**: Remove ramos que têm baixo impacto na classificação.


## **Como Funciona o Algoritmo**

A ideia base do algoritmo é:

1. Escolher um atributo.

2. Estender a árvore adicionando um ramo para cada valor do atributo.

3. Passar os exemplos para as folhas (tendo em conta o valor do atributo escolhido).

4. Para cada folha:
	1. Se todos os exemplos são da mesma classe, associar essa classe à folha 2.  
	2. Senão repetir os passos 1 a 4.


## **Vantagens e Desvantagens**

### Vantagens

- Flexibilidade = Árvores de decisão não assumem nenhuma distribuição para os dados. Elas são métodos não paramétricos. O espaço de objetos é dividido em subespaços, e a cada subespaço é ajustado com diferentes modelos. Uma árvore de decisão fornece uma cobertura exaustiva do espaço de instâncias.

- Seleção de atributos = O processo de construção de uma árvore de decisão seleciona os atributos a usar no modelo de decisão. Essa seleção de atributos produz modelos que tendem a ser bastante robustos contra a adição de atributos irrelevantes e redundantes.

- Interpretabilidade = Decisões complexas e globais podem ser aproximadas por uma série de decisões mais simples e locais. Todas as decisões são baseadas nos valores dos atributos usados para descrever o problema.

- Eficiência = O algoritmo para aprendizado de árvore de decisão é um algoritmo guloso que é construído de cima para baixo (*top-down*), usando uma estratégia dividir para conquistar sem *backtracking*. Sua complexidade de tempo é linear com o número de exemplos.

### Desvantagens

- Valores ausentes = Algoritmos devem empregar mecanismos especiais para abordar falta de valores.

- Atributos contínuos = Problema com ordenação. Alguns autores estimam que a operação de ordenação consuma 70% do tempo necessário para induzir uma árvore de decisão em grandes conjuntos de dados com muitos atributos contínuos.

- Instabilidade = Pequenas variações no conjunto de treinamento podem produzir grande variações na árvore final. Há uma forte tendência a inferência feitas próximo das folhas serem menos confiáveis que aquelas feitas próximas da raiz.


## **Métricas de Avaliação**

### Avaliar Qualidade dos Modelos

- Em problemas de **classificação**, avaliar pela matriz de confusão.  

- Em problemas de **agrupamento**, avaliar utilizando-se métricas específicas tal como *silhouette index*.

- Em problemas de **regressão**, utilizam-se as métricas: 
	- *Mean squared error (MSE)*.
	- *Mean absolute error (MAE)*.
	- *Normalized MSE and MAE*.

- Em problemas de **associação**, utilizam-se as métricas suporte, confiança, *lift*, dentre outras

#### Avaliar pela Matriz de Confusão

- Taxa de Verdadeiro Positivo $(VP)$ = equivale ao número de acerto do classificador para cada classe.

- Taxa de Falso Negativo $(FN)$ = equivale ao número de erro do classificador para cada classe.

- Taxa de Falso Positivo $(FP)$ = são as instâncias que não são da classe que estou considerando, mas foram classificadas como sendo.

- Taxa de Verdadeiro Negativo $(VN)$ = são as instâncias que são da classe que estou considerando, e foram classificadas como não sendo.

- Precisão = taxa de instâncias corretamente classificadas como pertencentes a classe em questão dentre todos os que foram classificados na classe em questão.

$$
Precision = \frac{VP}{VP+FP}
$$

- Sensibilidade ou *Recall* = taxa de instâncias corretamente classificadas como pertencentes a classe em questão dentre todos os que realmente são da classe em questão.

$$
Recall = \frac{VP}{VP+FN}
$$

- Acurácia = taxa total instâncias corretamente classificadas.

$$
Ac = \frac{VP + VN}{VP + VN + FP + FN}
$$

- *F-Measure* ou F1 Score = média **harmônica** entre precisão e sensibilidade, atribuindo a mesma importância para o *recall* e precisão.

$$
F1 = \frac{2 * recall * precision}{recall + precision}
$$

- Para atribuir importância diferente a estas duas métricas, a equação seria:

$$
F1 = \frac{(w+1) * recall * precision}{recall + precision}
$$