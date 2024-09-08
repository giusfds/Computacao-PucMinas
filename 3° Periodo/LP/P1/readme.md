# Prova 1

## Overview
### Conseitos basicos
- Alfabeto: e o conjunto finito de simbolos e chares, um char ou simbolo, nao definida como numero letra ou simbolo
- Palavra: e uma sequencia finita de simbolos de um alfabeto
### Linguagem formal
- e um conjunto de palavras sobre um alfabeto
  exemplo:
  - Conjunto vazio: = { }
  - Conjunto formado pela palavra vazia = { épsilon }
  - Conjunto de palíndromos (palavras que têm a mesma leitura da esquerda para a direita e da direita para a esquerda): {, a, b, aa, bb, aba, aaaa,...} -> linguagem infinita
### Gramatica
Uma gramática formal é uma maneira de descrever como formar frases válidas em uma linguagem (natural ou de programação, por exemplo). Ela é representada por uma quádrupla ordenada G=(V,T,P,S):
V -> são os elementos abstratos que ainda podem ser reescritos.
T -> são os elementos finais que aparecem nas sentenças da linguagem.
P -> são as regras que dizem como transformar V e T uns nos outros.
S -> é o ponto de partida para gerar uma frase ou expressão na linguagem.
### Sistema de estados finitos
são usados para modelar sistemas que podem estar em um número limitado de estados, mudando de um estado para outro com base em entradas discretas. Exemplos incluem autômatos finitos, autômatos com pilha e máquinas de Turing.
### A Teoria de Linguagens
ajuda a projetar, implementar e analisar linguagens de programação e seus compiladores. Além disso, ela é útil na resolução de problemas computacionais e no desenvolvimento de melhores práticas de programação.

## Introducao
### Linguagem de Programação
e uma linguagem formal, constituida por um alfabeto, porem com o objetivo de fazer o computador entender o que voce quer
#### requisitos para ser uma LP
ser uma coisa universal, assim, todos os computadores podem entender, ja que a linguagem e feita para eles.
#### Requisitos desejáveis para uma linguagem poder ser considerada LP
ser natural e ter uma emplementacao eficiente
#### sintaxe e semantica
- a sintsxe e a forma como voce escreve, comandos e declaracoes sao combinadas para formar programas 
- semantica e como os programas se comportam quando sao execultados
#### paradigmas
- Um paradigma é como uma filosofia de como resolver problemas, organizando entidades e aplicando regras específicas sobre como usar os recursos disponíveis. Em termos práticos, diferentes paradigmas oferecem maneiras distintas de pensar sobre como um programa deve ser estruturado e como ele interage com dados e funcionalidades. Isso permite aos desenvolvedores escolher o paradigma mais adequado para a solução de problemas específicos.
- os paradigmas oferecem diferentes abordagens para resolver o problema, baseado em estilos especificos.
##### pq estudar as lps 
- melhor coompreencao da LP usada
- aumento do vocabulario
- melhor escolha de uma lp 
- melhor aprendizado de uma lp
- novos projetos usando uma lp

uma LP esta fortemente presente na computacao, apartir do ponto que elas se relacionam com tudo

## Valores
### o que e um valor
qualquer entidade que exista dentro da computacao, seja um valor que possa ser avaliada, armazenado, passada como parametro para uma funcao
### porque estudar isso
os valores sao a amteria prima da computacao, ja que os mesmo sao usados para manipular dados, e a computacao e feita para manipular dados
### como estudar valores
- eles sao agrupados em tipos, seja primitivos ou nao
### tipos
