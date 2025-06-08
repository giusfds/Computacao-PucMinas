import random

def perceptron(x, y, epochs=100, lr=0.1, random_state=None):
    # x: dados de entrada (lista de listas)
    # y: saída esperada
    # epochs: número máximo de épocas (iterações)
    # lr: taxa de aprendizado (learning rate)
    # random_state: semente para geração aleatória

    # Número de entradas por amostra
    n = len(x[0])

    # Define a semente aleatória, se fornecida (para reprodutibilidade)
    if random_state is not None:
        random.seed(random_state)

    # Inicializa os pesos com valores aleatórios entre -1 e 1
    weights = [random.uniform(-1, 1) for _ in range(n)]

    # Inicializa o bias com valor aleatório entre -1 e 1
    b = random.uniform(-1, 1)

    epoch = 0  # Contador de épocas
    output = []  # Lista para armazenar as saídas previstas

    # Loop de treinamento
    while output != y and epoch < epochs:
        output = []

        for i in range(len(x)):
            # Calcula a soma ponderada + bias
            sum_w = sum(x[i][j] * weights[j] for j in range(n)) + b

            # Aplica a função de ativação (degrau de Heaviside)
            found = 1 if sum_w > 0 else 0

            # Armazena a saída prevista
            output.append(found)

            # Calcula o erro (diferença entre a saída esperada e a prevista)
            error = y[i] - found

            # Atualiza os pesos com base no erro
            for j in range(n):
                weights[j] += lr * error * x[i][j]

            # Atualiza o bias
            b += lr * error

        epoch += 1

        # Mostra os valores após cada época
        print(f"\nÉpoca {epoch}")
        print(f"Pesos: {weights}")
        print(f"Bias: {b}")
        print(f"Saída prevista: {output}")

# Testando com portas lógicas
if __name__ == "__main__":
    entradas = [[0, 0], [0, 1], [1, 0], [1, 1]]

    print("\n==== Porta AND ====")
    saidas_and = [0, 0, 0, 1]
    perceptron(entradas, saidas_and, epochs=30, lr=0.1, random_state=42)

    print("\n==== Porta OR ====")
    saidas_or = [0, 1, 1, 1]
    perceptron(entradas, saidas_or, epochs=100, lr=0.1, random_state=42)

    print("\n==== Porta XOR ====")
    saidas_xor = [0, 1, 1, 0]
    perceptron(entradas, saidas_xor, epochs=100, lr=0.1, random_state=42)

# ==== Porta AND ====
# Época 1
# Pesos: [...]
# Bias: ...
# Saída prevista: [0, 0, 0, 0]
# 
# Época 2
# Pesos: [...]
# Bias: ...
# Saída prevista: [0, 0, 0, 1]
# 
# ...
# 
# ==== Porta XOR ====
# Época 1
# Pesos: [...]
# Bias: ...
# Saída prevista: [0, 1, 1, 1]
# 
# Época 2
# Pesos: [...]
# Bias: ...
# Saída prevista: [0, 1, 1, 1]
