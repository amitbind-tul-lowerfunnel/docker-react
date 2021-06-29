# Build phase 1

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# All above steps create a build folder inside the app directory
# This will produce /app/build
# and used by run phase to start nginx server
# Build phase 2

FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
