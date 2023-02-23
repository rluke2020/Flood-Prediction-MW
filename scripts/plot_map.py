import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap

# Load data from CSV file
data = pd.read_csv("malawi_districts_coordinates.csv")

# Initialize the map
m = Basemap(
    llcrnrlon=32, llcrnrlat=-17, urcrnrlon=36, urcrnrlat=-9,
    resolution='h', projection='merc', lat_0 = -13, lon_0 = 34)

# Draw coastlines, countries, and states
m.drawcoastlines(linewidth=0.5)
m.drawcountries(linewidth=0.5)
m.drawstates(linewidth=0.5)

# Plot each district as a point on the map
for index, row in data.iterrows():
    lon, lat = m(row['longitude'], row['latitude'])
    m.plot(lon, lat, 'ro', markersize=5)

# Add a title to the map
plt.title("Map of Malawi")

# Show the map
plt.show()
