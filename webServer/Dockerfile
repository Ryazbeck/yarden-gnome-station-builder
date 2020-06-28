FROM node:12-alpine

WORKDIR /

COPY package*.json ./

RUN npm install -f

COPY . .

RUN npm run build

EXPOSE 80

ENV HOST=0.0.0.0

CMD [ "npm", "start" ]