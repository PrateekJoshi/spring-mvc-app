FROM openjdk:8

#Update packages and install maven and cf-cli
RUN apt-get update && \
	apt-get install -y maven 

#Install cf-cli 	

RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add - && \
	echo "deb https://packages.cloudfoundry.org/debian stable main" | sudo tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
	apt-get update && \
	apt-get install cf-cli


WORKDIR /tmp/build	