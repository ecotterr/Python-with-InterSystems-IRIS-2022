Class ObjectScript.Embedded.Networks
{

// Thanks to Yuhang Xia for the code to generate these networks.

ClassMethod CreateNetwork(nodes As %Integer = 10) As %Status [ Language = python ]
{
    # import numpy as np
    import networkx as nx
    import random
    import json
    import matplotlib

    import iris

    # Creating our network:
    network = nx.barabasi_albert_graph(nodes, 3)
    nx.draw(network, with_labels = True)

    # For each node, we create a list of neighbours
    neighbour_list_all = []
    for node in network.nodes():
        neighbour_list = list(network.neighbors(node))
        neighbour_list_all.append(neighbour_list)
    
    # Storing each node, with their neighbours as JSON in IRIS:
    i = 0
    nodeGlobal = iris.gref("^nodeGlobal")
    for node in network.nodes():
        neighbours = neighbour_list_all[i]
        jsonConvert = json.dumps(neighbours)
        nodeGlobal.set([i],jsonConvert)
        i += 1
    return True
}

ClassMethod ShowNetwork() As %Status [ Language = python ]
{
    import iris

    nodeGlobal = iris.gref("^nodeGlobal")
    i = 0
    key = ""
    while True:
        key = nodeGlobal.order([key])
        if key == None:
            break
        print("Node " + str(i) + " has neighbours: " + str(nodeGlobal.get([key])))
        i += 1
}

ClassMethod KillNetwork() As %Status [ Language = python ]
{
    import iris

    nodeGlobal = iris.gref("^nodeGlobal")
    nodeGlobal.kill([])
    print("Network global has been killed.")
}

}
