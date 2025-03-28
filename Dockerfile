FROM golang:1.9-alpine as builder

WORKDIR /go/src/github.com/connectedservices/prometheus-ecs-sd
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o /go/bin/prometheus-ecs-sd .

FROM alpine:3.21

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/bin/prometheus-ecs-sd /usr/local/bin/prometheus-ecs-sd
CMD ["/usr/local/bin/prometheus-ecs-sd"]
