FROM golang:alpine

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install required tools
RUN apk update && \
    apk add --no-cache nano less sudo git libxext libxrender libxtst libxi freetype procps gcompat openssh-client && \
    addgroup --gid $USER_GID $USERNAME && \
    adduser --uid $USER_UID --ingroup $USERNAME -D $USERNAME && \
    echo "$USERNAME ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

ENV ENV="/home/$USERNAME/.ashrc"

USER $USERNAME