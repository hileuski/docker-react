from node:16-alpine as builder
workdir '/app'
copy package.json .
run npm install
RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache
copy . .
run npm run build

from nginx
copy --from=builder /app/build /usr/share/nginx/html