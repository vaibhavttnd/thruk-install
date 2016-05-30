
include_recipe 'ark::default'

ark 'grails' do
  url node['grails']['url']
#  checksum node['grails']['checksum']
  home_dir node['grails']['home']
  version node['grails']['version']
end
