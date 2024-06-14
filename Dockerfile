FROM node:10

WORKDIR /usr/src/app

COPY package.json .
RUN npm install

RUN npm install -g pm2 

COPY app.js .
COPY babel.config.json .
COPY ecosystem.config.js .

EXPOSE 8000

RUN npm run build

CMD ["pm2-runtime", "start", "ecosystem.config.js", "--env", "production"]