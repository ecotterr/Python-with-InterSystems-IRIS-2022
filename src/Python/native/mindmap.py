# Inspired by the "globals-mindmap" contest entry by Yuri Marx
# https://openexchange.intersystems.com/package/global-mindmap

# Native API gives direct access to IRIS Globals as well as ObjectScript methods + routines

import irisnative

# Make connection to InterSystems IRIS database
connection = irisnative.createConnection("localhost", 1972, "USER", "SuperUser", "SYS")

# Function to write a JSON object to globals
def writeJSON(jo, irisnc):
    for key in jo:
        irisnc.set(jo[key], "^mymindmap", jo["id"], key)

samplemap = {"id":"1","topic":"books","parent":""}
samplechild = {"id":"2","topic":"fiction","parent":"1"}
samplegrandchild = {"id":"3","topic":"Pride and Prejudice","parent":"2"}

# Create an InterSystems IRIS native object
myIris = irisnative.createIris(connection)

st = writeJSON(samplemap, myIris)
print(st)
st = writeJSON(samplechild, myIris)
print(st)
st = writeJSON(samplegrandchild, myIris)
print(st)