FROM openjdk:11

# Install pacakges
RUN apt update

# Install ssh
RUN DEBIAN_FRONTEND=noninteractive apt install \
        maven \
        openssh-client \
        docker.io -y
        
RUN apt clean
