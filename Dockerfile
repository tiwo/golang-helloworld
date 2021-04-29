FROM golang:1.14 AS build

WORKDIR /app
COPY helloworld.go /app
RUN go build helloworld.go

FROM scratch

WORKDIR /app
COPY --from=build /app/helloworld /app

CMD ["./helloworld"]