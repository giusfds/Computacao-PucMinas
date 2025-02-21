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

Para calcular o ganho de informação de cada atributo, utilizamos a fórmula do ganho de informação baseado na entropia. A entropia é calculada para o atributo `Conclusao` (que é a variável alvo) e, em seguida, para cada atributo em relação a `Conclusao`.

#### Cálculo da Entropia de `Conclusao`:

- Total de instâncias: 12
- `Conclusao = Sim`: 7
- `Conclusao = Nao`: 5

Entropia de `Conclusao`:
\[
H(Conclusao) = -\left(\frac{7}{12} \log_2 \frac{7}{12} + \frac{5}{12} \log_2 \frac{5}{12}\right) \approx 0.9799
\]

#### Ganho de Informação para Cada Atributo:

- **Alternativo**: 
  - `Sim`: 7 instâncias (4 Sim, 3 Nao)
  - `Nao`: 5 instâncias (3 Sim, 2 Nao)
  - Entropia: \( H(Alternativo) = \frac{7}{12} \times 0.9852 + \frac{5}{12} \times 0.9710 \approx 0.9799 \)
  - Ganho de Informação: \( 0.9799 - 0.9799 = 0 \)

- **Bar**:
  - `Sim`: 6 instâncias (4 Sim, 2 Nao)
  - `Nao`: 6 instâncias (3 Sim, 3 Nao)
  - Entropia: \( H(Bar) = \frac{6}{12} \times 0.9183 + \frac{6}{12} \times 1.0 \approx 0.9592 \)
  - Ganho de Informação: \( 0.9799 - 0.9592 = 0.0207 \)

- **SexSab**:
  - `Sim`: 5 instâncias (3 Sim, 2 Nao)
  - `Nao`: 7 instâncias (4 Sim, 3 Nao)
  - Entropia: \( H(SexSab) = \frac{5}{12} \times 0.9710 + \frac{7}{12} \times 0.9852 \approx 0.9799 \)
  - Ganho de Informação: \( 0.9799 - 0.9799 = 0 \)

- **fome**:
  - `Sim`: 7 instâncias (5 Sim, 2 Nao)
  - `Nao`: 5 instâncias (2 Sim, 3 Nao)
  - Entropia: \( H(fome) = \frac{7}{12} \times 0.8631 + \frac{5}{12} \times 0.9710 \approx 0.9086 \)
  - Ganho de Informação: \( 0.9799 - 0.9086 = 0.0713 \)

- **Cliente**:
  - `Cheio`: 5 instâncias (3 Sim, 2 Nao)
  - `Alguns`: 5 instâncias (4 Sim, 1 Nao)
  - `Nenhum`: 2 instâncias (0 Sim, 2 Nao)
  - Entropia: \( H(Cliente) = \frac{5}{12} \times 0.9710 + \frac{5}{12} \times 0.7219 + \frac{2}{12} \times 0 \approx 0.6585 \)
  - Ganho de Informação: \( 0.9799 - 0.6585 = 0.3214 \)

- **Preco**:
  - `R`: 6 instâncias (2 Sim, 4 Nao)
  - `RR`: 2 instâncias (2 Sim, 0 Nao)
  - `RRR`: 4 instâncias (3 Sim, 1 Nao)
  - Entropia: \( H(Preco) = \frac{6}{12} \times 0.9183 + \frac{2}{12} \times 0 + \frac{4}{12} \times 0.8113 \approx 0.6667 \)
  - Ganho de Informação: \( 0.9799 - 0.6667 = 0.3132 \)

- **Chuva**:
  - `Sim`: 6 instâncias (4 Sim, 2 Nao)
  - `Nao`: 6 instâncias (3 Sim, 3 Nao)
  - Entropia: \( H(Chuva) = \frac{6}{12} \times 0.9183 + \frac{6}{12} \times 1.0 \approx 0.9592 \)
  - Ganho de Informação: \( 0.9799 - 0.9592 = 0.0207 \)

- **Res**:
  - `Sim`: 5 instâncias (4 Sim, 1 Nao)
  - `Nao`: 7 instâncias (3 Sim, 4 Nao)
  - Entropia: \( H(Res) = \frac{5}{12} \times 0.7219 + \frac{7}{12} \times 0.9852 \approx 0.8797 \)
  - Ganho de Informação: \( 0.9799 - 0.8797 = 0.1002 \)

- **Tipo**:
  - `Frances`: 2 instâncias (1 Sim, 1 Nao)
  - `Tailandes`: 4 instâncias (3 Sim, 1 Nao)
  - `Italiano`: 2 instâncias (1 Sim, 1 Nao)
  - `Hamburger`: 4 instâncias (2 Sim, 2 Nao)
  - Entropia: \( H(Tipo) = \frac{2}{12} \times 1.0 + \frac{4}{12} \times 0.8113 + \frac{2}{12} \times 1.0 + \frac{4}{12} \times 1.0 \approx 0.9375 \)
  - Ganho de Informação: \( 0.9799 - 0.9375 = 0.0424 \)

- **Tempo**:
  - `0-10`: 5 instâncias (4 Sim, 1 Nao)
  - `10-30`: 2 instâncias (1 Sim, 1 Nao)
  - `30-60`: 2 instâncias (1 Sim, 1 Nao)
  - `>60`: 3 instâncias (1 Sim, 2 Nao)
  - Entropia: \( H(Tempo) = \frac{5}{12} \times 0.7219 + \frac{2}{12} \times 1.0 + \frac{2}{12} \times 1.0 + \frac{3}{12} \times 0.9183 \approx 0.8296 \)
  - Ganho de Informação: \( 0.9799 - 0.8296 = 0.1503 \)

#### Atributo Raiz da Árvore:

O atributo com o maior ganho de informação é **Cliente** com um ganho de **0.3214**. Portanto, **Cliente** será a raiz da árvore.

---

### 2) Que atributo estará no segundo nível da árvore? Faça os cálculos e apresente a árvore gerada até o segundo nível da árvore.

Após selecionar **Cliente** como a raiz da árvore, precisamos determinar o próximo atributo para cada ramo da árvore. Vamos calcular o ganho de informação para cada ramo de **Cliente**:

#### Ramo `Cheio`:
- Total de instâncias: 5
- `Conclusao = Sim`: 3
- `Conclusao = Nao`: 2
- Entropia: \( H(Cheio) = -\left(\frac{3}{5} \log_2 \frac{3}{5} + \frac{2}{5} \log_2 \frac{2}{5}\right) \approx 0.9710 \)

#### Ramo `Alguns`:
- Total de instâncias: 5
- `Conclusao = Sim`: 4
- `Conclusao = Nao`: 1
- Entropia: \( H(Alguns) = -\left(\frac{4}{5} \log_2 \frac{4}{5} + \frac{1}{5} \log_2 \frac{1}{5}\right) \approx 0.7219 \)

#### Ramo `Nenhum`:
- Total de instâncias: 2
- `Conclusao = Sim`: 0
- `Conclusao = Nao`: 2
- Entropia: \( H(Nenhum) = 0 \)

#### Ganho de Informação para Cada Atributo no Ramo `Cheio`:

- **Alternativo**:
  - `Sim`: 3 instâncias (2 Sim, 1 Nao)
  - `Nao`: 2 instâncias (1 Sim, 1 Nao)
  - Entropia: \( H(Alternativo) = \frac{3}{5} \times 0.9183 + \frac{2}{5} \times 1.0 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **Bar**:
  - `Sim`: 3 instâncias (2 Sim, 1 Nao)
  - `Nao`: 2 instâncias (1 Sim, 1 Nao)
  - Entropia: \( H(Bar) = \frac{3}{5} \times 0.9183 + \frac{2}{5} \times 1.0 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **SexSab**:
  - `Sim`: 2 instâncias (1 Sim, 1 Nao)
  - `Nao`: 3 instâncias (2 Sim, 1 Nao)
  - Entropia: \( H(SexSab) = \frac{2}{5} \times 1.0 + \frac{3}{5} \times 0.9183 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **fome**:
  - `Sim`: 3 instâncias (2 Sim, 1 Nao)
  - `Nao`: 2 instâncias (1 Sim, 1 Nao)
  - Entropia: \( H(fome) = \frac{3}{5} \times 0.9183 + \frac{2}{5} \times 1.0 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **Preco**:
  - `R`: 2 instâncias (1 Sim, 1 Nao)
  - `RRR`: 3 instâncias (2 Sim, 1 Nao)
  - Entropia: \( H(Preco) = \frac{2}{5} \times 1.0 + \frac{3}{5} \times 0.9183 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **Chuva**:
  - `Sim`: 2 instâncias (1 Sim, 1 Nao)
  - `Nao`: 3 instâncias (2 Sim, 1 Nao)
  - Entropia: \( H(Chuva) = \frac{2}{5} \times 1.0 + \frac{3}{5} \times 0.9183 \approx 0.9510 \)
  - Ganho de Informação: \( 0.9710 - 0.9510 = 0.0200 \)

- **Res**:
  - `Sim`: 2 instâncias (2 Sim, 0 Nao)
  - `Nao`: 3 instâncias (1 Sim, 2 Nao)
  - Entropia: \( H(Res) = \frac{2}{5} \times 0 + \frac{3}{5} \times 0.9183 \approx 0.5510 \)
  - Ganho de Informação: \( 0.9710 - 0.5510 = 0.4200 \)

- **Tipo**:
  - `Frances`: 1 instância (1 Sim, 0 Nao)
  - `Tailandes`: 2 instâncias (1 Sim, 1 Nao)
  - `Italiano`: 1 instância (1 Sim, 0 Nao)
  - `Hamburger`: 1 instância (0 Sim, 1 Nao)
  - Entropia: \( H(Tipo) = \frac{1}{5} \times 0 + \frac{2}{5} \times 1.0 + \frac{1}{5} \times 0 + \frac{1}{5} \times 0 \approx 0.4 \)
  - Ganho de Informação: \( 0.9710 - 0.4 = 0.5710 \)

- **Tempo**:
  - `0-10`: 1 instância (1 Sim, 0 Nao)
  - `10-30`: 1 instância (1 Sim, 0 Nao)
  - `30-60`: 1 instância (1 Sim, 0 Nao)
  - `>60`: 2 instâncias (0 Sim, 2 Nao)
  - Entropia: \( H(Tempo) = \frac{1}{5} \times 0 + \frac{1}{5} \times 0 + \frac{1}{5} \times 0 + \frac{2}{5} \times 0 \approx 0 \)
  - Ganho de Informação: \( 0.9710 - 0 = 0.9710 \)

#### Atributo no Segundo Nível para o Ramo `Cheio`:

O atributo com o maior ganho de informação no ramo `Cheio` é **Tempo** com um ganho de **0.9710**. Portanto, **Tempo** será o próximo atributo no ramo `Cheio`.

#### Árvore até o Segundo Nível:
