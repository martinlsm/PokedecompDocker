FROM debian:bookworm

ARG PORYSCRIPT_VERSION="3.4.0"

WORKDIR /pokedecomp/
RUN apt update
RUN apt upgrade --yes
RUN apt install build-essential binutils-arm-none-eabi git libpng-dev --yes
RUN apt install gcc-arm-none-eabi --yes
RUN apt install wget unzip --yes
RUN apt autoclean

RUN git clone https://github.com/pret/agbcc && cd agbcc/ && ./build.sh

# Install Poryscript
RUN wget https://github.com/huderlem/poryscript/releases/download/${PORYSCRIPT_VERSION}/poryscript-linux.zip \
    && unzip poryscript-linux.zip \
    && ln -s /poryscript-linux/poryscript /usr/bin/poryscript \
    && rm poryscript-linux.zip

# Now Run: cd /pokedecomp/agbcc/ && ./install.sh /path/to/mounted/pokeemerald
