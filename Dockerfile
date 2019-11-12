FROM openjdk:12-alpine

MAINTAINER akop @ github.com/AndreKoepke

# install dependencies
RUN apk add --update --no-cache \
	openssh-client wget tar \
	cmake g++ git linux-headers libpthread-stubs make \
	font-noto shadow libxext libxrender libxtst libxi git

# load and extract intelliJ
RUN wget -nv --show-progress --progress=bar:force:noscroll -c https://download-cf.jetbrains.com/idea/ideaIU-2019.2.4.tar.gz -O - | tar -xz \
	&& mkdir /opt/idea \
        && mv idea*/* /opt/idea

# put entrypoint in 
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh 
