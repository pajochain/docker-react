# This is the build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# This is the run phase
FROM nginx
EXPOSE 80
# Copy from a previous phase
COPY --from=builder /app/build /usr/share/nginx/html



