FROM golang:1.11 as build_base
WORKDIR /app
COPY go.* ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o gokv .

FROM alpine
RUN adduser -S -D -H -h /gokv gokv
USER gokv
COPY --from=build_base --chown=gokv:root /app/gokv /app/gokv
WORKDIR /app
CMD ["./gokv"]