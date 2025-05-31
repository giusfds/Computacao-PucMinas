import numpy as np
from scipy import stats

# Dados
dados = np.array([
    8.24, 8.21, 8.23, 8.25, 8.26,
    8.23, 8.20, 8.26, 8.19, 8.23,
    8.20, 8.28, 8.24, 8.25, 8.24
])

# Parâmetros
n = len(dados)
media_amostral = np.mean(dados)
desvio_padrao_amostral = np.std(dados, ddof=1)  # ddof=1 para amostra
alpha = 0.05

# (a) Teste t unilateral (H0: mu = 8.20, H1: mu > 8.20)
mu0 = 8.20
t_stat = (media_amostral - mu0) / (desvio_padrao_amostral / np.sqrt(n))
p_valor = 1 - stats.t.cdf(t_stat, df=n-1)

print("(a) Teste t unilateral:")
print(f"Estatística t: {t_stat:.4f}")
print(f"Valor-p: {p_valor:.4f}")
if p_valor < alpha:
    print("Rejeitamos H0: Há evidência de que o diâmetro médio excede 8,20 mm.")
else:
    print("Não rejeitamos H0: Não há evidência suficiente de que o diâmetro médio excede 8,20 mm.")

# (b) Intervalo de confiança de 95%
ic = stats.t.interval(0.95, df=n-1, loc=media_amostral, scale=desvio_padrao_amostral / np.sqrt(n))

print("\n(b) Intervalo de confiança de 95% para a média:")
print(f"({ic[0]:.4f}, {ic[1]:.4f})")