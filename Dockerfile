
FROM node:lts as build
RUN npm install -g @angular/cli 

WORKDIR /usr/local/host-mfe
COPY ./host-mfe/package.json /usr/local/host-mfe/package.json

RUN npm install

COPY ./host-mfe/ /usr/local/host-mfe/
RUN npm run build

FROM nginx:latest
COPY --from=build /usr/local/host-mfe/dist/host-mfe /usr/share/nginx/html
EXPOSE 80