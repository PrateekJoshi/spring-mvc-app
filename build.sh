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



create_container
run_container
delete_container
run_app
