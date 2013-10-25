include_recipe 'hadoop::prepare'

node.set['hadoop']['namenode']['address'] = node['ipaddress']
node.set['hadoop']['jobtracker']['address'] = node['ipaddress']

include_recipe 'hadoop::config'
include_recipe 'hadoop::namenode'
include_recipe 'hadoop::jobtracker'
