### MULTI-STAGE BUILD ###

# create build container
FROM mysql:8.4

WORKDIR /src

COPY go.* .
COPY main.go .

RUN go build -o main main.go


# create run container
FROM alpine:3.20

WORKDIR /app

# copying from gobuilder:/src/main to /app/main
COPY --from=gobuilder /src/main main
COPY public public
COPY templates templates

ENV PORT=3000

# health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
CMD curl http://localhost:${PORT}/healthz || exit 1

EXPOSE ${PORT}

ENTRYPOINT ["/app/main"]
CMD []