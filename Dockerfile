# Etapa 1: Compilación
FROM gcc:latest AS builder
WORKDIR /app
COPY fork_processes.c .
RUN gcc -o fork_app fork_processes.c

# Etapa 2: Ejecución (Imagen final ligera)
FROM debian:bookworm-slim
WORKDIR /root/
COPY --from=builder /app/fork_app .
CMD ["./fork_app"]
