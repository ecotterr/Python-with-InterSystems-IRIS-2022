# Native API gives direct access to IRIS Globals as well as ObjectScript methods + routines
import irisnative

# Create database connection and IRIS instance
connection = irisnative.createConnection("localhost", 1972, "USER", "superuser", "SYS", sharedmemory = False)
myIris = irisnative.createIris(connection)

# Call ClassMethod
passenger = myIris.classMethodObject("Titanic.Table.Passenger","%OpenId",1)
print(passenger.get("name"))

# Set and Print Global
myIris.set("hello","myGlobal")
print(myIris.get("myGlobal"))
