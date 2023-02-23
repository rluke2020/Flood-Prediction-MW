<!DOCTYPE html>
<html>
<head>
	<title>Malawi Flood Prediction App</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <p>Historical Flooding in Malawi</p>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">

                <div class="search">
                    <form method="GET">
                        <div class="form-group">
                            <label for="year">Year:</label>
                            <input type="text" name="year" id="year" class="form-control" placeholder="Enter year">
                        </div>
                        <div class="form-group">
                            <label for="district">District:</label>
                            <input type="text" name="district" id="district" class="form-control" placeholder="Enter district">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </div>

                <?php
        require_once 'config.php';
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $perPage = 5;
        $start = ($page > 1) ? ($page * $perPage) - $perPage : 0;

        $year = isset($_GET['year']) ? $_GET['year'] : '';
        $district = isset($_GET['district']) ? $_GET['district'] : '';

        $query = "SELECT districts.district_name, districts.land_area, flooding.year, flooding.flooding FROM districts INNER JOIN flooding ON districts.district_id = flooding.district_id WHERE 1=1";

        if(!empty($year)) {
            $query .= " AND flooding.year = '$year'";
        }

        if(!empty($district)) {
            $query .= " AND districts.district_name LIKE '%$district%'";
        }

        $query .= " ORDER BY year DESC LIMIT $start, $perPage";

        $result = mysqli_query($conn, $query);
        $total = mysqli_num_rows($result);

        if($total > 0) {
            echo "<table class='table'>";
            echo "<thead><tr><th>Year</th><th>District</th><th>Area</th><th>History of Flooding</th></tr></thead>";
            echo "<tbody>";
            while($row = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>".$row['year']."</td>";
                echo "<td>".$row['district_name']."</td>";
                echo "<td>".$row['land_area']."</td>";
                echo "<td>".($row['flooding'] == 1 ? 'Flooded' : 'Did not flood')."</td>";
                echo "</tr>";
            }
            echo "</tbody>";
            echo "</table>";

            $totalPages = ceil($total / $perPage);
            echo "<nav aria-label='Pagination'>";
            echo "<ul class='pagination'>";
            for($i = 1; $i <= $totalPages; $i++) {
                echo "<li class='page-item".($page == $i ? ' active' : '')."'>";
                echo "<a class='page-link' href='home.php?page=$i&year=$year&district=$district'>$i</a>";
                echo "</li>";
            }
            echo "</ul>";
            echo "</nav>";
        } else {
            echo "<p>No flooding areas.</p>";
        }
        mysqli_close($conn);
    ?>
			</div>
			<div class="col-sm-6">
				<p>Map of Malawi</p>
                <img src="/home/ariel/Desktop/work/Flood-Prediction-MW/images/download.jpeg" alt="map of malawi">
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
</html>
