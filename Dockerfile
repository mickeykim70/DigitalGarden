FROM klakegg/hugo:latest AS builder
WORKDIR /usr/src/app
COPY . .
RUN hugo

FROM nginx:alpine
COPY --from=builder /usr/src/app/public /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

