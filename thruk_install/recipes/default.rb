


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

