# Dados fornecidos
paises = ['Islândia', 'Noruega', 'Suécia', 'Dinamarca', 'Canadá', 'Austrália', 'Holanda', 'Suíça', 'Finlândia', 'Grã-Bretanha', 'EUA']
consumo_cigarros = [240, 255, 340, 375, 510, 490, 490, 180, 1125, 1150, 1275]
mortes = [63, 100, 140, 175, 160, 180, 250, 180, 360, 470, 200]

# (a) Escolher X e Y
def func_a():
    X = consumo_cigarros
    Y = mortes
    return X, Y

# (b) Construir diagrama de dispersão
import matplotlib.pyplot as plt

def func_b():
    X, Y = func_a()
    plt.scatter(X, Y)
    plt.xlabel('Consumo de cigarros per capita em 1930')
    plt.ylabel('Mortes por 1.000.000 de habitantes em 1950')
    plt.title('Diagrama de dispersão entre consumo de cigarros e mortes por câncer de pulmão')
    plt.grid(True)
    plt.show()

# (c) Calcular coeficiente de correlação linear de Pearson
import numpy as np

def func_c():
    X, Y = func_a()
    r = np.corrcoef(X, Y)[0, 1]
    return r

# (d) Obter equação de regressão linear
from scipy.stats import linregress

def func_d():
    X, Y = func_a()
    slope, intercept, r_value, p_value, std_err = linregress(X, Y)
    return intercept, slope

# (e) Estimar número de mortes para consumo de cigarros no Brasil em 1930 (630)
def func_e(consumo_brasil=630):
    b0, b1 = func_d()
    mortes_estimadas = b0 + b1 * consumo_brasil
    return mortes_estimadas

# (f) Calcular coeficiente de determinação R2
def func_f():
    X, Y = func_a()
    slope, intercept, r_value, p_value, std_err = linregress(X, Y)
    R2 = r_value**2
    return R2

# Exemplo de uso:
func_b()  # Mostra o gráfico
r = func_c()
b0, b1 = func_d()
mortes_brasil = func_e()
R2 = func_f()

print(f"Coeficiente de correlação de Pearson (r): {r:.4f}")
print(f"Equação da regressão: Y = {b0:.2f} + {b1:.4f}X")
print(f"Estimativa de mortes no Brasil (consumo=630): {mortes_brasil:.2f}")
print(f"Coeficiente de determinação R²: {R2:.4f}")
