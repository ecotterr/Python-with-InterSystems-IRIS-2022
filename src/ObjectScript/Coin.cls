Class ObjectScript.Coin Extends (%Library.Persistent, %JSON.Adaptor)
{

Property CoinDate As %String [ SqlColumnNumber = 2 ];

Property PriceOpen As %Numeric [ SqlColumnNumber = 3 ];

Property PriceHigh As %Numeric [ SqlColumnNumber = 4 ];

Property PriceLow As %Numeric [ SqlColumnNumber = 5 ];

Property PriceClose As %Numeric [ SqlColumnNumber = 6 ];

Property TradeVolume As %Numeric [ SqlColumnNumber = 7 ];

Storage Default
{
<Data name="CoinDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Date</Value>
</Value>
<Value name="3">
<Value>Open</Value>
</Value>
<Value name="4">
<Value>High</Value>
</Value>
<Value name="5">
<Value>Low</Value>
</Value>
<Value name="6">
<Value>Close</Value>
</Value>
<Value name="7">
<Value>Volume</Value>
</Value>
<Value name="8">
<Value>CoinDate</Value>
</Value>
<Value name="9">
<Value>PriceOpen</Value>
</Value>
<Value name="10">
<Value>PriceHigh</Value>
</Value>
<Value name="11">
<Value>PriceLow</Value>
</Value>
<Value name="12">
<Value>PriceClose</Value>
</Value>
<Value name="13">
<Value>PriceVolume</Value>
</Value>
<Value name="14">
<Value>TradeVolume</Value>
</Value>
</Data>
<DataLocation>^ObjectScript.CoinD</DataLocation>
<DefaultData>CoinDefaultData</DefaultData>
<IdLocation>^ObjectScript.CoinD</IdLocation>
<IndexLocation>^ObjectScript.CoinI</IndexLocation>
<StreamLocation>^ObjectScript.CoinS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
