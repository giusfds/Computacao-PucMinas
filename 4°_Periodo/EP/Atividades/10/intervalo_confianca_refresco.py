import math
from scipy.stats import norm

# ----------------------------
# DADOS DO PROBLEMA
# ----------------------------

# Desvio padrão populacional (σ)
sigma = 13

# Média amostral (x̄)
x_bar = 210

# Tamanho da amostra (n)
n = 30

# ----------------------------
# (a) INTERVALO DE CONFIANÇA DE 95%
# ----------------------------

# Nível de confiança de 95% → z = 1,96 (valor crítico da normal padrão)
z_95 = norm.ppf(0.975)  # 0.975 pois é (1 + 0.95) / 2

# Margem de erro (E = z * σ / √n)
me_95 = z_95 * sigma / math.sqrt(n)

# Intervalo de confiança
ic_95 = (x_bar - me_95, x_bar + me_95)

# ----------------------------
# (b) INTERVALO DE CONFIANÇA DE 99%
# ----------------------------

# Nível de confiança de 99% → z = 2,576
z_99 = norm.ppf(0.995)  # 0.995 pois é (1 + 0.99) / 2

# Margem de erro (E = z * σ / √n)
me_99 = z_99 * sigma / math.sqrt(n)

# Intervalo de confiança
ic_99 = (x_bar - me_99, x_bar + me_99)

# ----------------------------
# (c) QUANTOS COPOS A MAIS SÃO NECESSÁRIOS PARA UMA MARGEM DE ERRO DE 3ML?
# ----------------------------

# Margem de erro desejada
E_desejado = 3

# Fórmula de tamanho necessário: n = ((z * σ) / E)²
n_necessario = math.ceil((z_95 * sigma / E_desejado) ** 2)

# Quantos copos a mais seriam necessários?
copos_a_mais = n_necessario - n

# ----------------------------
# RESULTADOS FINAIS
# ----------------------------

print("===== RESULTADOS =====\n")

print("(a) Intervalo de Confiança de 95%:")
print(f"Z = {z_95:.3f}")
print(f"Margem de erro: {me_95:.2f} ml")
print(f"Intervalo: ({ic_95[0]:.2f} ml ; {ic_95[1]:.2f} ml)\n")

print("(b) Intervalo de Confiança de 99%:")
print(f"Z = {z_99:.3f}")
print(f"Margem de erro: {me_99:.2f} ml")
print(f"Intervalo: ({ic_99[0]:.2f} ml ; {ic_99[1]:.2f} ml)\n")

print("(c) Tamanho da amostra para margem de erro de 3ml (nível de 95%):")
print(f"Tamanho necessário: {n_necessario} copos")
print(f"Copos a mais necessários: {copos_a_mais}")