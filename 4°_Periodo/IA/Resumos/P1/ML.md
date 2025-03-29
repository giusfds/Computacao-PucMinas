# Introcducao a Aprendizado de Maquina

construcao de programas de computador que melhoram seu desempenho por meio da experiencia.

> - Um prgrama aprende a partir da experiencia *E*, em relacao a uma classe de tarefas *T*, com medida de desempenho *P*, se seu desempenho em *T*, medido em *P* melhora, e com *E*
> - O aprendizzado de maquinha e o treinamento de um modelo a partir ded dados que generalizam juma decisao contra uma medida de desempenho

## Estrutura de dados

| Dia | Aparência | Temperatura | Umidade | Ventando | Jogar |
| --- | --------- | ----------- | ------- | -------- | ----- |
| d1  | Sol       | Quente      | Alta    | Não      | Não   |
| d2  | Nublado   | Quente      | Alta    | Não      | Sim   |
| ... | ...       | ...         | ...     | ...      | ...   |
| d13 | Nublado   | Quente      | Normal  | Não      | Sim   |
| d14 | Chuva     | Agradável   | Alta    | Sim      | Não   |


- cada linha representa uma instancia
- as colunas sao atribulos de entrada (Dia, Temperatura, Umidade e Ventando)
- a culuna jogador e o atributo de classificacao
- os atributos podem ser nominais (string) ou numericos (normalmente com pontos flutuantes)

## Tipo de Problema

Os algoritmos de aprenizagem de maquina sao classificados quanto ao **tipo de problema** de aprendizagem

### Classificaçao
- e um dos tipos de prblemas cabiveis
- usa-se quando queremos descrever uma classe
    - atributo de classificacao nominal

### Regressao
- similar ao anterior, mas usado apenas para atributos de classes numericos
  - prever na base do restaurante o valos da comida, com base nos atributos
  - prever a temperatura

### Agrupamento
- tem como objetivo agrupar as instancias de acordo com os atributos de entrada
    - nao e um atributo de classificacao

### Regras de associacao
Busca semelhanca entre os elementos, mas como assim? pegue como exemplo um sistema de E-commerce, quem comprou um protudo qualquer, vai querer talvez um produto relacionado a ele

## Tipos de Aprendizagem

os algoritmos de aprendizagem de maquina tem varias classificacoes, quanto ao *tipo de aprendizagem*

### Aprendizado Supervisionado
indutor recebe cunjunto de exemplo na forma (entrada, rotulo desejado)

tecnicas:
    - redes neurais
    - support vector machine (svm)
    - arvore de desicoes

### Aprendizado nao supervisionado

indutor recebe apenas atributos de entrada - Encontra os grupos

tecnicas: 
    - redeus neurais do tipo mapas auto-organizaveis
    - algoritimo k-media

### Aprendizado semi-supervisionados

aprendizagem semi-supervisionada utilizada dados rotulados e nao rotulados, assim havendo a melhora do modelo

### Aprendizado por reforço
concentra-se na maximizacao das recompensas do resultado
tecnicas:
    - redes neurais

### Deep Learning
rede neural com muitas camadas. para cada reconhecendo situacoes com ordem de complexidade maiores
tecnicas:
    - rede neural

## Descoberta do conhecimento
*descobrir conhecimento* significa *identificar*, *receber informações relevantes*, e poder *processá-las e agregá-las* ao conhecimento prévio de seu usuário, mudando o estado de seu conhecimento atual, a fim de que determinada situação ou problema possa ser resolvido.

### Mineracao de dados
e um termo muito usado que descreve o processo de descobrir padros interessantes e desconhecidos em grandes bancos de dados

a mineracao de dados e uma parte do processo geral da descoberta de conhecimento em banco de dados

o processo KDD foi definido como *o processo nao trivial de indentificar padroes validoso* 
