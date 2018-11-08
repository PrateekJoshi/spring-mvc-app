#!/bin/bash

if [ ! -z ${http_proxy} ] 
then
	http_proxy="http://"${http_proxy}
	https_proxy="https://"${https_proxy}
fi

build_image="spring_mvc_build_image"
build_container="spring_mvc_build_container"


function run_app()
{
	docker run -p 8181:8181 --name $build_container -v `pwd`:/tmp/build $build_image ./run_app.sh
}

run_app