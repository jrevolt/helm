#syntax=docker/dockerfile:1
FROM golang AS build
WORKDIR /work
ADD . ./
RUN --mount=type=cache,dst=/go \
    cd cmd/helm && go build

FROM scratch AS helm
COPY --from=build /work/cmd/helm/helm /helm
