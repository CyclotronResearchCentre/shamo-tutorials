FROM margrignard/shamo:python-0.3.2 AS binder


USER root
WORKDIR /

RUN python3 -m pip install --no-cache-dir notebook==5.*

ARG NB_USER=jovyan
ARG NB_UID=1000

ENV USER=${NB_USER} \
    NB_UID=${NB_UID} \
    HOME=/home/${NB_USER}

RUN deluser --remove-home shamo && \
    adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}

RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

WORKDIR ${HOME}

ENTRYPOINT []
