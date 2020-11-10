#Below script selects all Header nodes in a ICM model network

net=WSApplication.current_network
net.clear_selection

#Creating an array to store node ID
nodes_arry= Array.new


#stores node id into array called 'nodes_arry' from nodes object collection
nodes_oc=net.row_objects('_nodes')
nodes_oc.each do |a|
	nodes_arry << a.node_id
	end

#Creating an array to store d/s node ID
ds_node_arry= Array.new

#stores u/s node id into array called 'ds_node_arry' from link object collection
links_oc=net.row_objects('_links')
links_oc.each do |a|
	ds_node_arry << a.ds_node_id
	end

nodes_arry.each do |b|
	if ds_node_arry.count(b)<1
		net.row_object('_nodes',b).selected=true
	end
end
