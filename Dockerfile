FROM debian:stable-slim

RUN apt update && apt install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    procps \
    curl \
    file \
    git

RUN adduser --home /home/homebrew --disabled-password --gecos 'User for build package' homebrew

USER homebrew
RUN set -eu pipefail && \
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew && \
    mkdir -p ~/.linuxbrew/bin ~/.local/bin && \
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin && \
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.local/bin && \
    eval $(~/.linuxbrew/bin/brew shellenv)

WORKDIR /home/homebrew/.linuxbrew/Homebrew/Library/Taps/wabarc/homebrew-wayback

COPY . .

USER root
RUN set -eu pipefail && \
    chown -R homebrew:homebrew /home/homebrew/.linuxbrew/Homebrew/Library/Taps/

USER homebrew

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
