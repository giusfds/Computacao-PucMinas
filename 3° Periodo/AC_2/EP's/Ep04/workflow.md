# Workflow - Exercício Prático 04 - ULA 4 bits + Arduino

## 1. Objetivo
Criar dois programas:
1. Um para o **Arduino**, que implementa uma ULA de 4 bits e recebe dados e instruções via porta serial.
2. Um para o **PC**, que converte um programa fonte em um formato hexadecimal e envia os comandos para o Arduino.

---

## 2. Hardware Externo
- Criar uma ULA com:
  - **4 bits para o dado A**
  - **4 bits para o dado B**
  - **4 bits para a instrução**
- LEDs nos pinos:
  - **Pino 13 → F3**
  - **Pino 12 → F2**
  - **Pino 11 → F1**
  - **Pino 10 → F0**
- Entrada via comunicação serial do Arduino

---

## 3. Desenvolvimento do Programa no Arduino
- Receber três valores pela serial:
  - **X (4 bits)**
  - **Y (4 bits)**
  - **Instrução (4 bits)**
- Executar a operação de acordo com a tabela de mnemônicos.
- Armazenar os valores em um vetor que representa a memória:
  - **Posição 0**: PC (contador de programa)
  - **Posição 1**: W (resultado da operação)
  - **Posição 2**: X
  - **Posição 3**: Y
  - **Restante**: Código do programa (até 100 posições)
- Atualizar valores de W, X e Y após a execução.
- Exibir o resultado nos LEDs.
- Criar um **DUMP da memória** ao final de cada instrução.

---

## 4. Desenvolvimento do Programa no PC
- O programa pode ser escrito em **C, C++, C#, Java ou Python**.
- Deve converter um programa fonte (`.ula`) em um programa hexadecimal (`.hex`).
- Deve permitir enviar os comandos via serial para o Arduino.
- Exemplo de conversão:
  - Arquivo `testeula.ula`:
    ```
    inicio:
    X=12;
    Y=6;
    W=AeB;
    fim.
    ```
  - Arquivo `testeula.hex`:
    ```
    C6B
    ```

---

## 5. Regras e Critérios de Avaliação
### Apresentação
- O trabalho será avaliado **individualmente**.
- Cada grupo deve ter os programas prontos e disponíveis no dia da apresentação.
- **Não haverá entrega online, apenas apresentação.**

### Possíveis Perdas de Pontos
- Execução imediata do `.hex` em vez de armazenar primeiro na memória.
- Não utilizar **PC** para indexação da memória.
- Exibição incorreta da memória no Arduino.
- Mnemônicos interpretados incorretamente.
- Instruções não sendo executadas corretamente.
- Código sem comentários.

---

## 6. Passos para Implementação
1. **Desenvolver a ULA no Arduino**.
2. **Implementar a comunicação serial**.
3. **Criar o vetor de memória** e atualização de variáveis.
4. **Criar o programa do PC** para conversão `.ula → .hex`.
5. **Testar com exemplos**.
6. **Apresentação final do projeto**.

---

## 7. Conclusão
Este trabalho envolve conceitos de arquitetura de computadores, programação embarcada e comunicação serial. A implementação correta garante a simulação de uma ULA funcional utilizando Arduino e PC.

**"Comece já, você nunca terá tanto tempo!"**
