# Pull base image.
FROM resin/rpi-raspbian
MAINTAINER sfukazu

RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get update
RUN apt-get install -y wget curl vim git ca-certificates apt-utils
<<<<<<< HEAD
RUN git clone https://github.com/openstack/openstack-ansible.git
=======
RUN apt-get install -y python python-dev python-pip python-setuptools libpython-dev gcc openssh-client
RUN pip install pycrypto PyYAML
RUN git clone https://github.com/openstack/openstack-ansible.git
RUN cd openstack-ansible; git checkout 13.1.1
RUN cp -a /openstack-ansible/etc/openstack_deploy /etc/openstack_deploy
RUN cd openstack-ansible;scripts/pw-token-gen.py --file /etc/openstack_deploy/user_secrets.yml
RUN cat /etc/openstack_deploy/user_secrets.yml
ADD ./ /etc/openstack_deploy/


RUN cd openstack-ansible;scripts/bootstrap-ansible.sh




>>>>>>> 2b18037335f5dbf2c3078ca61525ed4c230f9491
