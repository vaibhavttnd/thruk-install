#
#include_recipe 'ark::default'
#
#ark 'grails' do
#  url node['grails']['url']
##  checksum node['grails']['checksum']
#  home_dir node['grails']['home']
#  version node['grails']['version']
#end
#




dpkg_package "libthruk" do
  ignore_failure true
  case node[:platform]
  when "debian","ubuntu"
    package_name "libthruk"
    source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/libthruk_2.08-1_ubuntu14.04_amd64.deb"
  end
  action :install
  notifies :run, "execute[install-libthruk-deps]", :immediately
end

execute "install-libthruk-deps" do
  command "apt-get -yf install"
  action :nothing
end





include_recipe 'gdebi::default'


remote_file "/opt/thruk" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/libthruk_2.08-1_ubuntu14.04_amd64.deb"
  mode 0644
#  checksum "" # PUT THE SHA256 CHECKSUM HERE
end


gdebi_package '/opt/thruk/libthruk_2.08-1_ubuntu14.04_amd64.deb' do
  action :install
end

#dpkg_package "lib-thruk" do
#  source "/opt/thruk/libthruk_2.08-1_ubuntu14.04_amd64.deb"
#  action :install
#end


remote_file "/opt/thruk" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk-base_2.08_ubuntu14.04_amd64.deb"
  mode 0644
#  checksum "" # PUT THE SHA256 CHECKSUM HERE
end

gdebi_package '/opt/thruk/thruk-base_2.08_ubuntu14.04_amd64.deb' do
  action :install
end

#dpkg_package "thruk-base" do
#  source "/opt/thruk/thruk-base_2.08_ubuntu14.04_amd64.deb"
#  action :install
#end

remote_file "/opt/thruk" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb"
  mode 0644
#  checksum "" # PUT THE SHA256 CHECKSUM HERE
end


gdebi_package '/opt/thruk/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb' do
  action :install
end


#dpkg_package "thruk-plugin" do
#  source "/opt/thruk/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb"
#  action :install
#end


remote_file "/opt/thruk" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk_2.08_ubuntu14.04_amd64.deb"
  mode 0644
#  checksum "" # PUT THE SHA256 CHECKSUM HERE
end

gdebi_package '/opt/thruk/thruk_2.08_ubuntu14.04_amd64.deb' do
  action :install
end


#
#dpkg_package "thruk" do
#  source "/opt/thruk/thruk_2.08_ubuntu14.04_amd64.deb"
#  action :install
#end


