Class ObjectScript.Embedded.Numpy Extends %Persistent
{

ClassMethod RandomStorage(num As %Integer) As %Status [language = python]
{
    import numpy as np
    import iris

    rng = np.random.default_rng()

    # normally distributed random numbers
    samples = rng.normal(size=num)

    i = 0
    randGlobal = iris.gref("^randGlobal")
    for key in samples:
        i += 1
        randGlobal.set([i], key)
    return True
}

ClassMethod RandomStorageRetrieve(id As %Integer) As %Status [language = python]
{
    import iris

    randGlobal = iris.gref("^randGlobal")
    result = randGlobal.get([id])
    
    if id == 1:
        suffix = "st"
    elif id == 2:
        suffix = "nd"
    else:
        suffix = "th"

    print(f"The {id}'{suffix} generated number is {result}.")
}

}