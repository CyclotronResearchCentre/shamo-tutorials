FROM margrignard/shamo:python-0.2.0 AS binder

RUN python3 -m pip install --no-cache-dir notebook==5.*

ARG NB_USER=shamo
ARG NB_UID=1000

ENV USER=${NB_USER} \
    NB_UID=${NB_UID} \
    HOME=/home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

ENTRYPOINT []
