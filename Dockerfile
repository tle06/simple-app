#test comment for webhook - testing deployment
#test new deployment - one more test test tests
FROM golang:alpine
WORKDIR /go/src/github.com/mchmarny/simple-app/
COPY . .
RUN CGO_ENABLED=0 go build -v -o app

FROM scratch
COPY --from=0 /go/src/github.com/mchmarny/simple-app/app .
EXPOSE 8080
ENTRYPOINT ["/app"]