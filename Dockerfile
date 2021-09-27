FROM registry.access.redhat.com/ubi8/ubi:8.4
#FROM redhat/ubi8:8.4
LABEL MAINTAINER "Steven Romero <cloud.ops@tychodev.com>"

ENV PYTHON_VERSION=3.9 \
    PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off

RUN yum -y update \
    && yum -y install python39 \
    && yum -y clean all --enablerepo='*' \
    && yum --disableplugin=subscription-manager clean all

#RUN alternatives --set python /usr/bin/python39 \
#    && alternatives --set pip /usr/bin/pip3

RUN alternatives --install /usr/bin/python python /usr/bin/python39
RUN alternatives --config python 

#USER 1001

RUN python3 --version && pip3 --version
