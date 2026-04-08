FROM alpine AS builder

#deklaracja zmiennej wersji
ARG VERSION
ENV VERSION=$VERSION

WORKDIR /build

#kopiowanie skryptu generującego treść strony
COPY index.sh .
RUN chmod +x index.sh

#uruchomienie budowy aplikacji – wygenerowanie pliku index.html z danymi serwera
RUN ./index.sh


#etap2

FROM nginx:alpine

COPY --from=builder /build/index.html /usr/share/nginx/html/index.html

HEALTHCHECK --interval=10s --timeout=1s \
    CMD curl -f http://localhost/ || exit 1

EXPOSE 80 