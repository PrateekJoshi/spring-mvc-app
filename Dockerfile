FROM openjdk:8

#Update packages and install maven and cf-cli
RUN apt-get update && \
	apt-get install -y maven \
 	apt-get install -y apt-transport-https \
 						ca-certificates \
 						curl \
 						gnupg2 \
 						software-properties-common && \
 	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
 	apt-key fingerprint 0EBFCD88 && \
 	add-apt-repository \
   		"deb [arch=amd64] https://download.docker.com/linux/debian \
   		$(lsb_release -cs) \
   		stable" && \
	wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
	echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
	apt-get update && \
	apt-get install -y cf-cli \
	apt-get install -y docker-ce 


WORKDIR /tmp/build	

EXPOSE 8181