FROM centos:centos7

LABEL MAINTAINER="er.ankit.cs@gmail.com"

## Install Node etc...
RUN yum -y update;yum clean all
RUN yum -y install epel-release; yum clean all
RUN yum -y install nodejs npm; yum clean all

# Copy source code
COPY nodeapp/ /src

# Install dependencies
RUN cd /src;npm install

# Expose port
EXPOSE 8080

## Start web app
CMD cd /src && node ./apps.js
