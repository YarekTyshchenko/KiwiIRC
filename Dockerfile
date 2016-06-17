FROM node

WORKDIR /src
COPY package.json ./package.json
RUN npm install --production
COPY . /src/

# Copying example configuration.
RUN cp config.example.js config.js
RUN ./kiwi build

ENTRYPOINT bash -c './kiwi start && tail -f kiwi.log'
