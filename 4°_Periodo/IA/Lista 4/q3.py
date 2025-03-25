import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier
from sklearn.impute import KNNImputer
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
from yellowbrick.classifier import ConfusionMatrix
from imblearn.over_sampling import SMOTE
from skopt import BayesSearchCV
from sklearn import tree

# Ler os arquivos CSV
def load_data():
    training_data = pd.read_csv('titanic/train.csv')
    test_data = pd.read_csv('titanic/test.csv')
    truth_table = pd.read_csv('titanic/gender_submission.csv')
    test_data = test_data.merge(truth_table, on='PassengerId', how='left')
    return training_data, test_data

# Pré-processamento com KNNImputer
def preprocess_data(training_data, test_data):
    columns_to_drop = ['PassengerId', 'Name', 'Ticket', 'Cabin', 'Embarked']
    encoder = LabelEncoder()
    training_data['Sex'] = encoder.fit_transform(training_data['Sex'])
    test_data['Sex'] = encoder.transform(test_data['Sex'])
    
    imputer = KNNImputer( n_neighbors=5 )
    columns_to_input = ['Age', 'Fare']
    training_data[columns_to_input] = imputer.fit_transform( training_data[columns_to_input] )
    test_data[columns_to_input] = imputer.transform( test_data[columns_to_input] )
    
    X_treino = training_data.drop(columns=columns_to_drop + ['Survived'], axis=1)
    y_treino = training_data['Survived']
    X_teste = test_data.drop(columns=columns_to_drop + ['Survived'], axis=1)
    y_teste = test_data['Survived']
    
    return X_treino, y_treino, X_teste, y_teste

# Balanceamento com SMOTE
def balance_data(X_treino, y_treino):
    smote = SMOTE(random_state=42)
    return smote.fit_resample(X_treino, y_treino)

# Otimização de hiperparâmetros
def optimize_hyperparameters(X_resampled, y_resampled):
    rf_params = {
        'n_estimators': (50, 200),
        'max_depth': (2, 10),
        'max_features': ['sqrt', 'log2'],
        'min_samples_split': (2, 10)
    }
    
    rf_modelo = BayesSearchCV(
        RandomForestClassifier(),
        search_spaces=rf_params,
        cv=5,
        n_jobs=-1,
        verbose=1,
        random_state=42
    )
    rf_modelo.fit(X_resampled, y_resampled)
    return rf_modelo.best_params_

# Treinar modelo
def train_model(X_resampled, y_resampled, best_params):
    modelo = RandomForestClassifier(**best_params, random_state=42)
    modelo.fit(X_resampled, y_resampled)
    return modelo

# Avaliação
def evaluate_model(modelo, X_teste, y_teste):
    predictions = modelo.predict(X_teste)
    print("Acurácia:", accuracy_score(y_teste, predictions))
    print("Matriz de Confusão:\n", confusion_matrix(y_teste, predictions))
    print("Relatório de Classificação:\n", classification_report(y_teste, predictions))

# Executar pipeline
if __name__ == "__main__":
    training_data, test_data = load_data()
    X_treino, y_treino, X_teste, y_teste = preprocess_data(training_data, test_data)
    X_resampled, y_resampled = balance_data(X_treino, y_treino)
    best_params = optimize_hyperparameters(X_resampled, y_resampled)
    model = train_model(X_resampled, y_resampled, best_params)
    evaluate_model(model, X_teste, y_teste)
