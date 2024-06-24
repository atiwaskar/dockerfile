FROM node
WORKDIR /usr/src/app
COPY packages*.json ./
RUN npm i express
COPY . .
EXPOSE 2000
CMD ["node","app.json"]
