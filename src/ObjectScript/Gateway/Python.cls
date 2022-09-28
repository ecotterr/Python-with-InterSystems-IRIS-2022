/// Description
Class Gateway.Python
{

/// Demo
ClassMethod Demo() As %Status
{
    Set sc = $$$OK

    set pyGate = $system.external.getPythonGateway()

    do pyGate.addToPath("/irisdev/app/src/Python/gateway/Address.py")

    set objectBase = ##class(%Net.Remote.Object).%New(pyGate,"Address")

    set street = objectBase.street
    
    zwrite street
    
    return sc
}

}
