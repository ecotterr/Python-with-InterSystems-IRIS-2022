# 1. Using Python with InterSystems IRIS
Presented at UK&I Summit, October 2022.
Demo showing various ways to use Python with InterSystems IRIS Data Platform:
* Embedded Python
* DB-API
* Python Gateway
* IRIS Native API

# 2. Starting this demo:
Please ensure you have Docker Desktop and Git installed wherever you wish to run this demo. This guide will assume you are using Visual Studio Code with the Docker Extension installed.

``` 
git clone https://github.com/ISCecotterr/Python-with-InterSystems-IRIS-2022
```

Then in your cloned directory:

```
docker-compose up -d 
```

In VS Code Docker Extension, right-click the container and choose to "Attach Shell".

Now you can use the command line in the container and use ```irissession IRIS``` to access the IRIS terminal, and run ObjectScript commands.

To view the Management Portal, go to http://localhost:52775/csp/sys/UtilHome.csp and login with username: _System, password: SYS

# 3. Exploring this demo:
The *src > Python* directory contains the .py scripts used for the various examples.

The *src > ObjectScript* directory similarly contains the classes needed to support these.

## 3.1. Embedded Python
*src > ObjectScript > Embedded > Networks.cls*

This class demonstrates how to:
* Create methods written in Python
* Store data generated from Python into IRIS Globals, with structure.
* Retrieve data from those Globals with Python methods
* Kill globals with Python methods

First, access the IRIS terminal: ```irissession IRIS```

Create the network:

1. ```do ##class(ObjectScript.Embedded.Networks).CreateNetwork(15)```

To view the data now in globals:

2. ```do ##class(ObjectScript.Embedded.Networks).ShowNetwork()```

In section 3.2, we will access these globals with the Native API...

Documentation: https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=AFL_epython 

## 3.2. Native API
*src > Python > native > Networks.py*

We now use the Native API to access the network globals created with Embedded Python and generate PNG files to illustrate the graphs.

In the container terminal, run:
1. ```cd src/Python/native```
2. ```python3 Networks.py```

The graph image will have been saved in /irisdev/app/Network.png and can be copied locally (from your local terminal, not the container terminal) with:

```docker cp <containerId>:/irisdev/app/Network.png /Your-Local-Path/Network.png```

Documentation: https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=PAGE_python_native&ADJUST=1

## 3.3. Python Gateway
*src > ObjectScript > Gateway > Coin.cls*

The GetCoinValues() ClassMethod of this Class shows step-by-step how to:
* Create a Python Gateway connection to IRIS
* Add a .py file to the Gateway paths
* Instantiate Python classes from ObjectScript
* Access properties of the proxy objects with ObjectScript

To run this, go to the container command line and run:
1. ```irissession IRIS```
2. ```do ##class(ObjectScript.Gateway.Coin).GetCoinValues()```

You can then exit the IRIS terminal with ```halt```

Documentation: https://docs.intersystems.com/iris20221/csp/docbook/Doc.View.cls?KEY=BEXTSERV_intro

## 3.4. DB-API
*src > Python > db-api > CoinGraph.py*

This .py shows how to:
* Create a connection to IRIS for SQL-based access
* Use a cursor object to execute queries
* Access query results and convert to a Pandas dataframe
* Insert results back into IRIS via SQL

To run this, in the container command line:
1. ```cd src/Python/db-api```
2. ```python3 CoinGraph.py```

This script selects the coin values, plots them and saves the image to irisdev/app/CoinGraph.png and then uses an ARIMA to perform time series forecasting, and predict the open price for the following day. It then saves this new value in our table ObjectScript.Coin and the CoinGraph.py can be performed iteratively. Note: this is not a very good prediction.

Documentation: https://docs.intersystems.com/iris20221/csp/docbook/Doc.View.cls?KEY=BTPI_pyapi

# Notes
Thanks go to Guillaume Rongier @grongierisc for his many Python demos, upon which this was built, as well as Yuhang Xia for some of the networkx code.

Presented for InterSystems UK & Ireland Summit, 19th October 2022 by Elijah Cotterrell
