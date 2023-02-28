<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

function predict_flood_status($longitude, $latitude, $elevation, $distance_from_river, $rainfall, $urban_population, $land_area, $density, $year) {
    // Construct the input data as a comma-separated string
    $input_data = "$longitude,$latitude,$elevation,$distance_from_river,$rainfall,$urban_population,$land_area,$density,$year";

    // Call the Python script with the input data
    $command = "python3 " . __DIR__ . "/model.py " . escapeshellarg($input_data);
    $output = shell_exec($command);
    // Return the prediction
    return $output;
}

?>
