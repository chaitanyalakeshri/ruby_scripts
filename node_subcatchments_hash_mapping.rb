net=WSApplication.current_network

#Get all subcatchments
all_subs=net.row_objects('_subcatchments')

#Create a empty hash variable
node_sub_hash_map={}

#Get all nodes 
all_nodes=net.row_objects('_nodes')

#Assign node ID's as hash keys
all_nodes.each do |h|
    node_sub_hash_map[h.node_id]=[]
end

#Get all subcatchments
all_subs=net.row_objects('_subcatchments')

#Pair subcatchments to appropriate hash keys (i.e. node id's)
all_subs.each do |subb|
    node_sub_hash_map[subb.node_id]<<subb
end

#Now that a hash is ready with node id's as key and upstream subcatchments as paired values, keys can be used to get an array containing upstream subcathments
#In below code id of subcatchments upstream of node 'node_1' are printed. Below code can be re-used multiple times for different nodes within the script without being computationally expensive.
node_sub_hash_map['node_1'].each do |sub|
    puts sub.id
end
