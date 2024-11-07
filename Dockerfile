FROM golang:1.23-alpine AS build

WORKDIR /usr/src/app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=build usr/src/app/main .

CMD ["./main"]