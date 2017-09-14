# ipa_server
Preparing to run the scripts
You can change the hostname and installation options by editing the following commands in the default.rb recipe:

echo hostnamectl set-hostname awsfreipa.rean.internal --static >> /etc/profile.d/hostname.sh

ipa-server-install --setup-dns -U --realm=REAN.INTERNAL --domain=rean.internal --hostname=awsfreipa.rean.internal --ds-password=password@123 --admin-password=password@123 --ip-address=10.0.1.84 --forwarder=8.8.8.8
