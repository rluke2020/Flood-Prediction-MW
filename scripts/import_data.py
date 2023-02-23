import csv
import mysql.connector

# Connect to the database
cnx = mysql.connector.connect(
    host='127.0.0.1',
    user='luke',
    password='password',
    database='weather_db'
)
cursor = cnx.cursor()

# Open the CSV file and read its contents
with open('data_transformed.csv', 'r') as f:
    reader = csv.reader(f)
    next(reader)  # Skip the header row
    for row in reader:
        # Insert the district into the districts table
        cursor.execute(
            "INSERT INTO districts (district_name, longitude, latitude, urban_population, land_area) VALUES (%s, %s, %s, %s, %s)",
            (row[0], float(row[1]), float(row[2]), int(row[7]), float(row[8].replace(',', '')))
        )
        district_id = cursor.lastrowid  # Get the ID of the inserted district

        # Insert the river into the rivers table
        cursor.execute(
            "INSERT IGNORE INTO rivers (river_name) VALUES (%s)",
            (row[3],)
        )
        cursor.execute("SELECT river_id FROM rivers WHERE river_name = %s", (row[3],))
        river_id = cursor.fetchone()[0]  # Get the ID of the existing or newly inserted river

        # Insert the district-river relationship into the district_rivers table
        cursor.execute(
            "INSERT INTO district_rivers (district_id, river_id, elevation, distance_from_river) VALUES (%s, %s, %s, %s)",
            (district_id, river_id, int(row[4]), float(row[5]))
        )

        # Insert the rainfall data into the rainfall table
        cursor.execute(
            "INSERT INTO rainfall (district_id, month, rainfall) VALUES (%s, %s, %s)",
            (district_id, 'january', float(row[6]))
        )

        # Insert the flooding data into the flooding table
        cursor.execute(
            "INSERT INTO flooding (district_id, year, flooding) VALUES (%s, %s, %s)",
            (district_id, 2022, int(row[10]))
        )

# Commit the changes and close the cursor and connection
cnx.commit()
cursor.close()
cnx.close()

