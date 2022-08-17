FROM node:16-alpine AS base
WORKDIR /opt/shop-react-redux-cart-service
COPY package*.json ./

FROM base AS build
RUN npm i
COPY . ./
RUN npm run build

FROM base AS dist
RUN npm i --production
COPY --from=build /opt/shop-react-redux-cart-service/dist ./dist
EXPOSE 4000
ENTRYPOINT ["node", "./dist/main.js"]

