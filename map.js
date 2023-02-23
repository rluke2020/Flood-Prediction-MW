var L = require('leaflet');
var $ = require('jquery');

// Load the map centered on Malawi
var map = L.map('map').setView([-13.2543, 34.3015], 7);

// Add the OpenStreetMap tiles
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
        '<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
        'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
}).addTo(map);

// Load the data points from the weather_db and add them to the map as markers
$.getJSON('load_data.php', function(data) {
    for (var i = 0; i < data.length; i++) {
        var marker = L.marker([data[i].Latitude, data[i].Longitude]).addTo(map);
        marker.bindPopup("<b>Risk of Flooding: </b>" + data[i].flooding + "<br>" +
                         "<b>Longitude: </b>" + data[i].Longitude + "<br>" +
                         "<b>Latitude: </b>" + data[i].Latitude + "<br>" +
                         "<b>Elevation: </b>" + data[i].elevation + "<br>" +
                         "<b>Distance from River: </b>" + data[i].distance_from_river + "<br>" +
                         "<b>Rainfall: </b>" + data[i].rainfall + "<br>" +
                         "<b>Urban Population: </b>" + data[i].urban_population + "<br>" +
                         "<b>Land Area: </b>" + data[i].land_area + "<br>" +
                         "<b>Density: </b>" + data[i].density + "<br>" +
                         "<b>Year: </b>" + data[i].year);
    }
});
