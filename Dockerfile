FROM registry.access.redhat.com/ubi8/ubi:8.4
#FROM redhat/ubi8:8.4
LABEL MAINTAINER "Steven Romero <cloud.ops@tychodev.com>"

ENV PYTHON_VERSION=3.9 \
    PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    PIP_NO_CACHE_DIR=off

RUN yum -y update \
    && yum -y install python39 \
    && yum -y clean all --enablerepo='*' \
    && yum --disableplugin=subscription-manager clean all

RUN sudo alternatives --set python /usr/bin/python39

#USER 1001

CMD ["python", "--version"]
