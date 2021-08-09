FROM golang:1.8-alpine
ADD . /go/src/appdcleaner
RUN go install appdcleaner

FROM alpine:latest
COPY --from=0 /go/bin/appdcleaner .
ENV PORT 8080
CMD ["./appdcleaner"]
