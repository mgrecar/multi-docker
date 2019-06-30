FROM node:alpine
RUN apk add --upgrade curl sqlite

WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "start"]
