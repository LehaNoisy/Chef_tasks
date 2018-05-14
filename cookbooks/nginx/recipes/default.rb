#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end


web_server 'lb' do
  action [:attach]
end
