FROM openjdk:8

#Update packages and install maven and cf-cli
RUN apt-get update && \
	apt-get install -y maven 

#Install cf-cli 	

RUN apt-get update && apt-get install -y apt-transport-https && \
	wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
	echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
	apt-get update && \
	apt-get install cf-cli


WORKDIR /tmp/build	

EXPOSE 8181