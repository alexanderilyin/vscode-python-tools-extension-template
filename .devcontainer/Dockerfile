FROM mcr.microsoft.com/devcontainers/javascript-node:22-bookworm

RUN \
  --mount=type=bind,source=./xvfb.sh,target=/tmp/xvfb.sh \
  /tmp/xvfb.sh

# RUN set -eux; \
#   apt-get update; \
#   apt-get install --yes --no-install-recommends \
#   gosu=1.14-1+b10; \
#   rm -rf /var/lib/apt/lists/*
# RUN \
#   --mount=type=bind,source=./conda.sh,target=/tmp/conda.sh \
#   gosu node /tmp/conda.sh

ENV DISPLAY=127.0.0.1:0
# TODO: Find a way to use ARG $USER_ID
# https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user
ENV XDG_RUNTIME_DIR=/run/user/1000
ENV DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

RUN \
  --mount=type=bind,source=./dbus.sh,target=/tmp/dbus.sh \
  /tmp/dbus.sh

# sudo apt-get install --yes libgl1-mesa-glx
# TODO: Maybe I only need one of two
RUN \
  sudo apt-get update \
  && sudo apt-get install --yes libgl1 libglx-mesa0
