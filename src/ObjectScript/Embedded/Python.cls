Class ObjectScript.Embedded.Examples Extends %SwizzleObject
{

ClassMethod HelloWorld(name As %String = "World") As %Boolean [ Language = python ]
{
    print("Hello " + name + "!")
    return True
}

Method compare(model, chain) As %Status [ Language = python ]
{
    # We use the Regular Expressions Operations module
    import re

    # Compare the chain to the model
    # Display results with f-strings
    print(f"\nResults({chain},{model})")
    match = re.match(model, chain)
    if match:
        print(match.groups())
    else:
        print(f"The chain [{chain}] doesn't match the model [{model}]")
}

Method compareObjectScript(model, chain) As %Status
{
    w !,"Results("_chain_","_model_")",!
    set matcher=##class(%Regex.Matcher).%New(model)
    set matcher.Text=chain
    if matcher.Locate() {
        write matcher.GroupGet(1)
    }
    else {
        w "The chain ["_chain_"] does not match the model ["_model_"]"
    }
}

Method DemoPythonToPython() As %Status [ Language = python ]
{
    # Regular Expressions in python
    # the pattern : a sequence of numbers surrounded by any characters
    # we want only to retrieve the sequence of digits
    model = r"^.*?(\d+).*?$"

    # we compare the string to the model
    self.compare(model, "xyz1234abcd")
    self.compare(model, "12 34")
    self.compare(model, "abcd")
}

Method DemoPythonToObjectScript() As %Status [ Language = python ]
{
    # Regular Expressions in Python
    # retrieve the different fields of a string
    # the pattern : a sequence of digits surrounded by any characters
    # we want only to retrieve the sequence of digits
    model = r"^.*?(\d+).*?$"

    # comparing the chain to the model:
    self.compareObjectScript(model, "xyz1234abcd")
    self.compareObjectScript(model, "12 34")
    self.compareObjectScript(model, "abcd")
}

Method DemoObjectScriptToPython() As %Status
{
    // the model : date format dd/mm/yy
    set model = "^\s*(\d\d)\/(\d\d)\/(\d\d)\s*$"
    do ..compare(model, "10/05/97")
    do ..compare(model, " 04/04/01 ")
    do ..compare(model, "5/1/01")
}

}
