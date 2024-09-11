#include <stdio.h>

// Variável global (acessível em todas as funções)
int global_var = 0;

// Função que demonstra uma variável estática local
void staticLocalExample() {
    // Variável estática local (mantém seu valor entre chamadas)
    static int static_local_var = 0;
    static_local_var++;
    printf("Valor da variável estática local: %d\n", static_local_var);
}

// Função que demonstra uma variável local e automática
void localExample() {
    // Variável local (escopo apenas dentro desta função)
    int local_var = 0;
    local_var++;
    printf("Valor da variável local: %d\n", local_var);
}

int main() {
    // Variável estática (escopo dentro desta função, mas mantém valor entre execuções)
    static int static_var = 10;
    
    // Variável local (padrão automático)
    int local_main_var = 20;

    // Exemplo com variáveis globais, locais e estáticas
    printf("Valor da variável global: %d\n", global_var);
    printf("Valor da variável estática (main): %d\n", static_var);
    printf("Valor da variável local (main): %d\n", local_main_var);

    // Modificando as variáveis
    global_var += 10;
    static_var += 5;
    local_main_var += 5;

    printf("Após modificações:\n");
    printf("Valor da variável global: %d\n", global_var);
    printf("Valor da variável estática (main): %d\n", static_var);
    printf("Valor da variável local (main): %d\n", local_main_var);

    // Chamada das funções para mostrar exemplos de locais e locais estáticas
    localExample();
    staticLocalExample();

    // Chamando novamente para ver o comportamento das variáveis locais e estáticas
    localExample();
    staticLocalExample();

    return 0;
}
