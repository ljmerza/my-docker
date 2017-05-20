FROM resin/rpi-raspbian:jessie

ENV LANG en_US.utf8
ENV TZ America/New_York

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# install node
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION}.x | sudo -E bash - \
  && apt-get install -y nodejs


# install yarn
RUN curl -o- -L https://yarnpkg.com/install.sh | bash

# install pm2
RUN yarn --global pm2

# copy node files
RUN mkdir /node
COPY ./node /node

WORKDIR /node
RUN yarn
CMD [ "yarn", "start"]
