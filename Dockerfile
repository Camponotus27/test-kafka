FROM golang:1.20.4

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod ./
RUN go mod vendor

COPY . .
RUN go build -v -o /usr/local/bin/app ./main.go

CMD ["app"]