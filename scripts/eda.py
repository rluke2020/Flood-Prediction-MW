import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from mpl_toolkits.basemap import Basemap
from warnings import filterwarnings
filterwarnings(action='ignore')

# Define MySQL connection parameters
host = 'localhost'
user = 'luke'
password = 'password'
database = 'weather_db'

# Create a connection to the MySQL database
cnx = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database
)

# Load the data into a pandas dataframe
df = pd.read_sql_query('SELECT * FROM Flooding', cnx)

# Display summary statistics
print('Summary Statistics:')
print(df.describe())

# Initialize the map
m = Basemap(
    llcrnrlon=32, llcrnrlat=-17, urcrnrlon=36, urcrnrlat=-9,
    resolution='h', projection='merc', lat_0 = -13, lon_0 = 34)

# Draw coastlines, countries, and states
m.drawcoastlines(linewidth=0.5)
m.drawcountries(linewidth=0.5)
m.drawstates(linewidth=0.5)

data=df[['Longitude','Latitude']]
# Plot each district as a point on the map
for index, row in data.iterrows():
    lon, lat = m(row['Longitude'], row['Latitude'])
    m.plot(lon, lat, 'ro', markersize=5)

# Add a title to the map
plt.title("Map of Malawi showing the districts(towns/cities)")

# Show the map
plt.show();

# check for ,issing values
print('Missing Value Counts:')
print(df.isna().sum())

#handling missing values
# Compute the mean of the 'distance_from_river' column and fill missing values with it
mean_distance = df['distance_from_river'].mean()
df['distance_from_river'] = df['distance_from_river'].fillna(mean_distance)

# Compute the mean of the 'rainfall' column and fill missing values with it
mean_rainfall = df['rainfall'].mean()
df['rainfall'] = df['rainfall'].fillna(mean_rainfall)

# Display missing value counts
print('Missing Value Counts:')
print(df.isna().sum())

# Plot a histogram of rainfall
plt.figure(figsize=(12, 6))
sns.distplot(df['rainfall'], kde=True)
plt.title('rainfall Histogram')
plt.show();

# Plot a bar chart of districts with the most flooding incidents
# Get the district counts and names
district_counts = df['district_name'].value_counts()
district_names = df[['district_name']].drop_duplicates().set_index('district_name')

# Join the counts with the names
district_counts = district_counts.to_frame().join(district_names).reset_index()
district_counts.rename(columns={'index': 'district_name', 'district_name': 'count'}, inplace=True)

# Plot the bar chart
plt.figure(figsize=(12, 6))
sns.barplot(x='district_name', y='count', data=district_counts)
plt.title('Districts with the Most Flooding Incidents')
plt.xticks(rotation=45)
plt.show()

# Plot a bar chart of rivers with the most flooding incidents
# Get the counts of flooding incidents by river
river_counts = df['river name'].value_counts()

# Create a DataFrame with the river names and counts
river_names = df[['river name']].drop_duplicates().set_index('river name')
river_counts = river_counts.to_frame().join(river_names).reset_index()
river_counts.rename(columns={'index': 'river name', 'river name': 'count'}, inplace=True)

# Plot a bar chart with the river names and counts
plt.figure(figsize=(12, 6))
sns.barplot(x='river name', y='count', data=river_counts)
plt.title('Rivers with the Most Flooding Incidents')
plt.xticks(rotation=45)
plt.show();

#plotting the history of flooding in malawi using a map and heat signatures
data = df[["Longitude","Latitude","year", "flooding"]]

# Create a new figure and axis with Basemap projection
fig = plt.figure(figsize=(8, 8))
m = Basemap(projection='merc', resolution='h', 
            llcrnrlon=data['Longitude'].min() - 1, llcrnrlat=data['Latitude'].min() - 1,
            urcrnrlon=data['Longitude'].max() + 1, urcrnrlat=data['Latitude'].max() + 1)

# Draw coastlines, country boundaries, and fill continents
m.drawcoastlines(linewidth=0.5)
m.drawcountries(linewidth=0.5)
m.fillcontinents(color='lightgray', lake_color='white')

# Draw parallels and meridians
m.drawparallels(range(int(data['Latitude'].min() - 1), int(data['Latitude'].max() + 1), 1), labels=[1,0,0,0], fontsize=10)
m.drawmeridians(range(int(data['Longitude'].min() - 1), int(data['Longitude'].max() + 1), 1), labels=[0,0,0,1], fontsize=10)

# Add data points to the map
for year in data['year'].unique():
    # Filter the DataFrame to get data for the current year
    df_year = data[data['year'] == year]
    
    # Plot data points on the map
    x, y = m(df_year['Longitude'].tolist(), df_year['Latitude'].tolist())
    m.scatter(x, y, s=20, c=df_year['flooding'], cmap=plt.get_cmap('jet'), alpha=0.5, label=year)

# Add a colorbar and legend
plt.colorbar(label='flooding')
plt.legend(loc='best', fontsize=10)

# Show the plot
plt.show()



# Close the MySQL connection
cnx.close()
