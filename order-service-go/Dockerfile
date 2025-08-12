FROM golang:1.24.2-alpine3.21 AS base

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN chmod +x wait-for-it.sh

FROM base AS builder
RUN CGO_ENABLED=0 GOOS=linux go build -o api .

FROM alpine:3.21

WORKDIR /usr/src/app

RUN apk add --no-cache bash

COPY --from=builder /usr/src/app/api .
COPY --from=builder /usr/src/app/wait-for-it.sh .

CMD [ "./api" ]