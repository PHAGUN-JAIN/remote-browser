FROM  centos:latest


RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

RUN  yum install -y glibc-locale-source

# Setting up the default locale to en_US.UTF-8
RUN  localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8 && \
     export LANG=en_US.UTF-8
     
# Installing Necessary packages including firefox
RUN  yum install -y dbus-x11 PackageKit-gtk3-module libcanberra-gtk2 firefox

# Generating a universally unique ID for the Container
RUN  dbus-uuidgen > /etc/machine-id

# Starting Firefox application
CMD  /usr/bin/firefox


# to run this container =>  docker run -e DISPLAY=$DISPLAY  -v /tmp/.X11-unix/:/tmp/.X11-unix/ --name firefox testimg-1
