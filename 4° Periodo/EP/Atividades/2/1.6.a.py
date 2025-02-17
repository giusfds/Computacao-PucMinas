import numpy as np
import pandas as pd

# Lista com os valores extraídos da imagem
dados = [
    74.0, 74.4, 73.4, 73.2, 74.1, 74.3, 72.9, 74.5, 74.7, 77.5,
    74.7, 74.8, 74.7, 76.5, 75.0, 74.9, 77.1, 76.0, 74.7, 74.7,
    75.1, 75.1, 74.8, 76.0, 77.0, 75.0, 74.6, 75.8, 73.3, 74.3,
    76.8, 73.4, 75.6, 74.2, 73.5, 75.9, 73.6, 74.2, 77.3, 74.3
]

# Criando uma tabela de frequencias
df_freq = pd.DataFrame(dados, columns=["Temperatura"])
tabela_freq = df_freq["Temperatura"].value_counts().sort_index().reset_index()
tabela_freq.columns = ["Temperatura (°C)", "Frequencia"]

# Exibir a tabela de frequencias
tabela_freq
