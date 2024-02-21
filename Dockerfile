FROM golang:1.14.6-alpine3.12 as builder
COPY go.mod go.sum /go/src/github.com/abezzi/delta-restaurant-api/
WORKDIR /go/src/github.com/abezzi/delta-restaurant-api
RUN go mod download
COPY . /go/src/github.com/abezzi/delta-restaurant-api
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o build/delta-restaurant-api github.com/abezzi/delta-restaurant-api

FROM alpine
RUN apk add --no-cache ca-certificates && update-ca-certificates
COPY --from=builder /go/src/github.com/abezzi/delta-restaurant-api/build/delta-restaurant-api /usr/bin/delta-restaurant-api
EXPOSE 8080 8080
ENTRYPOINT ["/usr/bin/delta-restaurant-api"]
