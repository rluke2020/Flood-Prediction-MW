from flask import Flask, request, jsonify
import joblib

# Load the model
model = joblib.load("flood_predictor_model.sav")

# Create a Flask app
app = Flask(__name__)

# Define a route for the API endpoint
@app.route("/predict_flood", methods=["POST"])
def predict_flood():
    # Get the JSON payload from the request
    data = request.get_json()

    # Extract the input features from the JSON payload
    longitude = data["Longitude"]
    latitude = data["Latitude"]
    elevation = data["elevation"]
    distance_from_river = data["distance_from_river"]
    rainfall = data["rainfall"]
    urban_population = data["urban_population"]
    land_area = data["land_area"]
    density = data["density"]
    year = data["year"]

    # Make a prediction using the loaded model
    prediction = model.predict([[longitude, latitude, elevation, distance_from_river, rainfall, urban_population, land_area, density, year]])

    # Format the prediction as a dictionary
    output = {"prediction": int(prediction[0])}

    # Return the prediction as JSON
    return jsonify(output)

if __name__ == "__main__":
    app.run(debug=True)
