directory '/opt/thruk' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

package 'gdebi'

#1
remote_file "/opt/thruk/libthruk_2.08-1_ubuntu14.04_amd64.deb" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/libthruk_2.08-1_ubuntu14.04_amd64.deb"
  mode 0644
  notifies :run, "execute[libthruk]", :immediately
end


execute "libthruk" do
  command "sudo gdebi  --option=APT::Get::force-yes='true' --option=APT::Get::Assume-Yes='true' -n /opt/thruk/libthruk_2.08-1_ubuntu14.04_amd64.deb"
  action :nothing
end

#dpkg_package "/opt/thruk/libthruk_2.08-1_ubuntu14.04_amd64.deb" do
#  ignore_failure true
#  action :install
#  notifies :run, "execute[install-libthruk-deps]", :immediately
#end
#
#execute "install-libthruk-deps" do
#  command "apt-get -yf install"
#  action :nothing
#end
#

#2
remote_file "/opt/thruk/thruk-base_2.08_ubuntu14.04_amd64.deb" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk-base_2.08_ubuntu14.04_amd64.deb"
  mode 0644
  notifies :run, "execute[thruk-base]", :immediately
end

execute "thruk-base" do
  command "sudo gdebi  --option=APT::Get::force-yes='true' --option=APT::Get::Assume-Yes='true' -n /opt/thruk/thruk-base_2.08_ubuntu14.04_amd64.deb"
  action :nothing
end

#
#dpkg_package "/opt/thruk/thruk-base_2.08_ubuntu14.04_amd64.deb" do
#  ignore_failure true
#  action :install
#  notifies :run, "execute[install-thrukbase-deps]", :immediately
#end
#
#execute "install-thrukbase-deps" do
#  command "apt-get -yf install"
#  action :nothing
#end
#



#3
remote_file "/opt/thruk/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb"
  mode 0644
  notifies :run, "execute[thruk-plugin]", :immediately
end


execute "thruk-plugin" do
  command "sudo gdebi  --option=APT::Get::force-yes='true' --option=APT::Get::Assume-Yes='true' -n /opt/thruk/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb"
  action :nothing
end

#dpkg_package "/opt/thruk/thruk-plugin-reporting_2.08_ubuntu14.04_amd64.deb" do
#  ignore_failure true
#  action :install
#  notifies :run, "execute[install-plugin-deps]", :immediately
#end
#
#execute "install-plugin-deps" do
#  command "apt-get -yf install"
#  action :nothing
#end
#

#4
remote_file "/opt/thruk/thruk_2.08_ubuntu14.04_amd64.deb" do
  source "http://download.thruk.org/pkg/v2.08/ubuntu14.04/amd64/thruk_2.08_ubuntu14.04_amd64.deb"
  mode 0644
  notifies :run, "execute[thruk]", :immediately
end


execute "thruk" do
  command "sudo gdebi  --option=APT::Get::force-yes='true' --option=APT::Get::Assume-Yes='true' -n /opt/thruk/thruk_2.08_ubuntu14.04_amd64.deb"
  action :nothing
end

#
#dpkg_package "/opt/thruk/thruk_2.08_ubuntu14.04_amd64.deb" do
#  ignore_failure true
#  action :install
#  notifies :run, "execute[install-thruk-deps]", :immediately
#end
#
#execute "install-thruk-deps" do
#  command "apt-get -yf install"
#  action :nothing
#end
#
