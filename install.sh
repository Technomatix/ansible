#!/usr/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

echo "Your system: ${machine}"
echo ""

if [ "${machine}" = Linux ] ; then   # install for debian based system
	echo "--Install ansible for debian system--"
	apt-get install software-properties-common -y 
	apt-add-repository ppa:ansible/ansible -y
	apt-get update
	apt get install ansible -y 
	echo "Successful"
	ansible --version

elif [ "${machine}" = Cygwin ] ; then		# install for windows system
	wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg #install packege manager & dependenses
	install apt-cyg /bin && rm apt-cyg
	apt-cyg install curl git nano make openssh binutils gmp \
	openssl \
	openssl-devel \
	python \
	python-crypto \
	python-jinja2 \
	python-setuptools \
	python-openssl \
	python-devel \
	python2 \
	python2-cryptography \
	python2-openssl \
	python2-pip \
	python2-setuptools \
	python2-yaml \
	python-paramiko \
	gcc-core gcc-g++ \
 	easy_install-2.7 pip #--------Install ansible
	pip install ansible
	ansible --version
fi
