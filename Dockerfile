# Base stage for building the static files
FROM node:19-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 4321

# 启动应用
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
<<<<<<< HEAD
# docker启动
#docker run -d -p 4321:4321 -v ./src:/app/src -v ./public:/app/public learning-post
=======

#docker run -d -p 4321:4321 -v ./src:/app/src -v ./pubilc:/app/pubilc learning-post
>>>>>>> 5f793479beffe371052dc1f7bc9cb77685b1f212

