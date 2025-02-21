# Lista 1 - Inteligência Artificial (IA)

### 1- Assista o documentário da NetFlix *Coded Bias* e faça um breve resumo

O documentário Coded Bias (2020) mostra como a tecnologia pode reforçar preconceitos, em vez de ser neutra. A pesquisadora Joy Buolamwini, do MIT, descobre que sistemas de reconhecimento facial falham ao identificar rostos de mulheres negras, levantando questionamentos sobre justiça e equidade. O filme alerta para o viés nos algoritmos, a falta de privacidade e o impacto dessas falhas em grupos marginalizados. Com entrevistas de especialistas, defende a necessidade de regras e transparência para um uso mais ético da tecnologia.

------

### 2- Explique o significado dos seguintes tipos de problemas de aprendizado de máquina e forneça pelo menos 1 exemplo para cada tipo de problema

1) ``Classificação``: É um tipo de problema de aprendizado de máquina que envolve a previsão de rótulos de classes. Por exemplo, classificar e-mails como spam ou não spam, identificar se uma transação é fraudulenta ou não, prever se um paciente tem ou não uma doença com base em seus sintomas. A classificação geralmente é usada para problemas onde a saída é uma categoria ou rótulo.

2) ``Regressão``: É um tipo de problema de aprendizado de máquina que envolve a previsão de valores contínuos. Por exemplo, prever o preço de uma casa com base em suas características, prever a quantidade de vendas de um produto, prever a temperatura de um local. A regressão é adequada para situações onde a saída é um número real ou contínuo.

3) ``Agrupamento``: É um tipo de problema de aprendizado de máquina que envolve a identificação de grupos de dados semelhantes. Por exemplo, agrupar clientes com base em seus hábitos de compra, agrupar notícias com base em seus tópicos, agrupar imagens com base em suas características. O agrupamento é usado para descobrir padrões em dados não rotulados.

4) ``Associação``: É um tipo de problema de aprendizado de máquina que envolve a descoberta de padrões de associação entre itens em conjuntos de dados. Por exemplo, identificar produtos frequentemente comprados juntos em uma loja, recomendar músicas com base nas preferências do usuário, sugerir filmes com base em avaliações anteriores. A associação é útil para encontrar regras e relações entre diferentes itens em um conjunto de dados.

------

### 3- Estude os slides sobre Árvore de decisão que estão no CANVAS. Em seguida, responda as seguintes perguntas:

#### 1- Como uma árvore de decisão é gerada? Qual o significado do atributo que está na raiz da árvore? 

Algoritmos como ID3, C4.5 e CART são usados para construir árvores de decisão de forma inteligente. O processo começa identificando qual atributo faz a melhor separação dos dados, garantindo que a organização inicial seja a mais eficiente possível. A partir daí, a árvore vai sendo construída passo a passo, aplicando esse critério em cada divisão até que todos os dados estejam bem classificados. O primeiro atributo escolhido é sempre o que traz mais clareza na separação, ajudando a entender melhor o padrão dos dados.

#### 2- O que você pode fazer com uma árvore de decisão gerada a partir de uma base de dados?

Com uma árvore de decisão gerada a partir de uma base de dados, você pode **tomar decisões automáticas**, identificar quais informações são mais influentes e descobrir padrões que ajudam a entender melhor os dados.

#### 3-Quais as vantagens e desvantagens de um algoritmo de árvore de decisão?

As árvores de decisão são benéficas pois são intuitivas e de compreensão simples.  Não necessitam de normalização dos dados e têm a capacidade de lidar com informações numéricas e categóricas.  Adicionalmente, têm a capacidade de modelar interações complexas e identificar relações não lineares, o que as torna versáteis para a análise de dados.

------

### 4- Considerando-se a base de dados sobre “Esperar ou não pelo restaurante” (verificar base de dados ‘Restaurante.csv’ disponibilizada no CANVAS), pede-se:

# Análise de Decisão com Base no CSV `restaurante.csv`

### 1) Calcular o ganho de informação de cada atributo. Que atributo é a raiz da árvore?
