Class ObjectScript.Gateway.Crypto
{

ClassMethod GetCoinValues()
{
    set sc = $$$OK

    // Creating default Python gateway connection
    set pyGate = $system.external.getPythonGateway()

    // Add Address.py path to the gateway
    do pyGate.addToPath("/irisdev/app/src/Python/gateway/Crypto.py")

    // Create the proxy object for the instantiated object
    set objectBase = ##class(%Net.Remote.Object).%New(pyGate,"coin")

    // Access the properties
    set Date = objectBase.Date
    set Open = objectBase.Open
    set High = objectBase.High
    set Low = objectBase.Low
    set Close = objectBase.Close
    set Volume = objectBase.Volume
    set MarketCap = objectBase.MarketCap
    
    // Write result
    zw Date zw Open zw High zw Low zw Close zw Volume zw MarketCap
    
    // Persisting the data for later
    set coin = ##class(ObjectScript.Coin).%New()
    set coin.Date = Date
    set coin.Open = Open
    set coin.High = High
    set coin.Low = Low
    set coin.Close = Close
    set coin.Volume = Volume
    set coin.MarketCap = MarketCap
    do coin.%Save()
    w "Coin saved with id value: "_coin.Id

    return sc
}

}
