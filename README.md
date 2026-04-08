# Laboratorium 6 - Programowanie Aplikacji w Chmurze Obliczeniowej (PAwChO)

Projekt demonstruje zaawansowane techniki bezpiecznego budowania obrazów Docker, w tym wykorzystanie rozszerzonego frontendu BuildKit do bezpiecznego montowania kluczy SSH, wieloetapowe budowanie oraz kontrolę zdrowia aplikacji.

## Autor
- **Imię i Nazwisko:** Aleksandra Reja 
- **Grupa dziekańska:** 6.7
- **Nr albumu:** 101655
- **Repozytorium GitHub:** [https://github.com/aleksandrareja/pawcho6]



---



## Obraz zbudowano następującym poleceniem



docker build --ssh default --build-arg VERSION=1.0.0 -t lab6 .


[+] Building 26.9s (18/18) FINISHED                                                    docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                   0.2s
 => => transferring dockerfile: 1.15kB                                                                 0.1s
 => resolve image config for docker-image://docker.io/docker/dockerfile:1                              3.1s
 => [auth] docker/dockerfile:pull token for registry-1.docker.io                                       0.0s
 => docker-image://docker.io/docker/dockerfile:1@sha256:2780b5c3bab67f1f76c781860de469442999ed1a0d799  3.4s
 => => resolve docker.io/docker/dockerfile:1@sha256:2780b5c3bab67f1f76c781860de469442999ed1a0d7992a5e  0.1s
 => => sha256:bcb5d2ab7af67a669c932851c8bb8a26895dda6258900edfd7429d57bfd3592f 14.11MB / 14.11MB       2.1s
 => => extracting sha256:bcb5d2ab7af67a669c932851c8bb8a26895dda6258900edfd7429d57bfd3592f              1.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                       1.2s
 => [internal] load metadata for docker.io/library/nginx:alpine                                        2.3s
 => [auth] library/nginx:pull token for registry-1.docker.io                                           0.0s
 => [auth] library/alpine:pull token for registry-1.docker.io                                          0.0s
 => [internal] load .dockerignore                                                                      0.1s
 => => transferring context: 2B                                                                        0.0s
 => [stage-1 1/2] FROM docker.io/library/nginx:alpine@sha256:645eda1c2477aaa9b879f73909b9222c6f19798d  8.0s
 => => resolve docker.io/library/nginx:alpine@sha256:645eda1c2477aaa9b879f73909b9222c6f19798dd45be670  0.1s
 => => sha256:c8a2fa3a88d244a3f32dcbc9c1f7649c662661a28c624198ada43aa0b7598e7f 1.40kB / 1.40kB         0.4s
 => => sha256:1165b869c51a1a0747d78cec8fab96c30156a979e51ecf2f91aa792e557d94a4 20.25MB / 20.25MB       3.7s
 => => sha256:34dfdd2ef1f920d0054dde2fc09ddc83ff8e71d05fadb79e2cab6e6234596f0a 1.21kB / 1.21kB         0.8s
 => => sha256:a71873b303e8d75170b7ced2725b01b3ae15ad76f0d4eef16a49335821b6a0ef 404B / 404B             0.6s
 => => sha256:ff9f59a6a62e9e9f29d7a84fb18865b45664d3f0d061eff7548bd61746dd101c 957B / 957B             0.6s
 => => sha256:15e759724ff67f262e38bb7c070af9d0b84f959f9b37fa966f68bf2f881a4b62 627B / 627B             0.5s
 => => sha256:f03becc8ac15611cfcc421c977a5ba4d65456093570788523a4ba557689aa7f7 1.87MB / 1.87MB         1.2s
 => => extracting sha256:f03becc8ac15611cfcc421c977a5ba4d65456093570788523a4ba557689aa7f7              1.9s
 => => extracting sha256:15e759724ff67f262e38bb7c070af9d0b84f959f9b37fa966f68bf2f881a4b62              0.1s
 => => extracting sha256:ff9f59a6a62e9e9f29d7a84fb18865b45664d3f0d061eff7548bd61746dd101c              0.1s
 => => extracting sha256:a71873b303e8d75170b7ced2725b01b3ae15ad76f0d4eef16a49335821b6a0ef              0.1s
 => => extracting sha256:34dfdd2ef1f920d0054dde2fc09ddc83ff8e71d05fadb79e2cab6e6234596f0a              0.1s
 => => extracting sha256:c8a2fa3a88d244a3f32dcbc9c1f7649c662661a28c624198ada43aa0b7598e7f              0.1s
 => => extracting sha256:1165b869c51a1a0747d78cec8fab96c30156a979e51ecf2f91aa792e557d94a4              3.0s
 => CACHED [builder 1/6] FROM docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a86232396  0.1s
 => => resolve docker.io/library/alpine:latest@sha256:25109184c71bdad752c8312a8623239686a9a2071e8825f  0.1s
 => [builder 2/6] RUN apk add --no-cache git openssh-client                                            9.3s
 => [builder 3/6] WORKDIR /build                                                                       0.1s
 => [builder 4/6] RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts          2.1s
 => [builder 5/6] RUN --mount=type=ssh git clone git@github.com:aleksandrareja/pawcho6.git .           2.7s
 => [builder 6/6] RUN chmod +x index.sh && ./index.sh                                                  0.6s
 => [stage-1 2/2] COPY --from=builder /build/index.html /usr/share/nginx/html/index.html               0.1s
 => exporting to image                                                                                 1.0s
 => => exporting layers                                                                                0.6s
 => => exporting manifest sha256:234555d91ef35aa2bd9dd2c38bdaba907ceba6089c9f78655193b5b1ed673ea6      0.0s
 => => exporting config sha256:3f0f7beb4c3867bccd9308bf9057f1103b0a55bafdcfe6012dd178cf99e5c7a0        0.0s
 => => exporting attestation manifest sha256:23e5a5f674e71ec56ef059595d73abfb5651136cedba9f684726343f  0.1s
 => => exporting manifest list sha256:13992bb4e17700ab7f9024b67db94a37ea0e350a4682132606f02f7b77781b4  0.0s
 => => naming to docker.io/library/lab6:latest                                                         0.0s
 => => unpacking to docker.io/library/lab6:latest  





## Obraz uruchomiono poleceniem



docker run -d -p 8080:80 --name test_lab6 lab6


## Sprawdzono apliakcję wpisując "curl localhost:8080", wynik działania polecnia



curl localhost:8080



<html><body>

<h1>Informacje o serwerze</h1>

<p><b>Adres IP:</b> 127.0.0.1</p>

<p><b>Nazwa serwera (Hostname):</b> buildkitsandbox</p>

<p><b>Wersja aplikacji:</b> 1.0.0</p>

</body></html>



## Sprawdzono działanie kontenera 



docker ps --filter name=test_lab6

CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS                    PORTS                                     NAMES
28eb651ec2c1   lab6      "/docker-entrypoint.…"   22 minutes ago   Up 22 minutes (healthy)   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   test_lab6
