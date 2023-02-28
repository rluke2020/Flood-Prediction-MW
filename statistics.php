<?php 
require_once('header.php');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the user input
    $longitude = floatval($_POST['longitude']);
    $latitude = floatval($_POST['latitude']);
    $elevation = floatval($_POST['elevation']);
    $distance_from_river = floatval($_POST['distance_from_river']);
    $rainfall = floatval($_POST['rainfall']);
    $urban_population = floatval($_POST['urban_population']);
    $land_area = floatval($_POST['land_area']);
    $density = floatval($_POST['density']);
    $year = intval($_POST['year']);

    // Make a prediction using the model
    require_once('my_model.php');
    $prediction = predict_flood_status($longitude, $latitude, $elevation, $distance_from_river, $rainfall, $urban_population, $land_area, $density, $year);

    // Display the prediction
    echo "Based on the given input, the predicted flood status is: " . $prediction;
} else {
    // Display the input form to the user
    ?>
<form method="POST">
  <label>Longitude:</label><br />
  <input type="number" step="any" name="longitude" required /><br />

  <label>Latitude:</label><br />
  <input type="number" step="any" name="latitude" required /><br />

  <label>Elevation:</label><br />
  <input type="number" step="any" name="elevation" required /><br />

  <label>Distance from river:</label><br />
  <input type="number" step="any" name="distance_from_river" required /><br />

  <label>Rainfall:</label><br />
  <input type="number" step="any" name="rainfall" required /><br />

  <label>Urban population:</label><br />
  <input type="number" step="any" name="urban_population" required /><br />

  <label>Land area:</label><br />
  <input type="number" step="any" name="land_area" required /><br />

  <label>Density:</label><br />
  <input type="number" step="any" name="density" required /><br />

  <label>Year:</label><br />
  <input type="number" step="1" name="year" required /><br /><br />

  <input type="submit" value="Submit" />
</form>
<?php
    
}
?>
