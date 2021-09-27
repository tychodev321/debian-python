FROM registry.access.redhat.com/ubi8/ubi:8.4
#FROM redhat/ubi8:8.4
LABEL MAINTAINER "Steven Romero <cloud.ops@tychodev.com>"

ARG gitlab_pip_token
ENV GITLAB_PIP_TOKEN=$gitlab_pip_token
ENV GITLAB_PIP_USER=__token__

ENV PYTHON_VERSION=3.9 \
    PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off

RUN yum -y update \
    && yum -y install python39 \
    && yum -y clean all --enablerepo='*' \
    && yum --disableplugin=subscription-manager clean all

RUN pip3 install poetry \
    && poetry config virtualenvs.create false \
    && poetry config http-basic.gitlab ${GITLAB_PIP_USER} ${GITLAB_PIP_TOKEN} \
    && poetry install

#USER 1001

RUN python3 --version && pip3 --version
