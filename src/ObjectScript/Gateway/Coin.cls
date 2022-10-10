Class ObjectScript.Gateway.Coin
{

ClassMethod GetCoinValues()
{
    set sc = $$$OK

    // Creating default Python gateway connection
    set pyGate = $system.external.getPythonGateway()

    // Add Crypto.py path to the gateway
    do pyGate.addToPath("/irisdev/app/src/Python/gateway/Coin.py")

    // Create the proxy object for the instantiated object
    set objectBase = ##class(%Net.Remote.Object).%New(pyGate,"coin")
    write "Proxy object generated."

    // Access the properties
    set Date = objectBase.Date
    set Open = objectBase.Open
    set High = objectBase.High
    set Low = objectBase.Low
    set Close = objectBase.Close
    set Volume = objectBase.Volume

    // Write result
    w !,"Date: "_Date,! w "Open: "_Open,! w "High: "_High,! w "Low: "_Low,! w "Close: "_Close,! w "Volume: "_Volume,!
    
    // Persisting the data for later
    set coin = ##class(ObjectScript.Coin).%New()
    set coin.Date = Date
    set coin.Open = Open
    set coin.High = High
    set coin.Low = Low
    set coin.Close = Close
    set coin.Volume = Volume
    do coin.%Save()
    write !,"Values saved."

    return sc
}

}
