# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :web_server
property :role, String, default: 'app_server'
property :dettach, String, default: '10.0.0.10'

def private_adress(node)
  node[:network][:interfaces][:enp0s8][:addresses].detect{|k,v| v[:family] == 'inet' }.first
end

action :attach do
  result = ''
  search(:node, "role:#{role}").each do |conf|
    result += "server #{private_adress(conf)}:8090;\n"
  end

  ip = private_adress(node)

  template '/etc/nginx/nginx.conf' do
    source "nginx.conf.erb"
    variables( servers: result,
               nginx_server: private_adress(node))
  end

  service 'nginx' do
    action [:restart]
  end
end

action :detach do
  bash 'del' do
    code <<-EOH
      sed -i '/#{dettach}/d' /etc/nginx/nginx.conf
      EOH
  end
  service 'nginx' do
    action [:restart]
  end
end

