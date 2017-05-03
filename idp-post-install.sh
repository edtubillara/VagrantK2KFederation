#!/bin/bash -ex

sudo apt-get install -y xmlsec1
export KEYSTONE_CONF=/etc/keystone/keystone.conf
crudini --set $KEYSTONE_CONF saml certfile '/etc/keystone/keystone-saml.crt'
crudini --set $KEYSTONE_CONF saml keyfile '/etc/keystone/keystone-saml.pem'
crudini --set $KEYSTONE_CONF saml idp_entity_id 'http://192.168.50.7/v3/OS_FEDERATION/saml2/idp'
crudini --set $KEYSTONE_CONF saml idp_sso_endpoint 'http://192.168.50.7:5000/v3/OS-FEDERATION/saml2/sso'
crudini --set $KEYSTONE_CONF saml idp_metadata_path '/etc/keystone/keystone_idp_metadata.xml'
crudini --set $KEYSTONE_CONF saml idp_contact_surname 'melvin'
crudini --set $KEYSTONE_CONF token provider 'fernet'


rm -rf /etc/keystone/keystone-saml.crt
cat <<EOF > /etc/keystone/keystone-saml.crt
-----BEGIN CERTIFICATE-----
MIIDyzCCArOgAwIBAgIJAIUbXznF9uNuMA0GCSqGSIb3DQEBCwUAMHQxCzAJBgNV
BAYTAlVTMQswCQYDVQQIDAJUWDEPMA0GA1UEBwwGQVVTVElOMQwwCgYDVQQKDANJ
Qk0xDzANBgNVBAsMBkNJUy1CQjEoMCYGA1UEAwwfazJrZi1pZHAub3Blbi10ZXN0
LmlibWNsb3VkLmNvbTAeFw0xNjA1MTEwNTExNThaFw0yNjA1MDkwNTExNThaMHQx
CzAJBgNVBAYTAlVTMQswCQYDVQQIDAJUWDEPMA0GA1UEBwwGQVVTVElOMQwwCgYD
VQQKDANJQk0xDzANBgNVBAsMBkNJUy1CQjEoMCYGA1UEAwwfazJrZi1pZHAub3Bl
bi10ZXN0LmlibWNsb3VkLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBALoWq6KAMGRon+UtcY2+klc/UgucjYM1u8RHmAoOWcTqwz4PH0VTTxyxQL+D
BHMuJoVfQkL/WT+sgFHIdggsWQqqITtScd96rsHlgs/xBGthJjJduIQC/yuwYBqz
roh2BQN0crJcVqm+4hu3DZcxZwXy7NIwLU781AjkmNXubTQixlWLNhDorgUNXhnf
p8dc1U3aHlsrO4QHOS8hPH2UY+e1tTfx4EH0AP9VmQQyOI07HQ3qCpzkUeQbWPEG
YywtFDZWGTWGAHuT7fBXX6xoW0g6sE38mUwwF1fWfHi1kHEsmM+EclyKW3QkUx+D
VPnzPHYhLEB7kzbaVcmTvk+zclMCAwEAAaNgMF4wXAYDVR0RBFUwU4IYKi5vcGVu
LXRlc3QuaWJtY2xvdWQuY29tgh9rMmtmLWlkcC5vcGVuLXRlc3QuaWJtY2xvdWQu
Y29tghZvcGVuLXRlc3QuaWJtY2xvdWQuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQBd
Us2p8FSTX4EbMjLFKMVvU1iU90E5GeWUw2zDnbsJHeAorecg09VCZLWMubQOP9TY
3mg1GUE+gyDP0huPPza2cUd9V2Crcn+VJJX6s79/xem73ZqDdm2YwsAZ9a8trYAR
7rZrYuI3flRx3ncywNABFNavexMpge2Ej81NDmxj4wDkYPRfaXYTxqn0NF7yDjly
oe37003v48Xc7r0yMJnCGr+aEayyF1ykRLJrZx+e50n8ZUwPYX2Hc7bIw2BSAv3Z
AO1Qv/0Cjorbw92Tjx9ASSC+OH6ar6T6N0YV7o2rwf7IpJhmDuHeh+3O3g5bsuhP
bKj1MaFyMC0cyxo36o6z
-----END CERTIFICATE-----
EOF

rm -rf /etc/keystone/keystone-saml.pem
cat <<EOF > /etc/keystone/keystone-saml.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAuharooAwZGif5S1xjb6SVz9SC5yNgzW7xEeYCg5ZxOrDPg8f
RVNPHLFAv4MEcy4mhV9CQv9ZP6yAUch2CCxZCqohO1Jx33quweWCz/EEa2EmMl24
hAL/K7BgGrOuiHYFA3RyslxWqb7iG7cNlzFnBfLs0jAtTvzUCOSY1e5tNCLGVYs2
EOiuBQ1eGd+nx1zVTdoeWys7hAc5LyE8fZRj57W1N/HgQfQA/1WZBDI4jTsdDeoK
nORR5BtY8QZjLC0UNlYZNYYAe5Pt8FdfrGhbSDqwTfyZTDAXV9Z8eLWQcSyYz4Ry
XIpbdCRTH4NU+fM8diEsQHuTNtpVyZO+T7NyUwIDAQABAoIBAHHpqstg2T695RNv
jBGO1RpfgqPlA6OMYxK2GNYfDsjCRR5aN3RCmS0hPFd/pluzppUCSRemJEYcHLjz
k31RWHh0yL79qwN4oD3Fdxw/l8r7v1wZjvgQtY9S+qGd2Htkc5E32XZhnBNw7Ay3
M7SX40769Al+wF2X21xOQ1jCCUtd6uhQ+kfgvMdZHVSXmWMplaYrqqcPK+3I03c3
agNS13LkXOCJN+PuZB2CXwB1YU3Q+jEZNOZxGa/OadOe2ktDcPhWAGxj59jVGv0u
8DwDczrkXgNE66CYX8nC5zIbBepvKCNlaJqSTi45r/gYWwfqCUAkLwHVkO65CIsF
ljS5z/ECgYEA3/BksU1ooEJA9K/2pTimLQU3/a/Vu6GT40fDs742g33xHFGrLznm
IoXcfMkuPY2WALP+cynwj2lcwfi8/Sz/MFSgitWurCRkKYyI3N1DBgI1dqTRYOjs
wIv2vaVKCHJPTDTgKNV+5TkJOLYQo+i29DtX0G+lrsaqwaVhL0ocNV8CgYEA1LsE
K9sNkj8Q8PbqXOj5tKBg+7r7U8WTyEEQ+k1eMNSXDMajPcr4xcete9P4SqqVBHJm
/aOxDNB7ODjSU4QjnW9W7mVTq+k+4QBP1elZVO0/gU+cBV3w7hsfsQK0AixKpLY5
XT7XpFM6QTyCe/lmv3EOQVi2baG0OPQ8WjJME40CgYEAkBuk0KxdzfOU1WF/OWex
GHupQmmrAynBf5spBzw63Hdpd63emW+K92BpOSxFw3qfsyghcH7mvYMyG+kzxUD1
n2Z2QaGs3D427r3vPSJuBSnaudTqoJCD+oyXZgc+Ex1shj/omJ57IIuJsaMIJlKV
mamuowWV+1kBfcgtOD9a08UCgYEAhjXzHMQX3NOjGZN+Kt3lZHrmlQrTs3dslCPQ
1UnoigAlyC6uILckmosuvXfvJxRV7bdLmOwkMIR7qO3YbE5qtdHf04nj7wq52/R5
aejNrlH8BdY3Bf/NmDtOlDuzW8eb1C0PJfAW1pqXnz7Qx+yCUXe/WaThe2tQq7oT
NYiUDKUCgYBFBc0tZrMeUtvw4KkoI9EcXcyHCE0kmXD0lYASHXGPKF/zmBlDd+ZF
wXgFBDZl6UbTu6xB45hT5RwVREkii/5zkWEwqH3QvVdscIS8A64slZDkGJNeSBRn
N9jHzwuaKLynDRtbxiNrKp2yNqBsuBs40rkZyGpY7wWd5pSYt8m8dg==
-----END RSA PRIVATE KEY-----
EOF

keystone-manage saml_idp_metadata > /etc/keystone/keystone_idp_metadata.xml

mkdir -p /etc/keystone/fernet-keys/
keystone-manage fernet_setup

export LOCAL_SETTINGS="/opt/stack/horizon/openstack_dashboard/local/local_settings.py"
export ALLOWED_HOSTS_HACK="ALLOWED_HOSTS = ['192.168.50.7', ]"
grep -q "$ALLOWED_HOSTS_HACK" "$LOCAL_SETTINGS" || echo "$ALLOWED_HOSTS_HACK" >> "$LOCAL_SETTINGS"
sudo service apache2 restart
#export K2K_SELECTION_AT_LOGIN_ENABLED='K2K_SELECTION_AT_LOGIN_ENABLED = True'
#export K2K_INITIAL_CHOICE='K2K_INITIAL_CHOICE = "local"'
#export K2K_CHOICES='K2K_CHOICES = (("local", _("Keystone Authentication")), ("lsp", _("Service_Provider lsp")))'
#grep -q "$K2K_SELECTION_AT_LOGIN_ENABLED" "$LOCAL_SETTINGS" || echo "$K2K_SELECTION_AT_LOGIN_ENABLED" >> "$LOCAL_SETTINGS"
#grep -q "$K2K_INITIAL_CHOICE" "$LOCAL_SETTINGS" || echo "$K2K_INITIAL_CHOICE" >> "$LOCAL_SETTINGS"
#grep -q "$K2K_CHOICES" "$LOCAL_SETTINGS" || echo "$K2K_CHOICES" >> "$LOCAL_SETTINGS"

export IDENTITY_API_VERSION=3
. /opt/stack/devstack/openrc admin admin

set +e
openstack service provider delete VagrantServiceProvider
openstack service provider create  --auth-url http://192.168.50.8:5000/v3/OS-FEDERATION/identity_providers/VagrantIdentityProvider/protocols/mapped/auth --service-provider-url  http://192.168.50.8/Shibboleth.sso/SAML2/ECP VagrantServiceProvider
openstack user create another_demo_user --project demo --password secretadmin --or-show
openstack role add --project demo --user another_demo_user Member
