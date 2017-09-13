#
# Cookbook:: freeipa_server
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'install' do
  command 'yum -y install ipa-server ipa-server-dns bind bind-dyndb-ldap'
end
execute 'set-hostname' do
  command 'echo hostnamectl set-hostname awsfreipa.rean.internal --static >> /etc/profile.d/hostname.sh'
end
execute 'set-hostname' do
  command 'chmod 777 /etc/profile.d/hostname.sh'
end
execute 'ipa-install' do
  command 'ipa-server-install --setup-dns -U --realm=REAN.INTERNAL --domain=rean.internal --hostname=awsfreipa.rean.internal --ds-password=password@123 --admin-password=password@123 --ip-address=10.0.1.23 --forwarder=8.8.8.8'
end
execute 'install' do
  command 'yum -y install firewalld'
end
execute 'start' do
  command 'systemctl start firewalld'
end
execute 'enable' do
  command 'systemctl enable firewalld'
end
execute 'add-service' do
  command 'firewall-cmd --add-service={ssh,dns,freeipa-ldap,freeipa-ldaps} --permanent'
end
execute 'reload' do
  command 'firewall-cmd --reload'
end
