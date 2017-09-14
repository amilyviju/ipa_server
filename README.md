# ipa_server
#Preparing to run the scripts

You can change the hostname and installation options by editing the following commands in the default.rb recipe:

echo hostnamectl set-hostname <FQDN> --static >> /etc/profile.d/hostname.sh

ipa-server-install --setup-dns -U --realm=<realm> --domain=<domain-name> --hostname=<FQDN> --ds-password=<password> --admin-password=<password> --ip-address=<pvt-ip-addr> --forwarder=8.8.8.8
