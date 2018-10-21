#!/bin/bash

build_image="spring_mvc_build_image"
build_container="spring_mvc_build_container"

function create_container()
{
	docker build --pull --force-rm=true -t $build_image .
}

function run_container()
{
	docker run --name $build_container -v `pwd`:/tmp/build $build_image ./maven_build.sh
}

create_container
run_container