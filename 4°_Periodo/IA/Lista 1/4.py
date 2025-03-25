import pandas as pd
import numpy as np
from collections import Counter

# Carregar o CSV
data = pd.read_csv('restaurante.csv', delimiter=';')

# Função para calcular a entropia
def entropy(target_col):
    elements, counts = np.unique(target_col, return_counts=True)
    entropy = -np.sum([(counts[i]/np.sum(counts)) * np.log2(counts[i]/np.sum(counts)) for i in range(len(elements))])
    return entropy

# Função para calcular o ganho de informação
def information_gain(data, split_attribute_name, target_name="Conclusao"):
    total_entropy = entropy(data[target_name])
    vals, counts = np.unique(data[split_attribute_name], return_counts=True)
    weighted_entropy = np.sum([(counts[i]/np.sum(counts)) * entropy(data.where(data[split_attribute_name]==vals[i]).dropna()[target_name]) for i in range(len(vals))])
    return total_entropy - weighted_entropy

# Calcular o ganho de informação para cada atributo
attributes = data.columns[:-1]
info_gains = {attr: information_gain(data, attr) for attr in attributes}

# Exibir o ganho de informação
for attr, gain in info_gains.items():
    print(f"{attr}: {gain}")

# Determinar o atributo raiz
root_attribute = max(info_gains, key=info_gains.get)
print(f"\nAtributo raiz: {root_attribute}")

# Função para gerar a árvore de decisão
def build_tree(data, original_data, features, target_attribute_name="Conclusao", parent_node_class=None):
    # Casos base
    if len(np.unique(data[target_attribute_name])) <= 1:
        return np.unique(data[target_attribute_name])[0]
    elif len(data) == 0:
        return np.unique(original_data[target_attribute_name])[np.argmax(np.unique(original_data[target_attribute_name], return_counts=True)[1])]
    elif len(features) == 0:
        return parent_node_class
    else:
        parent_node_class = np.unique(data[target_attribute_name])[np.argmax(np.unique(data[target_attribute