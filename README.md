# 1. Using Python with InterSystems IRIS
Presented at UK&I Summit, October 2022.
Demo showing various ways to use Python with InterSystems IRIS Data Platform:
* Embedded Python (available for 2021.2 +)
* DB-API (available for 2022.1 +)
* Python Gateway
* IRIS Native API

Thanks go to Guillaume Rongier @grongierisc for his many Python demos, upon which this was built, as well as Raj Singh @isc-rsingh for some sample code from his Global Summit 2022 presentation on the subject.

# 2. Running this demo:
Please ensure you have Docker Desktop and Git installed wherever you wish to run this demo. This guide will assume you are using Visual Studio Code with the Docker Extension installed.
```
git clone https://github.com/ISCecotterr/iris-python-demo
```

Then in your cloned directory:
```
docker-compose up -d
```

In Visual Studio Code, right-click the container "iris-python-demo" and choose to "Attach Shell".

Now you can use the command line in the container and use ```irissession IRIS``` to access the IRIS terminal, and run ObjectScript commands.