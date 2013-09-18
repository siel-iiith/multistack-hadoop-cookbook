include_recipe 'hadoop::prepare'

node.set['hadoop']['namenode'] = node['ipaddress']
node.set['hadoop']['jobtracker'] = node['ipaddress']

include_recipe 'hadoop::config'
include_recipe 'hadoop::namenode'
include_recipe 'hadoop::jobtracker'
