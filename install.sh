#!/bin/bash -e

set -e
export DEBIAN_FRONTEND=noninteractive

# Install Packages for Development
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y apache2
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y vim
sudo apt-get install -y git-review
sudo apt-get install -y python-pip
sudo apt-get install -y python2.7-dev
sudo apt-get install -y python3.5
sudo apt-get install -y python3.5-dev
sudo apt-get install -y python-tox
sudo apt-get install -y libssl-dev
sudo apt-get install -y libffi-dev
sudo apt-get install -y ebtables
sudo apt-get install -y crudini
sudo pip install rpdb


sleep 2

# Setup devstack
sudo mkdir -p /opt/stack
sudo chown -R ubuntu:ubuntu /opt/stack
if [ ! -d /home/ubuntu/devstack ]
    then
    git clone https://github.com/openstack-dev/devstack /home/ubuntu/devstack || true
fi
if [ ! -d /opt/stack/devstack ]
    then
    cp -r /home/ubuntu/devstack /opt/stack
fi

# Source file to become admin
cd /opt/stack/devstack
rm -rf /home/ubuntu/id_v.sh
sudo cat <<EOF > /home/ubuntu/id_v.sh
export IDENTITY_API_VERSION=3
. /opt/stack/devstack/openrc admin admin
EOF

rm -rf local.conf
export STATIC_ADDR=`ip -4 addr show enp0s8 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
sudo cat <<EOF > local.conf
[[local|localrc]]
disable_service tempest
#enable_service h-eng h-api h-api-cfn h-api-cw
IMAGE_URL_SITE="http://download.fedoraproject.org"
IMAGE_URL_PATH="/pub/fedora/linux/releases/21/Cloud/Images/x86_64/"
IMAGE_URL_FILE="Fedora-Cloud-Base-20141203-21.x86_64.qcow2"
IMAGE_URLS+=","$IMAGE_URL_SITE$IMAGE_URL_PATH$IMAGE_URL_FILE
#LIBS_FROM_GIT=django_openstack_auth
# You can update these to pull from updated reviews
# HORIZON_REPO=https://git.openstack.org/openstack/horizon
# HORIZON_BRANCH=refs/changes/35/408435/3
# HORIZONAUTH_REPO=https://git.openstack.org/openstack/django_openstack_auth
# HORIZONAUTH_BRANCH=refs/changes/50/408450/8
HOST_IP=$STATIC_ADDR
RECLONE=yes
KEYSTONE_TOKEN_FORMAT=UUID
DATABASE_PASSWORD=secretdatabase
RABBIT_PASSWORD=secretrabbit
ADMIN_PASSWORD=secretadmin
SERVICE_PASSWORD=secretservice
SERVICE_TOKEN=111222333444
LOGFILE=/opt/stack/logs/stack.sh.log
EOF

echo "export SERVICE_HOST=\"localhost\"" >> .bashrc
sudo chown -R ubuntu:ubuntu /opt/stack/
cd /opt/stack/devstack
if ! screen -list | grep -q "stack"; then
        ./stack.sh
    fi
sudo apt-get install -y python-tox
