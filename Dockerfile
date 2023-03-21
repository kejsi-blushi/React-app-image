FROM node:12.2.0-alpine as build-stage
WORKDIR /app
COPY . /app
RUN npm config set unsafe-perm true
RUN npm install
RUN npm build


FROM nginx:1.16.0-alpine
COPY --from=build-stage /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

