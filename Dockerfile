FROM golang:alpine AS builder

RUN mkdir -p /go/app
WORKDIR /go/app
COPY app.go /go/app
RUN go build /go/app/app.go

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app/app"]