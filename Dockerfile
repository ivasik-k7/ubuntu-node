FROM ubuntu:jammy
LABEL maintainer="Ivan Kovtun"

ENV USER=developer
ENV GROUP=developers
ENV UID=1001 

ENV HOME /home/{user}
ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -r ${GROUP} && \
    useradd -m -s /bin/bash -u $UID -r -g ${GROUP} ${USER}

WORKDIR $HOME

# Localization and timezone
ARG TZ=Europe/London
ENV TZ=$TZ

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install sudo and other necessary packages
RUN apt-get update && apt-get install -y sudo

# Install the necessary packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ## Core Utils Related 
    ca-certificates vim sudo make gnupg \
    tree wget git curl bash-completion \
    ## NodeJs & npm Related
    nodejs npm && \
    ## Autoclean Related
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

# Configure sudoers for the developer user
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers   

# Change ownership with permissions of the home directory to the developer user
RUN chown -R $USER:$GROUP $HOME && \
    chmod -R u+rwx $HOME

USER ${USER}

CMD [ "/bin/bash" ]