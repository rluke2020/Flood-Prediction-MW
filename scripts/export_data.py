import csv
import mysql.connector

# Connect to MySQL server
db = mysql.connector.connect(
  host="localhost",
  user="luke",
  password="password",
  database="weather_db"
)

# Define function to export data to CSV
def export_to_csv(query, filename):
    cursor = db.cursor()
    cursor.execute(query)

    with open(filename, 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(["district_name", "Longitude", "Latitude", "river_name", "elevation(ft)", "distance_from_river(nmi)", "rainfall", "urban_population", "land_area", "density", "flooding"])
        for row in cursor.fetchall():
            writer.writerow(row)

# Export data based on district
export_to_csv("SELECT * FROM weather_data ORDER BY district_name", "weather_data_by_district.csv")

# Export data based on river name
export_to_csv("SELECT * FROM weather_data ORDER BY river_name", "weather_data_by_river_name.csv")

# Export data based on date
export_to_csv("SELECT * FROM weather_data ORDER BY date", "weather_data_by_date.csv")
