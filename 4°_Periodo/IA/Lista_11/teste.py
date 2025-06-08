import os
import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.ensemble import RandomForestClassifier
from skopt import BayesSearchCV
from skopt.space import Integer, Real, Categorical
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
from sklearn.cluster import KMeans, DBSCAN
from sklearn.decomposition import PCA
import matplotlib.pyplot as plt
import seaborn as sns
from mlxtend.frequent_patterns import apriori, association_rules
from mlxtend.preprocessing import TransactionEncoder

# ---------------------------------------
# Initial Configurations
# ---------------------------------------
# Set to True for more verbose output during execution
verbose = True

# ---------------------------------------
# Loading Data
# ---------------------------------------
# Define the path to the dataset files.
# IMPORTANT: Ensure 'titanic' folder is in the same directory as this script,
# and contains 'train.csv', 'test.csv', and 'gender_submission.csv'.
try:
    training_data = pd.read_csv('titanic/train.csv')
    test_data = pd.read_csv('titanic/test.csv')
    truth_table = pd.read_csv('titanic/gender_submission.csv')
    if verbose:
        print("Data loaded successfully.")
except FileNotFoundError:
    print("Error: Dataset files not found.")
    print("Please ensure you have a 'titanic' folder in the same directory as the script,")
    print("and it contains 'train.csv', 'test.csv', and 'gender_submission.csv'.")
    exit() # Exit the script if files are not found

# Add 'Survived' column to test_data for consistency, initialized with NaN
test_data.insert(0, 'Survived', np.nan)

# ---------------------------------------
# Data Preprocessing
# ---------------------------------------
if verbose:
    print("\nStarting data preprocessing...")

# Columns to drop from both training and test datasets
columns_to_drop = ['PassengerId', 'Name', 'SibSp', 'Parch', 'Ticket', 'Cabin', 'Embarked']

# Fill missing 'Age' and 'Fare' values with their respective means
training_data['Age'] = training_data['Age'].fillna(training_data['Age'].mean())
training_data['Fare'] = training_data['Fare'].fillna(training_data['Fare'].mean())
test_data['Age'] = test_data['Age'].fillna(test_data['Age'].mean())
test_data['Fare'] = test_data['Fare'].fillna(test_data['Fare'].mean())

# Encode 'Sex' column (male/female) into numerical values (0/1)
encoder = LabelEncoder()
training_data['Sex'] = encoder.fit_transform(training_data['Sex'])
test_data['Sex'] = encoder.transform(test_data['Sex'])

# Create 'FamilySize' feature (SibSp + Parch + 1 for self)
training_data['FamilySize'] = training_data['SibSp'] + training_data['Parch'] + 1
test_data['FamilySize'] = test_data['SibSp'] + test_data['Parch'] + 1

# Create 'isAlone' feature (1 if FamilySize is 1, 0 otherwise)
training_data['isAlone'] = (training_data['FamilySize'] == 1).astype(int)
test_data['isAlone'] = (test_data['FamilySize'] == 1).astype(int)

# Scale numerical features ('Age', 'Fare', 'FamilySize') using StandardScaler
scaler = StandardScaler()
training_data[['Age', 'Fare', 'FamilySize']] = scaler.fit_transform(training_data[['Age', 'Fare', 'FamilySize']])
test_data[['Age', 'Fare', 'FamilySize']] = scaler.transform(test_data[['Age', 'Fare', 'FamilySize']])

# Drop the specified columns from both datasets
training_data.drop(columns=columns_to_drop, inplace=True)
test_data.drop(columns=columns_to_drop, inplace=True)

if verbose:
    print("Preprocessing complete.")
    print("Training data head after preprocessing:")
    print(training_data.head())
    print("\nTest data head after preprocessing:")
    print(test_data.head())

# ---------------------------------------
# Separating Training and Test Data
# ---------------------------------------
# Features (X) and target (y) for training
X_train = training_data.drop(columns=['Survived'])
y_train = training_data['Survived']

# Features for testing and the true labels for evaluation
X_test = test_data.drop(columns=['Survived'])
y_test = truth_table['Survived'] # Using the provided gender_submission.csv for true labels

if verbose:
    print(f"\nX_train shape: {X_train.shape}, y_train shape: {y_train.shape}")
    print(f"X_test shape: {X_test.shape}, y_test shape: {y_test.shape}")

# ---------------------------------------
# Optimizing and Training Models
# ---------------------------------------
if verbose:
    print("\nStarting Bayesian Optimization for RandomForestClassifier...")

# Random Forest Classifier optimization
rf_model = RandomForestClassifier(random_state=42)
rf_space = {
    'n_estimators': Integer(100, 1000),
    'max_depth': Integer(3, 30),
    'min_samples_split': Integer(2, 20),
    'min_samples_leaf': Integer(1, 20),
    'max_features': Categorical(['sqrt', 'log2', None]),
    'bootstrap': Categorical([True, False])
}
rf_search = BayesSearchCV(
    estimator=rf_model,
    search_spaces=rf_space,
    n_iter=50,  # Number of optimization iterations. Can be reduced for faster testing.
    cv=5,       # Number of cross-validation folds.
    scoring='accuracy',
    n_jobs=-1,  # Use all available CPU cores
    random_state=42
)
rf_search.fit(X_train, y_train)
best_rf_params = rf_search.best_params_
best_rf = rf_search.best_estimator_

if verbose:
    print(f"RandomForestClassifier optimization finished. Best parameters: {best_rf_params}")
    print(f"Best RandomForestClassifier cross-validation accuracy: {rf_search.best_score_:.4f}")

if verbose:
    print("\nStarting Bayesian Optimization for MLPClassifier...")

# MLP Classifier optimization
# Increased max_iter and added early_stopping to improve stability and convergence
mlp_model = MLPClassifier(max_iter=2000, random_state=42, early_stopping=True) # Increased max_iter and added early_stopping
mlp_space = {
    'hidden_layer_sizes': Integer(5, 500),
    'activation': Categorical(['tanh', 'relu']),
    'solver': Categorical(['adam', 'sgd']),
    'alpha': Real(1e-5, 1e-1, prior='log-uniform'),
    'learning_rate_init': Real(1e-4, 1e-1, prior='log-uniform')
}
mlp_search = BayesSearchCV(
    estimator=mlp_model,
    search_spaces=mlp_space,
    n_iter=50,  # Number of optimization iterations. Can be reduced for faster testing.
    cv=5,       # Number of cross-validation folds.
    scoring='accuracy',
    n_jobs=-1,  # Use all available CPU cores
    random_state=42
)
mlp_search.fit(X_train, y_train)
best_mlp_params = mlp_search.best_params_
best_mlp = mlp_search.best_estimator_

if verbose:
    print(f"MLPClassifier optimization finished. Best parameters: {best_mlp_params}")
    print(f"Best MLPClassifier cross-validation accuracy: {mlp_search.best_score_:.4f}")

# Train final models with best parameters
if verbose:
    print("\nTraining final models with optimized parameters...")
rf_model = RandomForestClassifier(**best_rf_params, random_state=42)
rf_model.fit(X_train, y_train)
y_pred_rf = rf_model.predict(X_test)

# Re-instantiate MLP model with best parameters and early_stopping for final training
mlp_model = MLPClassifier(**best_mlp_params, max_iter=2000, random_state=42, early_stopping=True) # Ensure consistency
mlp_model.fit(X_train, y_train)
y_pred_mlp = mlp_model.predict(X_test)

if verbose:
    print("Final model training complete.")

# ---------------------------------------
# Model Evaluation
# ---------------------------------------
if verbose:
    print("\n--- RandomForestClassifier Evaluation ---")
    print(f"Accuracy: {accuracy_score(y_test, y_pred_rf):.4f}")
    print("Classification Report:")
    print(classification_report(y_test, y_pred_rf))
    print("Confusion Matrix:")
    print(confusion_matrix(y_test, y_pred_rf))

    print("\n--- MLPClassifier Evaluation ---")
    print(f"Accuracy: {accuracy_score(y_test, y_pred_mlp):.4f}")
    print("Classification Report:")
    print(classification_report(y_test, y_pred_mlp))
    print("Confusion Matrix:")
    print(confusion_matrix(y_test, y_pred_mlp))

# ---------------------------------------
# Clustering with KMeans + PCA and DBSCAN
# ---------------------------------------
if verbose:
    print("\nStarting clustering analysis and plot generation...")

# Create 'graficos' directory if it doesn't exist
os.makedirs('graficos', exist_ok=True)

# Prepare data for clustering (excluding 'Survived' column)
X_cluster = training_data.drop(columns=['Survived'])

# --- KMeans + PCA ---
# Perform KMeans clustering
kmeans = KMeans(n_clusters=3, random_state=42, n_init=10) # Added n_init for newer KMeans versions
clusters_kmeans = kmeans.fit_predict(X_cluster)

# Apply PCA for dimensionality reduction to 2 components for visualization
pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_cluster)

# Plot KMeans clusters
plt.style.use('seaborn-v0_8-darkgrid') # Updated seaborn style for newer versions
plt.figure(figsize=(12, 7))
sns.scatterplot(
    x=X_pca[:, 0], y=X_pca[:, 1],
    hue=clusters_kmeans,
    palette='viridis',
    alpha=0.85,
    s=120,
    edgecolor='k'
)
plt.title('Passenger Clustering (K-Means + PCA)', fontsize=18, fontweight='bold')
plt.xlabel('Principal Component 1', fontsize=14, fontweight='bold')
plt.ylabel('Principal Component 2', fontsize=14, fontweight='bold')
plt.legend(title='Cluster', fontsize=12, title_fontsize=13)
plt.grid(True, linestyle='--', alpha=0.5)
plt.tight_layout()
plt.savefig('graficos/clusterizacao_kmeans_pca.png', dpi=180)
plt.close() # Close the plot to free memory

if verbose:
    print("KMeans + PCA plot saved to graficos/clusterizacao_kmeans_pca.png")

# --- DBSCAN + PCA ---
# Perform DBSCAN clustering. Adjust eps and min_samples as needed for your data.
# Common values for eps are often found by looking at the k-distance graph.
dbscan = DBSCAN(eps=0.5, min_samples=5)
clusters_dbscan = dbscan.fit_predict(X_cluster)

# Create a temporary DataFrame for plotting DBSCAN results
X_clustered_dbscan = training_data.copy()
X_clustered_dbscan['Cluster'] = clusters_dbscan
X_clustered_dbscan['PCA1'] = X_pca[:, 0]
X_clustered_dbscan['PCA2'] = X_pca[:, 1]

# Plot DBSCAN clusters
plt.figure(figsize=(12, 7))
sns.scatterplot(
    x='PCA1', y='PCA2',
    hue='Cluster',
    data=X_clustered_dbscan,
    palette='tab10',
    style=(X_clustered_dbscan['Cluster'] == -1).map({True: 'X', False: 'o'}), # Mark noise points with 'X'
    s=120,
    edgecolor='k'
)
plt.title('Passenger Clusters with DBSCAN (PCA)', fontsize=18, fontweight='bold')
plt.xlabel('Principal Component 1', fontsize=14, fontweight='bold')
plt.ylabel('Principal Component 2', fontsize=14, fontweight='bold')
plt.legend(title='Cluster', fontsize=12, title_fontsize=13)
plt.grid(True, linestyle='--', alpha=0.5)
plt.tight_layout()
plt.savefig('graficos/clusterizacao_dbscan_pca.png', dpi=180)
plt.close() # Close the plot to free memory

if verbose:
    print("DBSCAN + PCA plot saved to graficos/clusterizacao_dbscan_pca.png")
    print("Clustering analysis complete.")

# ---------------------------------------
# Extracting Association Rules
# ---------------------------------------
if verbose:
    print("\nStarting association rule mining...")

# Create a copy of the training data for association rule mining
df_apriori_prep = training_data.copy()

# Map numerical codes back to descriptive strings for better interpretability
df_apriori_prep['Sex'] = df_apriori_prep['Sex'].map({0: 'male', 1: 'female'})
df_apriori_prep['Survived'] = df_apriori_prep['Survived'].map({0: 'Not Survived', 1: 'Survived'})
df_apriori_prep['Pclass'] = df_apriori_prep['Pclass'].map({1: '1st class', 2: '2nd class', 3: '3rd class'})
df_apriori_prep['isAlone'] = df_apriori_prep['isAlone'].map({0: 'not alone', 1: 'alone'})

# Select relevant columns and convert to string type for TransactionEncoder
df_apriori_features = df_apriori_prep[['Sex', 'Pclass', 'isAlone', 'Survived']].astype(str)

# Convert DataFrame to a list of lists (transactions)
transactions = df_apriori_features.values.tolist()

# Use TransactionEncoder to one-hot encode the transactions
te = TransactionEncoder()
te_ary = te.fit(transactions).transform(transactions)
df_encoded = pd.DataFrame(te_ary, columns=te.columns_)

# Find frequent itemsets using the Apriori algorithm
# Adjust min_support if few/no itemsets are found (e.g., 0.01 or 0.005)
frequent_itemsets = apriori(df_encoded, min_support=0.03, use_colnames=True)

# Generate association rules from frequent itemsets
# Adjust min_threshold if few/no rules are found (e.g., 0.5 or 0.4)
rules = association_rules(frequent_itemsets, metric="confidence", min_threshold=0.6)

# Sort rules by lift in descending order
rules = rules.sort_values(by='lift', ascending=False)

if verbose:
    print("\nAssociation rules found (top 10 by lift):")
    if not rules.empty:
        print(rules[['antecedents', 'consequents', 'support', 'confidence', 'lift']].head(10))
    else:
        print("No association rules found with the current min_support and min_threshold.")
        print("Consider reducing 'min_support' (e.g., 0.01) or 'min_threshold' (e.g., 0.4) if needed.")

if verbose:
    print("\nScript execution complete.")
