import pickle
import sys
import numpy as np
import os
from sklearn.ensemble import GradientBoostingClassifier

# Load the trained model from the pickle file
model_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'scripts/flood_predictor_model.pkl')
with open(model_path, 'rb') as f:
    model = pickle.load(f)

# Get the input data from PHP as a string and convert it to a numpy array
input_data = np.fromstring(sys.argv[1], sep=',').reshape(1, -1)

# Make the prediction using the loaded model
prediction = model.predict(input_data)[0]

# Print the prediction to the console
print(prediction)
