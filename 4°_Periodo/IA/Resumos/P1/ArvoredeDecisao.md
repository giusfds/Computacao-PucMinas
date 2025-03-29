# Arvore de decisao

## Introdicao
> o objetivo e "inferir" ou "descobrir" uma regra (logica) para o problema

a complexidade de uma arvore de decisoes e dada por o numero total de *nos*, o numero total de *folhas*, *profundidade* da arvore e o numero de *atributos*. cada arvore pode ser interpretada como uma *disjuncao de conjuntos* de regras, em que cada caminho da arvore e uma regra

- *arvore de classificacao*: quando uma arvore e de decisao e usada para tarefas de *classificacao*

- *arvore de regressao*: quando ua arvore de decisoes e usada para uma tarefa de regressao

## Estrutura
- Nos = testes para variaveis
- Ramos = resultados dos testes
- folhas = classificacao

## Como gerar uma arvore de decisoes
### definir os conseitos do problema
- dado um conjutos de dados *D*, queremos classificar as instancias em categorias (classes) distintas
- cada instancia e desgrita por atributos e uma classe alvo
- o objetivo e construir uma arvore de decisao que divide os dados iterativamente ate que todos os exemplos em um no pertencam a mesma classe

### Escolher melhor atributos para dividir os dados
o esquema usado na aprendizzagem de arvore de decisao para selecionar atributos é projetado para minimizar a profundidade da arvore final (quanto menor a arvore melhor vai ser para a analise de dados)

a ideia e escolher atributos mais longe possivel na tentativa de fornecer uma classificacao exata dos exemplos

#### ganho de info (IG)

medido com base na entropia (E) que representa a incerteza do conjunto de dados. a entropia e derivada da teoria da informacao e é utilizada para determinar a quantidade de uma divisao (split) dos dados de em uma arvore 
