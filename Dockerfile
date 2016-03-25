# Ubuntu Jenkins Slave with ChefDK and development tools

FROM evarga/jenkins-slave
MAINTAINER Hearst Automation Team "atat@hearst.com"

RUN cd /tmp ;\
    wget -O chefdk.deb https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.12.0-1_amd64.deb ;\
    dpkg -i chefdk.deb ;\
    rm -f /tmp/chefdk.deb

ENV JENKINS_HOME /var/lib/jenkins

# Update jenkins user home and group
RUN usermod -d $JENKINS_HOME -s /bin/bash -G jenkins jenkins

# Setup directories and rights so Jenkins user can do things without sudo
COPY systemconfig.sh /tmp/systemconfig.sh
RUN bash -c /tmp/systemconfig.sh

# Clean up mess
RUN rm -rf /tmp/* /var/tmp/*

# Volumes
VOLUME /var/lib/jenkins

COPY Gemfile $JENKINS_HOME/Gemfile

# Downgrade User
USER jenkins

WORKDIR $JENKINS_HOME
RUN chef exec bundle install

RUN /usr/bin/ssh-keygen -A

USER root

RUN locale-gen en_US.UTF-8
ENV LC_ALL="en_US.UTF-8" 
ENV LANG="en_US.UTF-8" 
ENV LANGUAGE="en_US.UTF-8"

CMD ["sudo /usr/sbin/sshd", "-D"]
