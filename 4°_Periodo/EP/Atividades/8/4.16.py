import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats

# Parâmetros da distribuição
media = 2.04
variancia = 0.6084
desvio_padrao = variancia**0.5

# Geração de valores para o eixo x
x = np.linspace(media - 4*desvio_padrao, media + 4*desvio_padrao, 1000)
y = stats.norm.pdf(x, loc=media, scale=desvio_padrao)

# Criar subplots para as 3 partes da letra (a)
fig, axs = plt.subplots(1, 3, figsize=(18, 5))

# i. P(X < 2.81)
axs[0].plot(x, y, color='black')
axs[0].fill_between(x, y, where=(x <= 2.81), color='skyblue')
axs[0].set_title("P(X < 2.81)")
axs[0].axvline(2.81, color='red', linestyle='--')

# ii. P(X > 1.8)
axs[1].plot(x, y, color='black')
axs[1].fill_between(x, y, where=(x >= 1.8), color='lightgreen')
axs[1].set_title("P(X > 1.8)")
axs[1].axvline(1.8, color='red', linestyle='--')

# iii. P(1.01 < X < 2.50)
axs[2].plot(x, y, color='black')
axs[2].fill_between(x, y, where=(x >= 1.01) & (x <= 2.50), color='salmon')
axs[2].set_title("P(1.01 < X < 2.50)")
axs[2].axvline(1.01, color='red', linestyle='--')
axs[2].axvline(2.50, color='red', linestyle='--')

for ax in axs:
    ax.grid(True)

plt.tight_layout()
plt.show()

# Gráfico do intervalo da letra (c)
intervalo = stats.norm.interval(0.98, loc=media, scale=desvio_padrao)

plt.figure(figsize=(10, 5))
plt.plot(x, y, color='black')
plt.fill_between(x, y, where=(x >= intervalo[0]) & (x <= intervalo[1]), color='plum')
plt.axvline(intervalo[0], color='red', linestyle='--', label=f"{intervalo[0]:.2f}")
plt.axvline(intervalo[1], color='red', linestyle='--', label=f"{intervalo[1]:.2f}")
plt.title("Intervalo que abrange 98% dos diâmetros")
plt.legend()
plt.grid(True)
plt.show()
