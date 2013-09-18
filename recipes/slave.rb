include_recipe 'hadoop::prepare'

node_name = node.name
cluster_id = node.name.split('-')[0]

master_node_array = search(:node, "name:#{cluster_id}-master-*")

master_node_array.each do |master|
	node.set['hadoop']['namenode'] = master['ipaddress']
	node.set['hadoop']['jobtracker'] = master['ipaddress']
	log "Master has IP address #{node["ipaddress"]}"
	break
end

include_recipe 'hadoop::config'
include_recipe 'hadoop::datanode'
include_recipe 'hadoop::tasktracker'
