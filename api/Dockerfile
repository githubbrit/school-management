FROM node:14-alpine AS builder
WORKDIR /api
ARG BUILD_ENV="development"
COPY . .
RUN npm install -f
ENV NODE_ENV=$BUILD_ENV


CMD ["node", "app.js"]

#CMD ["npm","start"]

EXPOSE 4000
