# Thanks to Raj Singh for this example in Global Summit 2022.
# https://github.com/isc-rsingh/iris-python-2022

# DB-API is great for SQL-based access to your IRIS database

import iris

mytable = "mypydbapi.test_things"

# Create connection to IRIS
connection = iris.connect(hostname="localhost", port=1972, namespace="USER", username="SuperUser", password="SYS")

# Create table with cursor
cursor = connection.cursor()
try:
  cursor.execute(f"CREATE TABLE {mytable} (myvarchar VARCHAR(255), myint INTEGER, myfloat FLOAT)")
except Exception as inst:
  pass
cursor.close()
connection.commit()

# Create some data to fill in
chunks = []
paramSequence = []
for row in range(10):
  paramSequence.append(["This is a non-selective string every row is the same data", row%10, row * 4.57292])
  if (row>0 and ((row % 10) == 0)):
    chunks.append(paramSequence)
    paramSequence = []
chunks.append(paramSequence)

query = f"INSERT INTO {mytable} (myvarchar, myint, myfloat) VALUES (?, ?, ?)"

for chunk in chunks:
  cursor = connection.cursor()
  cursor.executemany(query, chunk)
  cursor.close()
  connection.commit()
# connection.close()

sql = f"select * from {mytable}"
rowsRead = 0
cursor = connection.cursor()
cursor.arraysize = 20

cursor.execute(sql)
rc = cursor.rowcount
rows = cursor.fetchall()
for row in rows:
  print(row)
rowsRead += len(rows)

cursor.close()
connection.close()