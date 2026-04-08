# syntax=docker/dockerfile:1

FROM alpine AS builder

RUN apk add --no-cache git openssh-client

WORKDIR /build

# konfiguracja zaufanego hosta github, aby uniknąć problemów z połączeniem podczas klonowania repozytorium
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

#pobranie repozytorium z kodem aplikacji, wykorzystując klucz SSH do autoryzacji
RUN --mount=type=ssh git clone git@github.com:aleksandrareja/pawcho6.git .

#etap2

FROM nginx:alpine

#deklaracja zmiennej wersji
ARG VERSION
ENV VERSION=$VERSION

LABEL org.opencontainers.image.source=https://github.com/aleksandrareja/pawcho6
LABEL org.opencontainers.image.description="Obraz do Laboratorium 6 - zadanie nieobowiazkowe"
LABEL org.opencontainers.image.authors="Aleksandra Reja"

COPY --from=builder /build/index.sh /docker-entrypoint.d/generate-index.sh

#uruchomienie budowy aplikacji – wygenerowanie pliku index.html z danymi serwera
RUN chmod +x /docker-entrypoint.d/generate-index.sh && /docker-entrypoint.d/generate-index.sh


HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80 