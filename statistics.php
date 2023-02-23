<!DOCTYPE html>
<html>
<head>
	<title>Malawi Flood Prediction App</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <?php require_once 'header.php'; ?>
</head>
<body>
    <p>Please fill in all the fields to make a prediction</p>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 mx-auto mt-3">
                            <h2 class="text-center mb-2">Make a Prediction</h2>
                            <form action="statistics.php" method="post">
                                <div class="form-group">
                                    <label for="longitude">Longitude:</label>
                                    <input type="number" class="form-control" id="longitude" name="longitude" required>
                                </div>
                                <div class="form-group">
                                    <label for="latitude">Latitude:</label>
                                    <input type="number" class="form-control" id="latitude" name="latitude" required>
                                </div>
                                <div class="form-group">
                                    <label for="elevation">Elevation:</label>
                                    <input type="number" class="form-control" id="elevation" name="elevation" required>
                                </div>
                                <div class="form-group">
                                    <label for="distance_from_river">Distance from river (km):</label>
                                    <input type="number" class="form-control" id="distance_from_river" name="distance_from_river" required>
                                </div>
                                <div class="form-group">
                                    <label for="rainfall">Rainfall (mm):</label>
                                    <input type="number" class="form-control" id="rainfall" name="rainfall" required>
                                </div>
                                <div class="form-group">
                                    <label for="urban_population">Urban population:</label>
                                    <input type="number" class="form-control" id="urban_population" name="urban_population" required>
                                </div>
                                <div class="form-group">
                                    <label for="land_area">Land area (sq km):</label>
                                    <input type="number" class="form-control" id="land_area" name="land_area" required>
                                </div>
                                <div class="form-group">
                                    <label for="density">Density (people per sq km):</label>
                                    <input type="number" class="form-control" id="density" name="density" required>
                                </div>
                                <div class="form-group">
                                    <label for="year">Year:</label>
                                    <input type="number" class="form-control" id="year" name="year" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block mt-4">Predict Flood</button>
                            </form>
                        </div>
                    </div>
                </div>
                
                


			</div>
			<div class="col-sm-6">
				<p>Map of Predicted Area</p>
                <img src="/home/ariel/Desktop/work/Flood-Prediction-MW/images/download.jpeg" alt="map of predicted area">
                <!-- Include required scripts for Bootstrap and the map -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js" integrity="sha512-KhRbEU/6gP7Fcez0nUsV7Rvh8QUoEZV7GTdCJ+3FvyLYO2tGzSmLhWIe1BzNhJr+8r5JyF5Q5igbY9XzW+8p0g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js" integrity="sha384-GwUBR8yL7V+K0dTwvq9yzNldQZgSTDI/KCYql1Pe+Bq3MwDi2s+yPrx/yGVpbGpB" crossorigin="anonymous"></script>
                <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
                <script>
                    function initMap() {
                        // Define map options
                        var mapOptions = {
                            center: { lat: -13.2543, lng: 34.3015 },
                            zoom: 7
                        };
                        
                        // Create the map object
                        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                        
                        // Add any markers or other map elements here
                    }
                </script>

			</div>
		</div>
	</div>
</body>
<?php require_once 'footer.php'; ?>
</html>
