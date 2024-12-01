### Resumo dos Conceitos de Sequenciadores com Exemplos de Código

#### 1. **Saltos (Jumps)**  
Os saltos transferem explicitamente o controle de um ponto do programa para outro. Exemplos clássicos incluem o uso de `goto`.

##### Exemplo em C:
```c
#include <stdio.h>
int main() {
    int x = 0;
L1:
    printf("Valor de x: %d\n", x);
    x++;
    if (x < 5) {
        goto L1; // Salto para o rótulo L1
    }
    printf("Fim do loop.\n");
    return 0;
}
```
**Vantagem:** Simples e eficiente em casos pequenos.  
**Desvantagem:** Pode levar a códigos difíceis de entender, conhecidos como *códigos espaguete*.

---

#### 2. **Escapes**  
Os escapes encerram a execução de um comando, como `break`, `continue` e `return`.

##### Exemplo em Python:
```python
while True:
    x = int(input("Digite um número (negativo para sair): "))
    if x < 0:
        print("Saindo do loop...")
        break  # Escape do loop
    elif x == 0:
        print("Número neutro. Pulando...")
        continue  # Salta para a próxima iteração
    print(f"Número positivo: {x}")
```
**Uso comum:** Estruturas como loops e controle de fluxos dentro de blocos fechados.

---

#### 3. **Exceções (Exceptions)**  
Permitem tratar condições excepcionais (como erros) sem interromper o programa de forma abrupta.

##### Exemplo em Java:
```java
public class ExemploDeExcecao {
    public static void main(String[] args) {
        String var = "ABC";
        try {
            int num = Integer.parseInt(var); // Tenta converter "ABC" para inteiro
            System.out.println("Número convertido: " + num);
        } catch (NumberFormatException e) {
            System.out.println("Erro: " + e.getMessage());
        } finally {
            System.out.println("Bloco finally sempre será executado.");
        }
    }
}
```
**Vantagem:** Melhora a modularidade e robustez do código.  
**Desvantagem:** Pode gerar complexidade adicional se mal utilizado.

