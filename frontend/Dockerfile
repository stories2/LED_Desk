FROM node:14.18.1-alpine3.11

WORKDIR /app

COPY ./package-lock.json ./
COPY ./package.json ./

RUN npm i

COPY . .

CMD ["npm", "run", "build"]