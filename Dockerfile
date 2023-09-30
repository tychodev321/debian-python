# https://hub.docker.com/_/python
FROM python:3.10.10-slim

LABEL maintainer=""

ENV PYTHON_VERSION=3.10.10 \
    PATH=$HOME/.local/bin/:$PATH \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off \
    POETRY_VERSION=1.2.2

# Configure Python
ENV PATH=/root/.local/bin:$PATH

# Install pipx and poetry
RUN python -m pip install --user pipx \
    && python -m pipx ensurepath --force \
    && pipx install poetry==${POETRY_VERSION}

RUN echo "python version: $(python --version)" \
    && echo "pip version - $(python -m pip --version)" \
    && echo "poetry about: $(poetry about)"

# USER 1001

CMD ["echo", "This is a 'Purpose Built Image', It is not meant to be ran directly"]
