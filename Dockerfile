# Ubuntu Jenkins Slave with ChefDK and development tools

FROM evarga/jenkins-slave
MAINTAINER Hearst Automation Team "atat@hearst.com"

RUN cd /tmp ;\
    wget -O chefdk.deb https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.11.2-1_amd64.deb ;\
    dpkg -i chefdk.deb ;\
    rm -f /tmp/chefdk.deb

# Volumes
VOLUME /var/lib/jenkins

COPY Gemfile $JENKINS_HOME/Gemfile
RUN chef exec bundle install

RUN locale-gen en_US.UTF-8
ENV LC_ALL="en_US.UTF-8" 
ENV LANG="en_US.UTF-8" 
ENV LANGUAGE="en_US.UTF-8"
