#!/bin/bash

echo "Building webapp..."

mvn package

echo "Generated war .....running app"

mvn tomcat7:run

echo "Successully deployed app"

