# howgood/foobot

FROM node:0.12

RUN apt-get update && \
    apt-get install -yf libexpat1-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean -y && \
    apt-get autoremove -y

# Install the packages.json
COPY package.json /usr/src/foobot/
WORKDIR /usr/src/foobot
RUN npm install

COPY ./ /usr/src/foobot

CMD bin/hubot -a hipchat
