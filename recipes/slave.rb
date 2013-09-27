include_recipe 'hadoop::prepare'

node_name = node.name
cluster_id = node.name.split('-')[0]

master_node_array = search(:node, "name:#{cluster_id}-master")
count = 0

# At time search module doesn't return the correct result. This loop
# is to mitigate that failure.

while master_node_array.length < 1
	log "waiting for master discovery"
	sleep(1)
	count += 1
	master_node_array = search(:node, "name:#{cluster_id}-master")

	if count == node['hadoopstack']['discovery']['timeout']
		log "master discovery timeout!!"
		break
	end
end

log "master node array #{master_node_array} #{master_node_array.length}"

master_node_array.each do |master|
	node.set['hadoop']['namenode'] = master['ipaddress']
	node.set['hadoop']['jobtracker'] = master['ipaddress']
	log "Master has IP address #{node["ipaddress"]}"
	break
end

include_recipe 'hadoop::config'
include_recipe 'hadoop::datanode'
include_recipe 'hadoop::tasktracker'
