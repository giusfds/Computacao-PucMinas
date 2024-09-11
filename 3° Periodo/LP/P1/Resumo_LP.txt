
# Resumo de Conceitos de Linguagens de Programação

## 1. Conceitos Básicos
- **Alfabeto (Σ)**: Conjunto finito de símbolos, como letras ou números.
- **Símbolo**: Entidade abstrata que compõe palavras.
- **Palavra**: Sequência finita de símbolos justapostos (ex.: "abc").
- **Linguagem Formal**: Conjunto de palavras sobre um alfabeto, como palíndromos ou conjuntos com palavras vazias.

### Exemplo prático em C:
```c
// Verificando se uma palavra é um palíndromo
#include <stdio.h>
#include <string.h>

int ehPalindromo(char palavra[]) {
    int i, len = strlen(palavra);
    for (i = 0; i < len / 2; i++) {
        if (palavra[i] != palavra[len - i - 1])
            return 0; // Não é um palíndromo
    }
    return 1; // É um palíndromo
}

int main() {
    char palavra[] = "aba";
    if (ehPalindromo(palavra)) {
        printf("%s é um palíndromo\n", palavra);
    } else {
        printf("%s não é um palíndromo\n", palavra);
    }
    return 0;
}
```

## 2. Gramática
- **Definição**: Conjunto de regras para gerar palavras em uma linguagem formal.
- **Componentes**: Variáveis (V), Terminais (T), Produções (P), e Símbolo Inicial (S).
- **Derivação**: Processo de gerar palavras com base nas produções da gramática.

### Exemplo prático em C:
```c
// Simulação de uma gramática simples gerando palavras
#include <stdio.h>

void gerarPalavra(int n) {
    if (n == 1) {
        printf("a");
    } else if (n == 2) {
        printf("b");
    } else {
        printf("ab");
    }
}

int main() {
    gerarPalavra(1); // Gera a palavra "a"
    gerarPalavra(2); // Gera a palavra "b"
    gerarPalavra(3); // Gera a palavra "ab"
    return 0;
}
```

## 3. Sistema de Estados Finitos
- **Definição**: Modelo matemático que descreve sistemas que podem assumir um número finito de estados.
- **Exemplo**: Elevadores que resumem informações com base no andar corrente e direção de movimento.

### Exemplo prático em C:
```c
// Simulando um autômato finito simples
#include <stdio.h>

typedef enum {ESTADO_0, ESTADO_1} Estado;

Estado transicao(Estado atual, char entrada) {
    if (atual == ESTADO_0 && entrada == 'a') return ESTADO_1;
    if (atual == ESTADO_1 && entrada == 'b') return ESTADO_0;
    return atual;
}

int main() {
    Estado estado = ESTADO_0;
    char cadeia[] = "aabb";
    
    for (int i = 0; i < 4; i++) {
        estado = transicao(estado, cadeia[i]);
    }
    
    printf("Estado final: %d\n", estado);
    return 0;
}
```

## 4. Implementação de Linguagens
- **Compiladores**: Tradutores de linguagens de programação. Envolvem análise léxica e sintática para reconhecer e traduzir códigos para execução em máquinas.
- **Uso em Compiladores**: Técnicas como análise léxica, gramáticas, e geração de código otimizam a tradução de alto nível para instruções de máquina.

### Exemplo prático em C:
```c
// Exemplo de uma função simples que simula uma parte de um compilador que reconhece identificadores
#include <stdio.h>
#include <ctype.h>

int reconheceIdentificador(char palavra[]) {
    if (!isalpha(palavra[0])) return 0; // Primeiro caractere deve ser uma letra
    for (int i = 1; palavra[i] != '\0'; i++) {
        if (!isalnum(palavra[i])) return 0; // Restante deve ser alfanumérico
    }
    return 1; // É um identificador válido
}

int main() {
    char palavra[] = "variavel1";
    if (reconheceIdentificador(palavra)) {
        printf("%s é um identificador válido\n", palavra);
    } else {
        printf("%s não é um identificador válido\n", palavra);
    }
    return 0;
}
```

## 5. Tipos de Dados e Armazenamento
- **Tipos Primitivos**: Inteiro, Real, Caractere, Lógico.
- **Tipos Compostos**: Tuplas, Registros, Listas.
- **Variáveis de Heap**: Alocadas dinamicamente durante a execução.
- **Recursão**: Definição de dados ou funções que podem se referenciar, como árvores.

### Exemplo prático em C:
```c
// Exemplo de uso de heap e ponteiros
#include <stdio.h>
#include <stdlib.h>

int main() {
    int *ptr = (int*)malloc(sizeof(int)); // Alocando memória dinamicamente
    *ptr = 10;
    printf("Valor de ptr: %d\n", *ptr);
    free(ptr); // Liberando a memória
    return 0;
}
```
