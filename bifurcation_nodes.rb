#Below script selects all bifurcation nodes in a ICM model network

net=WSApplication.current_network
net.clear_selection

#Creating an array to store u/s node ID
us_node_arry= Array.new

#stores u/s node id into array called 'us_node_arry' from link object collection
links_oc=net.row_objects('_links')
links_oc.each do |a|
	us_node_arry << a.us_node_id
	end


#If a node is counted two or more number of times its identified as bifurcation node and its added to current selection
us_node_arry.each do |b|
	if us_node_arry.count(b)>1
		net.row_object('_nodes',b).selected=true
	end
end
