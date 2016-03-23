hearstat/jenkins-slave-ubuntu-chefdk
================

Container to be utilized with the Jenkins Docker Plugin

This container is to be configured support chef cookbooks and ruby based building/testing.

# Build Info

* Base Image: ubuntu:14.04
* ChefDK Version: 0.11.2
* Gems
** berkshelf
** test-kitchen
** rubocop
** rubocop-checkstyle_formatter
** kitchen-docker
** kitchen-ec2

# Usage

## Building

To build the image, do the following:

```
docker build github.com/hearstat/docker-jenkinsslave-ubuntu-chefdk
```

A prebuilt container is available in the docker index.

```
docker pull hearstat/jenkins-slave-ubuntu-chefdk
```
