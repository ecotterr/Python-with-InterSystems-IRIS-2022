Class ObjectScript.Coin Extends (%Library.Persistent, %JSON.Adaptor)
{

Property Date As %String [ SqlColumnNumber = 2 ];

Property Open As %Numeric [ SqlColumnNumber = 3 ];

Property High As %Numeric [ SqlColumnNumber = 4 ];

Property Low As %Numeric [ SqlColumnNumber = 5 ];

Property Close As %Numeric [ SqlColumnNumber = 6 ];

Property Volume As %Numeric [ SqlColumnNumber = 7 ];

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
</Data>
<DataLocation>^ObjectScript.CoinD</DataLocation>
<DefaultData>CoinDefaultData</DefaultData>
<IdLocation>^ObjectScript.CoinD</IdLocation>
<IndexLocation>^ObjectScript.CoinI</IndexLocation>
<StreamLocation>^ObjectScript.CoinS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
