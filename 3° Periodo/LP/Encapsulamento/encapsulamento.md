# Encapsulamento

## Encapsulamento
  - usada majoritariamente para organizar o codigo
    - unidades independendtes do codigo fonte
  - sempre pode ser reutilizavel, desde codigos grandes a codigo pequenos

## Modulos 
  - pense em um modulo como uma caixa, vc nao precisa necessariamente saber exatamente o que esta la dentro, mas vc precisa acessar somente o necessario;
    - voce precisa saber como que chama uma funcao por exemplo, o que e preciso declarar para chamar a tal funcao, mas nao precisa saber como a mesma foi construida
  - IMPORTANCIA
    1. organizacao
    2. reutilizacao
    3. manutencao
    4. seguranca
    5. controle de acesso

## Pacotes
  - sao um forte exemplo de como o encapsulamento e importante, pois dentro dele pode ter varias coisas, dentre elas, modulos, classes, funcoes, outros pacotes, etc

## Ocultamento
  - pega por exemplo o whatsapp, vc nao sabe como ele foi construido, mas vc sabe como usa-lo, vc sabe que tem que clicar em um botao para enviar uma mensagem, mas nao sabe o que acontece por tras, servidores, criptografia, protocolos, etc. Isso sim e um exemplo de   ocultamento de informacao
  - voce so precisa saber o que e necessario para usar o programa, nao precisa saber como ele foi construido, apenas o que ela faz e como a usar
  - vantage: 
    1. seguranca
    2. simplicidade
    3. flexibilidade

## Tipos abstratos
  - Tipos abstratos são tipos de dados criados com operações específicas, onde a representação interna é escondida e apenas as operações são expostas.

## Orientacao a Objetos
  - classes sao encapsulamentos
  - escondem variaveis e expoe apenas funcoes que usam a variavel
    - exemplo: 
      - voce nao precisa saber como a funcao foi construida, apenas o que ela faz e como usa-la
      - voce nao precisa saber como a classe foi construida, apenas o que ela faz e como usa-la
      - voce nao precisa saber como o objeto foi construido, apenas o que ele faz e como usa-lo

## Genericos
- técnica avançada de encapsulamento.
- Objetivo: 
    -criar funções ou estruturas de dados que funcionam com diferentes tipos de entrada.
- Funcionamento: 
  - Escreve-se uma função ou estrutura com tipos genéricos (espaços em branco para o tipo de dado).
  - O tipo é definido apenas no momento de uso.
- Exemplo: 
  - Função genérica de soma: `soma<T>(a: T, b: T)`.
  - Pode funcionar com inteiros, floats, strings, etc.
  
- Benefícios:
  1. Reutilização: uma função/estrutura pode ser usada para vários tipos de dados.
  2. Segurança de tipos: garante consistência nos tipos usados.
  3. Flexibilidade: adapta-se a diferentes tipos sem duplicação de código.

- Aplicação: em linguagens como Ada, onde pacotes genéricos são usados para lidar com diferentes tipos.