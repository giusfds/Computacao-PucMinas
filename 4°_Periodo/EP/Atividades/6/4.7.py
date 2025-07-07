import numpy as np
import matplotlib.pyplot as plt

# (a) Calcular k e representar graficamente f(x)
def calcular_k_e_grafico():
    a = 0.85
    b = 1.05
    k = 1 / (b - a)
    print(f"(a) Valor de k: {k:.2f}")

    # Gráfico de f(x)
    x = np.linspace(0.8, 1.1, 500)
    fx = np.where((x >= a) & (x <= b), k, 0)

    plt.plot(x, fx, label='f(x)')
    plt.fill_between(x, fx, alpha=0.2)
    plt.title("Função densidade de probabilidade f(x)")
    plt.xlabel("Peso (kg)")
    plt.ylabel("f(x)")
    plt.grid(True)
    plt.legend()
    
    # Salvar o gráfico em vez de mostrar
    plt.savefig("grafico_fx.png")
    plt.close()
    print("Gráfico salvo como 'grafico_fx.png'.")

# (b) Determinar média e variância
def calcular_media_variancia():
    a = 0.85
    b = 1.05
    media = (a + b) / 2
    variancia = ((b - a) ** 2) / 12
    print(f"(b) Média: {media:.3f} kg")
    print(f"(b) Variância: {variancia:.6f} kg²")
    return media, variancia

# (c) Calcular a probabilidade de pesar menos de 1 kg
def probabilidade_menor_que_1():
    a = 0.85
    b = 1.05
    peso = 1.0

    if peso < a:
        prob = 0
    elif peso > b:
        prob = 1
    else:
        prob = (peso - a) / (b - a)

    print(f"(c) Probabilidade de pesar menos de 1 kg: {prob:.4f}")
    return prob

# (d) Esperar número de embalagens com peso superior a 1 kg
def embalagens_acima_de_1kg(total_embalagens=200):
    prob_acima_1kg = 1 - probabilidade_menor_que_1()
    esperadas = total_embalagens * prob_acima_1kg
    print(f"(d) Número esperado de embalagens acima de 1 kg: {esperadas:.0f}")
    return esperadas

# Chamando cada função:
print("Resultados:")
print("=========\n")
calcular_k_e_grafico()

calcular_media_variancia()

probabilidade_menor_que_1()

embalagens_acima_de_1kg()
