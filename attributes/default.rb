# System configurations needed below
default['alfresco']['default_hostname'] = "localhost"
# # @TEST default['alfresco']['default_hostname'] = node['fqdn']

# Tomcat Installation Defaults
default['tomcat']['webapps'] = "/var/lib/tomcat7/webapps"
default['tomcat']['shared'] = "/usr/share/tomcat7/shared"
default['tomcat']['user'] = "tomcat7"
default['tomcat']['group'] = "tomcat7"

### Database Settings - used bt mysql_server, mysql_grant and repository recipes
default['alfresco']['db']['user']      = "alfresco"
default['alfresco']['db']['password']  = "alfresco"
default['alfresco']['db']['database']  = "alfresco"
default['alfresco']['db']['host']      = node['alfresco']['default_hostname']
default['alfresco']['db']['repo_hosts']      = [node['alfresco']['default_hostname']]
default['alfresco']['db']['port']           = 3306

default['mysql']['bind_address']            = "0.0.0.0"
default['mysql']['server_debian_password']  = "root"
default['mysql']['server_root_password']    = "root"
default['mysql']['server_repl_password']    = "root"

# default['alfresco']['mysql']['service_name']          = node['mysql']['service_name']
default['alfresco']['mysql']['service_name']          = "mysql"
default['alfresco']['mysql']['server_root_password']  = node['mysql']['server_root_password']
default['alfresco']['mysql']['bind_address']          = node['mysql']['bind_address']

default['alfresco']['index_subsystem'] = "solr"

default['alfresco']['default_port']     = "8080"
default['alfresco']['default_portssl']  = "8443"
default['alfresco']['default_protocol'] = "http"

# Used by repository, share and solr recipes
default['alfresco']['root_dir'] = "/var/lib/tomcat7/alf_data"
default['alfresco']['log_dir']  = node['tomcat']['log_dir']

# # Used by repository, share and solr recipes (see related .rb attributes files)
default['alfresco']['url']['repo']['context']    = "alfresco"
default['alfresco']['url']['repo']['host']       = node['alfresco']['default_hostname']
default['alfresco']['url']['repo']['port']       = node['alfresco']['default_port']
default['alfresco']['url']['repo']['protocol']   = node['alfresco']['default_protocol']

default['alfresco']['url']['solr']['context']    = "solr" #@TODO - not used right now
default['alfresco']['url']['solr']['host']       = node['alfresco']['default_hostname']
default['alfresco']['url']['solr']['port']       = node['alfresco']['default_port']
default['alfresco']['url']['solr']['protocol']   = node['alfresco']['default_protocol']

default['alfresco']['url']['share']['context']   = "share"
default['alfresco']['url']['share']['host']      = node['alfresco']['default_hostname']
default['alfresco']['url']['share']['port']      = node['alfresco']['default_port']
default['alfresco']['url']['share']['protocol']  = node['alfresco']['default_protocol']

default['alfresco']['url']['repo']['host']       = node['alfresco']['default_hostname']
default['alfresco']['url']['share']['host']      = node['alfresco']['default_hostname']
default['alfresco']['url']['solr']['host']       = node['alfresco']['default_hostname']

# Artifact Deployer attributes - Maven Repository defaults
alfresco_type = node['alfresco']['maven']['repo_type']
default['alfresco']['maven']['repo_type'] = "public"
default['alfresco']['maven']['username'] = "alfresco"
default['alfresco']['maven']['password'] = "password"
default['maven']['repos'][alfresco_type]['username'] = node['alfresco']['maven']['username']
default['maven']['repos'][alfresco_type]['password'] = node['alfresco']['maven']['password']
default['maven']['repos']["#{node['alfresco']['maven']['repo_type']}"]['url'] = "https://artifacts.alfresco.com/nexus/content/groups/#{node['alfresco']['maven']['repo_type']}"

# Artifact Deployer attributes - Artifact coordinates defaults
default['alfresco']['artifactId'] = "alfresco"
default['share']['artifactId'] = "share"
default['alfresco']['groupId'] = "org.alfresco"
default['alfresco']['version'] = "4.2.f"
