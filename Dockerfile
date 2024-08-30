FROM debian:bullseye-slim AS builder
WORKDIR /processing

COPY . .

RUN apt-get update && apt-get install -y webp imagemagick

RUN sh ./convert.sh

FROM flashspys/nginx-static:latest

COPY --from=builder /processing/output /static

LABEL org.opencontainers.image.source=https://github.com/krisamin/portfolio-assets