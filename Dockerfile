FROM node:16.19.0


WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci

COPY . .

EXPOSE $PORT

ENV NODE_ENV=production
ENV HOST=0.0.0.0

RUN npm run build

CMD [ "npm", "run", "start" ]