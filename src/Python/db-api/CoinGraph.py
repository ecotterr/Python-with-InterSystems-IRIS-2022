import iris
import pandas as pd 
import matplotlib.pyplot as plt
import datetime
from pmdarima import auto_arima

# Create IRIS connection object
conn = iris.connect(hostname="localhost", port=1972, namespace="USER", username="SuperUser", password="SYS")

table = "ObjectScript.Coin"

# Create cursor object and execute SELECT * query
cursor = conn.cursor()
cursor.execute(f"SELECT * FROM {table}")

# Construct Pandas dataframe from result
df = pd.DataFrame(cursor.fetchall())
df = df.rename(columns={0:'ID',1:'Date',2:'Open',3:'High',4:'Low',5:'Close',6:'Volume'})
df = df.astype({'ID':'int','Date':'str','Open':'float','High':'float','Low':'float','Close':'float','Volume':'int'})
print(df)

# Plot dataframe
df.plot(kind='line', x='Date', y=['Open','High','Low','Close'])
plt.ylabel('Price (£)')
plt.xticks(rotation = 45)
plt.savefig("/irisdev/app/CoinGraph.png", bbox_inches="tight", dpi = 300)
print("\nGraph image saved to irisdev/app/CoinGraph.png")

# Normally, we would split our data for training and testing, but for this demo we don't care about testing accuracy.
# Using the pmdarima library for time series forecasting.
df.index = pd.to_datetime(df['Date'], format='%d/%m/%Y')
training_y = df.iloc[0:,2]
training_x = df.iloc[0:,1]
model = auto_arima(y = training_y, x = training_x,m = 30)
print("\nTraining model...")
recent_date = datetime.datetime.strptime(df['Date'].iloc[-1], '%d/%m/%Y')
new_date = (recent_date + datetime.timedelta(days=1)).strftime('%d/%m/%Y')
prediction = pd.Series(model.predict(n_periods = 1, X = new_date))
new_date = prediction[0].strftime('%d/%m/%Y')
new_open = prediction[1]
print(f"\nDate Prediction: {new_date} \nOpen Prediction: {new_open}")

# Save our new prediction back into our IRIS table:


# Closing IRIS connection
cursor.close()
conn.close()