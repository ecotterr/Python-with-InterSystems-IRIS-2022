Class ObjectScript.Embedded.Networks Extends %Persistent
{
// Thanks to Yuhang Xia for the code to generate these graphs.

ClassMethod CreateNetwork(nodes As %Integer) As %Status [language = python]
{
    # import numpy as np
    import networkx as nx
    import random
    import iris
    import matplotlib

    network = nx.barabasi_albert_graph(nodes, 3)
    nx.draw(network, with_labels = True)

    # For each node, we create a list of neighbours
    neighbour_list_all = []
    for node in network.nodes():
        neighbour_list = list(network.neighbors(node))
        neighbour_list_all.append(neighbour_list)
    
    # Storing each node, with their neighbours in IRIS:
    i = 0
    nodeGlobal = iris.gref("^nodeGlobal")
    for node in network.nodes():
        neighbours = neighbour_list_all[i]
        nodeGlobal.set([i],neighbours)
        i += 1
    return True
}

}