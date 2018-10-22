#!/bin/bash

if [ ! -z ${http_proxy} ] 
then
	http_proxy="http://"${http_proxy}
	https_proxy="https://"${https_proxy}
fi

build_image="spring_mvc_build_image"
build_container="spring_mvc_build_container"


function create_container()
{
	docker build --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --pull --force-rm=true -t $build_image .
}

function run_container()
{
	docker run  --name $build_container -v `pwd`:/tmp/build $build_image ./maven_build.sh
}


function delete_container()
{
	docker rm -f $build_container 
}

function run_app()
{
	docker run -p 8181:8181 --name $build_container -v `pwd`:/tmp/build $build_image ./run_app.sh
}

function install_docker()
{
	apt-get update
	apt-get install \
     		apt-transport-https \
     		ca-certificates \
     		curl \
     		gnupg2 \
     		software-properties-common

	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
	apt-key fingerprint 0EBFCD88
	add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/debian \
   		$(lsb_release -cs) \
   		stable"
	apt-get update
	apt-get install docker-ce
}

install_docker
create_container
run_container
delete_container
run_app
