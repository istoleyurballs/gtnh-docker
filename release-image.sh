#!/bin/bash

set -e -o pipefail

LAZYMC_VERSION=v0.2.11
RCONCLI_VERSION=1.7.3
GTNH_VERSION=2.8.4
GTNH_VARIANT=Java_17-25

IMAGE_REPO="ghcr.io/istoleyurballs"
IMAGE_NAME="minecraft-gtnh"
IMAGE_TAG_REV="10"

IMAGE_TAG="$GTNH_VERSION-java25-rev$IMAGE_TAG_REV"

docker build \
  --build-arg LAZYMC_VERSION="$LAZYMC_VERSION" \
  --build-arg RCONCLI_VERSION="$RCONCLI_VERSION" \
  --build-arg GTNH_VERSION="$GTNH_VERSION" \
  --build-arg GTNH_VARIANT="$GTNH_VARIANT" \
  --label org.opencontainers.image.source=https://github.com/istoleyurballs/gtnh-docker \
  -t "$IMAGE_NAME:$IMAGE_TAG" \
  -t "$IMAGE_NAME:latest" \
  -t "$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG" \
  -t "$IMAGE_REPO/$IMAGE_NAME:latest" \
  .

if [ -z "$NO_UPLOAD" ]; then
  docker push "$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG"
  docker push "$IMAGE_REPO/$IMAGE_NAME:latest"
fi
