FROM node:12

RUN mkdir /myapp

# Create app directory
WORKDIR /myapp

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# EXPOSE 8080
# CMD [ "node", "server.js" ]

COPY entrypoint.sh ./

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
