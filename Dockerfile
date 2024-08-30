FROM debian:bullseye-slim AS builder
WORKDIR /processing

COPY . .

RUN apt-get update && apt-get install -y webp imagemagick

RUN sh ./convert.sh

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /processing/output /usr/share/nginx/html

LABEL org.opencontainers.image.source=https://github.com/krisamin/portfolio-assets