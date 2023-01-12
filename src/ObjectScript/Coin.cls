Class ObjectScript.Coin Extends (%Library.Persistent, %JSON.Adaptor)
{

Property CoinDate As %String [ SqlColumnNumber = 2 ];

Property PriceOpen As %Double [ SqlColumnNumber = 3 ];

Property PriceHigh As %Double [ SqlColumnNumber = 4 ];

Property PriceLow As %Double [ SqlColumnNumber = 5 ];

Property PriceClose As %Double [ SqlColumnNumber = 6 ];

Property TradeVolume As %Double [ SqlColumnNumber = 7 ];

}
