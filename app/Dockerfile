# Stage 1: Install & build

FROM node:20-alpine AS build
WORKDIR /app

#Copy app files and install dependencies
COPY package.json yarn.lock ./   
RUN yarn install --frozen-lockfile

#Build the app
COPY . /app
RUN yarn build


# Stage 2: Use nginx for container health check

FROM nginx:alpine

#Create a non-root user for an added security layer
RUN addgroup -S app && adduser -S app -G app
RUN chown -R app:app /usr/share/nginx /var/cache/nginx /var/run

#Copy nginx configuration & build 
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/build /usr/share/nginx/html

#Change over to non root user
USER app

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]