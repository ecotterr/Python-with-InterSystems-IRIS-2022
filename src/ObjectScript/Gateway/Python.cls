Class Gateway.Python
{

ClassMethod Demo() As %Status
{
    set sc = $$$OK

    // Creating default Python gateway connection
    set pyGate = $system.external.getPythonGateway()

    // Add Address.py path to the gateway path
    do pyGate.addToPath("/irisdev/app/src/Python/gateway/Address.py")

    // Create the proxy object for the instantiated object
    set objectBase = ##class(%Net.Remote.Object).%New(pyGate,"Address")

    // Access the "street" property
    set street = objectBase.street
    
    // write result
    zwrite street
    
    return sc
}

}
