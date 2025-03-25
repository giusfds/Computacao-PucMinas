import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Lista com os valores extraídos da imagem
dados = [
    74.0, 74.4, 73.4, 73.2, 74.1, 74.3, 72.9, 74.5, 74.7, 77.5,
    74.7, 74.8, 74.7, 76.5, 75.0, 74.9, 77.1, 76.0, 74.7, 74.7,
    75.1, 75.1, 74.8, 76.0, 77.0, 75.0, 74.6, 75.8, 73.3, 74.3,
    76.8, 73.4, 75.6, 74.2, 73.5, 75.9, 73.6, 74.2, 77.3, 74.3
]

# Definição dos intervalos (bins) para o histograma
bins = np.arange(min(dados), max(dados) + 0.5, 0.5)  # Intervalos de 0.5°C

# Criando o histograma
plt.figure(figsize=(8,5))
plt.hist(dados, bins=bins, edgecolor='black', alpha=0.7, color='orange')

# Configurações do gráfico
plt.xlabel("Temperatura (°C)")
plt.ylabel("Frequência")
plt.title("Histograma das Temperaturas Registradas")
plt.xticks(bins)  # Mostrar os valores dos intervalos no eixo X
plt.grid(axis='y', linestyle='--', alpha=0.7)

# Exibir o histograma
plt.show()
