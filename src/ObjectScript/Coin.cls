Class ObjectScript.Coin Extends %Persistent
{

Property Date As %String;

Property Open As %Numeric;

Property High As %Numeric;

Property Low As %Numeric;

Property Close As %Numeric;

Property Volume As %Numeric;

Property MarketCap As %Numeric;

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
<Value>MarketCap</Value>
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
