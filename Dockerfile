FROM node

# Install OS updates
RUN apt-get update -y && apt-get upgrade -y

# Setup app dir
RUN mkdir -p /usr/local/share/app
WORKDIR /usr/local/share/app
COPY . /usr/local/share/app

# Docker shouldn't need dev packages
RUN npm install --production --unsafe-perm --silent

EXPOSE 5000
CMD npm start
