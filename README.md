# Laboratorium 6 - Programowanie Aplikacji w Chmurze Obliczeniowej (PAwChO)

Projekt demonstruje zaawansowane techniki bezpiecznego budowania obrazów Docker, w tym wykorzystanie rozszerzonego frontendu BuildKit do bezpiecznego montowania kluczy SSH, wieloetapowe budowanie oraz kontrolę zdrowia aplikacji.

## Autor
- **Imię i Nazwisko:** Aleksandra Reja 
- **Grupa dziekańska:** 6.7
- **Nr albumu:** 101655
- **Repozytorium GitHub:** [https://github.com/aleksandrareja/pawcho6]



---

## Obraz został opublikowany w rejestrze GitHub Container Registry i udostępniony publicznie. 
Można go pobrać komendą: 
docker pull ghcr.io/aleksandrareja/lab6:latest



## Obraz zbudowano następującym poleceniem 
(wymuszenie ponownego klonowania repozytorium przez SSH aby upewnić się, że obraz zawiera najnowszą wersję skryptu)



docker build --no-cache --ssh default --build-arg VERSION=1.0.0 -t lab6 .


[+] Building 33.5s (15/15) FINISHED                                                    docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                   0.3s
 => => transferring dockerfile: 1.21kB                                                                 0.2s
 => resolve image config for docker-image://docker.io/docker/dockerfile:1                              1.0s
 => CACHED docker-image://docker.io/docker/dockerfile:1@sha256:2780b5c3bab67f1f76c781860de469442999ed  0.1s
 => => resolve docker.io/docker/dockerfile:1@sha256:2780b5c3bab67f1f76c781860de469442999ed1a0d7992a5e  0.1s
 => [internal] load metadata for docker.io/library/nginx:alpine                                        0.6s
 => [internal] load metadata for docker.io/library/alpine:latest                                       0.6s
 => [internal] load .dockerignore                                                                      0.0s
 => => transferring context: 2B                                                                        0.0s
 => CACHED [builder 1/5] FROM docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a86232396  0.1s
 => => resolve docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f  0.1s
 => CACHED [stage-1 1/3] FROM docker.io/library/nginx:alpine@sha256:645eda1c2477aaa9b879f73909b9222c6  0.1s
 => => resolve docker.io/library/nginx:alpine@sha256:645eda1c2477aaa9b879f73909b9222c6f19798dd45be670  0.1s
 => [builder 2/5] RUN apk add --no-cache git openssh-client                                           14.6s
 => [builder 3/5] WORKDIR /build                                                                       0.2s
 => [builder 4/5] RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts          3.2s
 => [builder 5/5] RUN --mount=type=ssh git clone git@github.com:aleksandrareja/pawcho6.git .           3.0s
 => [stage-1 2/3] COPY --from=builder /build/index.sh /docker-entrypoint.d/generate-index.sh           0.1s
 => [stage-1 3/3] RUN chmod +x /docker-entrypoint.d/generate-index.sh && /docker-entrypoint.d/generat  0.6s
 => exporting to image                                                                                 5.3s
 => => exporting layers                                                                                1.8s
 => => exporting manifest sha256:e920dd6a1acdbfcc12fd4a12aae59e2acf2a3779810a1e11af172ffd0dcacb99      0.4s
 => => exporting config sha256:d8c1b8360e78ba323e55c4817d9049b7daefba15e890ad53eadb91d1aa86130e        0.4s
 => => exporting attestation manifest sha256:9ebcf99ff3e59e87a599fc983110643f0a07a6ddde37822d044a412d  0.8s
 => => exporting manifest list sha256:f9fd5c4be6fad45cda2825f6144a2e0a63fe9384282c08a1defe92d95d84c68  0.4s
 => => naming to docker.io/library/lab6:latest                                                         0.4s
 => => unpacking to docker.io/library/lab6:latest  





## Obraz uruchomiono poleceniem



docker run -d -p 8080:80 --name app_lab6 lab6


## Sprawdzono apliakcję wpisując "curl localhost:8080", wynik działania polecnia



curl localhost:8080



Informacje o serwerze
Adres IP: 172.17.0.3

Nazwa serwera (Hostname): 62498ef3d412

Wersja aplikacji: 1.0.0



## Sprawdzono działanie kontenera 



docker ps --filter name=app_lab6

CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                    PORTS                                     NAMES
62498ef3d412   lab6      "/docker-entrypoint.…"   24 seconds ago   Up 24 seconds (healthy)   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   app_lab6