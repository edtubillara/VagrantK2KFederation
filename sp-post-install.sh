#!/bin/bash -ex

export KEYSTONE_CONF=/etc/keystone/keystone.conf
crudini --set $KEYSTONE_CONF auth methods 'external,password,token,mapped'
crudini --set $KEYSTONE_CONF saml remote_id_attribute 'Shib-Identity-Provider'
crudini --set $KEYSTONE_CONF token provider 'fernet'

sudo apt-get install -y libapache2-mod-shib2
sudo rm -rf /etc/shibboleth/sp-cert.pem
cat << EOF | sudo tee -a  /etc/shibboleth/sp-cert.pem
-----BEGIN CERTIFICATE-----
MIIDyDCCArCgAwIBAgIJAM1zVCuxLQKTMA0GCSqGSIb3DQEBCwUAMHMxCzAJBgNV
BAYTAlVTMQswCQYDVQQIDAJUWDEPMA0GA1UEBwwGQVVTVElOMQwwCgYDVQQKDANJ
Qk0xDzANBgNVBAsMBkNJUy1CQjEnMCUGA1UEAwweazJrZi1zcC5vcGVuLXRlc3Qu
aWJtY2xvdWQuY29tMB4XDTE2MDUxMTA1MTMxM1oXDTI2MDUwOTA1MTMxM1owczEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgMAlRYMQ8wDQYDVQQHDAZBVVNUSU4xDDAKBgNV
BAoMA0lCTTEPMA0GA1UECwwGQ0lTLUJCMScwJQYDVQQDDB5rMmtmLXNwLm9wZW4t
dGVzdC5pYm1jbG91ZC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQDD9QY7CnlC0rzIO3j2PcRuR2z+2iCTv3d5rUE3hevBDJnPi0t5cj93+gsmHNvg
FtBdyMeLXY1gODrjzDvPq68lQafKqjKLcCSjlydCEuCFEJdXthvUEtRBj1tzL5sV
umJ/e1ARsd+UiUXL6+cSzjtB57UTDGa9iVFP5lUXfsTEcICqPln6fbaoT6vPo3Sd
2nTeaiFWfT2T+9RYmc/IqpinQ6tNjaFKusI/du+PXfx0Ey3xLtRdJr2oYhrCHmxD
HhMwX6pYBMMJzdE+AbDdZv+51lVNx64xVOloSuPah6/PYK+xQ/yEFvJsrBj3+7MA
hsyr+Fc+fg6Iu7Mp6tVwB8QLAgMBAAGjXzBdMFsGA1UdEQRUMFKCGCoub3Blbi10
ZXN0LmlibWNsb3VkLmNvbYIeazJrZi1zcC5vcGVuLXRlc3QuaWJtY2xvdWQuY29t
ghZvcGVuLXRlc3QuaWJtY2xvdWQuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQAu0gVs
YcGLxL33v7lsi6Q7mhVIYWSk+r9VGV6GAouc5QR3JGGes3j/81qS/ii1pEd9U/B4
NqNm6Arh0FbRcVA385BfZsjnWFnZ34N4YIgJW6XqJSSkWt/mCAPoQPV9LFrCvVHE
3po05+ujN1dZfj/oLWCEBVQENtUiYXmT812AfDcEI7PkoGiMMWFd2fb5jrnCyk3z
jUUELB1osd/J1GaYOgbbmwjld1YIAIR1yiFUqA2Rh1YftBzsiNAGoibm+aKq7Fx7
nDwp7DA5cJzvwe6PnmDtX7anJyAHWDuYO8Tp1VorOdGdmYNwgxYRbzXpvCvtJ3mL
pLxo8nLqhzeK3OGp
-----END CERTIFICATE-----
EOF
sudo rm -rf /etc/shibboleth/sp-key.pem
cat << EOF | sudo tee -a /etc/shibboleth/sp-key.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAw/UGOwp5QtK8yDt49j3Ebkds/togk793ea1BN4XrwQyZz4tL
eXI/d/oLJhzb4BbQXcjHi12NYDg648w7z6uvJUGnyqoyi3Ako5cnQhLghRCXV7Yb
1BLUQY9bcy+bFbpif3tQEbHflIlFy+vnEs47Qee1EwxmvYlRT+ZVF37ExHCAqj5Z
+n22qE+rz6N0ndp03mohVn09k/vUWJnPyKqYp0OrTY2hSrrCP3bvj138dBMt8S7U
XSa9qGIawh5sQx4TMF+qWATDCc3RPgGw3Wb/udZVTceuMVTpaErj2oevz2CvsUP8
hBbybKwY9/uzAIbMq/hXPn4OiLuzKerVcAfECwIDAQABAoIBADVrdJlfz5Lh9Ej5
vY4TZJtTqWkIed0NUzq+eoryXUSxdLTZmmevN5IzfhqTv3UlgwQuGgfqJwJWEefL
43pHqWWUsnNTVpggqDxYloEyuDZOQZPNt2RnBaohtKKAFd0khHmQWlGYlgTeL0La
OpIr2oeq7PgWZ2PALYSEnCndizKppnwzKtV/zqi+kmJSKBrJcbsarPa2I9ffb5PL
kPIi6aXpov10Z0pxbrZGvUAdJ2pUqWm13iixrJ+pztuVBdbC+9tw1nWoy43uOaeZ
+bWE0axey5qNBsSlrSVvmjjBFKLzdKUf3GnkoCIE9hW1qaVzepGm+KMyaJAByj5e
o2Y8gEECgYEA7KogakkXn3nLD2tRNL78haPIKzIjmUToASemSfB7vdyLFRhopTrs
Ux/rwsCJWPp/MGJyKTme9Xiw20KoLTDQyvLsf2Lc1tUcEoWR1cILjdgjCCoVWkG2
7hPnGOdFlhobMUGOXMDRgmdhaTJHDcDt8TIOyc+4apyH9Ug6Sb09LBECgYEA0/d+
9O2Dfb1yBkUE7LiHfsSdNA01H7WKEyqZ/DvqBZDttJG3wlU0hnRvlZjkEC5oWSvS
E+dSoa4CfELaNojY7Da75xbA6MGqRXF094OT+DZZSZ+37QfTmnqjIaKKCkotDfmT
J8ax/i7FxTLd5K5JN5DuXOJOJAuxJQTIZGy5elsCgYEA1sUlGY8vQugyINIRJb7U
Ryr0sk6UA7mGmdWzkJIOmaQVC5XVEW1BncXwHBLCEd9xoSUV2NeTq8xVIwWAvVH5
iNOfT5MWOle3XA+e4s9v0M9+KyCVtAzCx5eENxNaEPesCa0mVoIdHyxWODMKTC7z
P9lflkFNaGKY9z0OuHBlnSECgYEAjEWbBKcxf0KhdLi0G5u6PxAKIGolH8jZiPmG
Ub+sjOZuCDLucnJEgj4Hoe497t9nOqufKIDK1Cf9iRIMqk5Bj4BhNPp/ywhuj+oX
R70RbQ86Y1iJNRka1X4W+qk/xLN1wWvKEGaTX+zAAFI7OZyE43rL4zf4Ei6Smjbi
DmNNE0UCgYEA6oOtxnqt0LFAQGAjHQV2Uds/LaH/so/0yzQy5Cd1zn9pB4EbRgpc
cr+IjKVvgX+nzT65IGol600yw3UrOq5kRQPvJKHfqnZw/T9QzBYGj49X8mM2buwT
vQsT6BDcJHmfRN40LBGCElB5pWz2sMwyBZZ7CPU2DL7hZM2ptN7GfMw=
-----END RSA PRIVATE KEY-----
EOF
sudo rm -rf /etc/shibboleth/attribute-map.xml
cat << EOF | sudo tee -a /etc/shibboleth/attribute-map.xml
<Attributes xmlns="urn:mace:shibboleth:2.0:attribute-map" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <Attribute name="openstack_user" id="openstack_user"/>
    <Attribute name="openstack_roles" id="openstack_roles"/>
    <Attribute name="openstack_project" id="openstack_project"/>
    <Attribute name="openstack_user_domain" id="openstack_user_domain"/>
    <Attribute name="openstack_project_domain" id="openstack_project_domain"/>
</Attributes>
EOF
sudo rm -rf /etc/shibboleth/shibboleth2.xml
cat << EOF | sudo tee -a /etc/shibboleth/shibboleth2.xml
<SPConfig xmlns="urn:mace:shibboleth:2.0:native:sp:config"
    xmlns:conf="urn:mace:shibboleth:2.0:native:sp:config"
    xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
    xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"
    xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
    clockSkew="180">

    <ApplicationDefaults entityID="VagrantServiceProvider">
        <Sessions lifetime="28800" timeout="3600" relayState="ss:mem"
                  checkAddress="false" handlerSSL="false" cookieProps="http">
            <SSO entityID="http://192.168.50.7/v3/OS_FEDERATION/saml2/idp" ECP="true">
              SAML2 SAML1
            </SSO>

            <Logout>SAML2 Local</Logout>

            <Handler type="MetadataGenerator" Location="/Metadata" signing="false"/>
            <Handler type="Status" Location="/Status" acl="127.0.0.1 ::1"/>
            <Handler type="Session" Location="/Session" showAttributeValues="true"/>
            <Handler type="DiscoveryFeed" Location="/DiscoFeed"/>
        </Sessions>

        <Errors supportContact="fakeemail@opennstack.stackopenstack.com"
            helpLocation="/about.html"
            styleSheet="/shibboleth-sp/main.css"/>

        <MetadataProvider type="XML" uri="http://192.168.50.7:5000/v3/OS-FEDERATION/saml2/metadata" backingFilePath="idp-metadata-provider-backup.xml"/>
        <AttributeExtractor type="XML" validate="true" reloadChanges="false" path="attribute-map.xml"/>
        <AttributeResolver type="Query" subjectMatch="true"/>
        <AttributeFilter type="XML" validate="true" path="attribute-policy.xml"/>
        <CredentialResolver type="File" key="sp-key.pem" certificate="sp-cert.pem"/>
    </ApplicationDefaults>
    <SecurityPolicyProvider type="XML" validate="true" path="security-policy.xml"/>
    <ProtocolProvider type="XML" validate="true" reloadChanges="false" path="protocols.xml"/>
</SPConfig>
EOF

sudo rm -rf /etc/apache2/sites-available/keystone.conf
cat << EOF | sudo tee -a /etc/apache2/sites-available/keystone.conf
Listen 5000
Listen 35357
LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\" %D(us)" keystone_combined

<Directory /usr/local/bin>
    Require all granted
</Directory>

<VirtualHost *:5000>
    WSGIDaemonProcess keystone-public processes=5 threads=1 user=vagrant display-name=%{GROUP}
    WSGIProcessGroup keystone-public
    WSGIScriptAlias / /usr/local/bin/keystone-wsgi-public
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
    ErrorLogFormat "%M"
    ErrorLog /var/log/apache2/keystone.log
    CustomLog /var/log/apache2/keystone_access.log keystone_combined

    <LocationMatch /v3/OS-FEDERATION/identity_providers/.*?/protocols/mapped/auth>
        ShibRequestSetting requireSession 1
        AuthType shibboleth
        ShibExportAssertion Off
        Require valid-user
    </LocationMatch>

</VirtualHost>

<VirtualHost *:35357>
    WSGIDaemonProcess keystone-admin processes=5 threads=1 user=vagrant display-name=%{GROUP}
    WSGIProcessGroup keystone-admin
    WSGIScriptAlias / /usr/local/bin/keystone-wsgi-admin
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
    ErrorLogFormat "%M"
    ErrorLog /var/log/apache2/keystone.log
    CustomLog /var/log/apache2/keystone_access.log keystone_combined



</VirtualHost>
Alias /identity /usr/local/bin/keystone-wsgi-public
<Location /identity>
    SetHandler wsgi-script
    Options +ExecCGI

    WSGIProcessGroup keystone-public
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
</Location>

Alias /identity_admin /usr/local/bin/keystone-wsgi-admin
<Location /identity_admin>
    SetHandler wsgi-script
    Options +ExecCGI

    WSGIProcessGroup keystone-admin
    WSGIApplicationGroup %{GLOBAL}
    WSGIPassAuthorization On
</Location>

<Location ~ /Shibboleth.sso>
    SetHandler shib
</Location>

<Location ~ /identity_provider/v3/auth/OS-FEDERATION/identity_providers/.*?/protocols/mapped/auth>
    ShibRequestSetting requireSession 1
    AuthType shibboleth
    ShibExportAssertion Off
    Require valid-user
</Location>

EOF
sudo service shibd restart

sudo a2enmod shib2

sudo rm -rf /tmp/mappings.json
cat << EOF | sudo tee -a /tmp/mappings.json
[
    {
      "local": [
        {
          "group": {
            "domain": {
              "name": "Default"
            },
            "name": "federated_users"
          },
          "user": {
            "name": "{0}@VagrantServiceProvider"
          }
        }
      ],
      "remote": [
        {
          "type": "openstack_user"
        },
        {
          "type": "openstack_user",
          "any_one_of": [
            "another_demo_user"
          ]
        }
      ]
    }
]
EOF

export ENABLE_FED_MAN="OPENSTACK_KEYSTONE_FEDERATION_MANAGEMENT = True"
LOCAL_SETTINGS="/opt/stack/horizon/openstack_dashboard/local/local_settings.py"
grep -q "$ENABLE_FED_MAN" "$LOCAL_SETTINGS" || echo "$ENABLE_FED_MAN" >> "$LOCAL_SETTINGS"

export ALLOWED_HOSTS_HACK="ALLOWED_HOSTS = ['192.168.50.8', ]"
grep -q "$ALLOWED_HOSTS_HACK" "$LOCAL_SETTINGS" || echo "$ALLOWED_HOSTS_HACK" >> "$LOCAL_SETTINGS"

mkdir -p /etc/keystone/fernet-keys/
keystone-manage fernet_setup

sudo service apache2 restart

export IDENTITY_API_VERSION=3
. /opt/stack/devstack/openrc admin admin
set +e

# Try to delete stuff
openstack mapping delete mapping
openstack federation protocol delete --identity-provider VagrantIdentityProvider mapped
openstack identity provider delete VagrantIdentityProvider

# Create group and role assignments
openstack group create federated_users --or-show
openstack role add --project demo --group federated_users Member
openstack role add --domain Default --group federated_users Member
openstack role add --project alt_demo --group federated_users Member

# Create identity provider, mapping, and protocol
openstack identity provider create VagrantIdentityProvider --remote-id http://192.168.50.7/v3/OS_FEDERATION/saml2/idp
openstack mapping create --rules /tmp/mappings.json mapping
openstack federation protocol create --identity-provider VagrantIdentityProvider --mapping mapping mapped
