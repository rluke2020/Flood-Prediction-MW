pip install basemap
pip install basemap-data-hires
pip install joblib

import csv
import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
from sklearn.model_selection import train_test_split
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix, f1_score, recall_score
import joblib

from warnings import filterwarnings
filterwarnings(action='ignore')

# Define MySQL connection parameters
host = 'localhost'
user = 'root'
password = 'your_password'
database = 'weather_db'

# Create a connection to the MySQL database
cnx = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database
)

# Load the data into a pandas dataframe
df = pd.read_sql_query('SELECT * FROM Flooding', cnx)

X = df[['Longitude', 'Latitude', 'elevation',
       'distance_from_river', 'rainfall', 'urban_population', 'land_area',
       'density', 'year']].values
y = df["flooding"].values

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=2)

# Define the models
model1 = RandomForestClassifier()
model2 = GradientBoostingClassifier()
# Train the models
model1.fit(X_train, y_train)
model2.fit(X_train, y_train)

# Make predictions on the test set
y_pred1 = model1.predict(X_test)
y_pred2 = model2.predict(X_test)

# Calculate the accuracy of the models
accuracy1 = accuracy_score(y_test, y_pred1)
accuracy2 = accuracy_score(y_test, y_pred2)

print(f"Random Forest Classifier Accuracy: {accuracy1.round(4)}")
print(f"Gradient Boosting Classifier Accuracy: {accuracy2.round(4)}")

#cross-validation and hyperparameter tuning

# Define the parameter grid for GradientBoostingClassifier
gb_param_grid = {
    'learning_rate': [1, 0.1, 0.05, 0.01],
    'n_estimators': [100, 200, 300,400],
    'max_depth': [1, 2, 4,5]
}

# Define the parameter grid for RandomForestClassifier
rf_param_grid = {
    'n_estimators': [10,100, 200, 300],
    'max_depth': [1,2,3, 5],
    'min_samples_split': [2, 4, 8,32],
    'min_samples_leaf': [1, 2, 4,6]
}

# Define the classifiers
gb_clf = GradientBoostingClassifier()
rf_clf = RandomForestClassifier()

# Perform grid search and cross validation for RandomForestClassifier
rf_grid_search = GridSearchCV(rf_clf, param_grid=rf_param_grid, cv=30)
rf_grid_search.fit(X_train, y_train)

# Print the best parameters and score for RandomForestClassifier
print("RandomForestClassifier:")
print("Best parameters: ", rf_grid_search.best_params_)
print("Best score: ", rf_grid_search.best_score_.round(4))

# Perform grid search and cross validation for GradientBoostingClassifier
gb_grid_search = GridSearchCV(gb_clf, param_grid=gb_param_grid, cv=30)
gb_grid_search.fit(X_train, y_train)

# Print the best parameters and score for GradientBoostingClassifier
print("GradientBoostingClassifier:")
print("Best parameters: ", gb_grid_search.best_params_)
print("Best score: ", gb_grid_search.best_score_.round(4))

#model evaluation

# Predict using the trained model
y_pred = gb_grid_search.predict(X_test)
# Compute confusion matrix
cm = confusion_matrix(y_test, y_pred)
print("Confusion Matrix:")
print(cm)


# Compute F1 score
f1 = f1_score(y_test, y_pred)
print("F1 Score:", f1)

# Compute recall score
recall = recall_score(y_test, y_pred)
print("Recall:", recall)

#saving the best model
filename = 'flood_predictor_model.sav'
joblib.dump(gb_grid_search, filename)

# Close the MySQL connection
cnx.close()
