#!/bin/bash

set -e -o pipefail

DOCKER=${DOCKER:-docker}

LAZYMC_VERSION=v0.2.11
RCONCLI_VERSION=1.7.6
GTNH_VERSION=2.9.0-beta-2
GTNH_VARIANT=Java_17-25
GTNH_PREFIX=betas/

IMAGE_REPO="ghcr.io/istoleyurballs"
IMAGE_NAME="minecraft-gtnh"
IMAGE_TAG_REV="1"

IMAGE_TAG="$GTNH_VERSION-java25-rev$IMAGE_TAG_REV"

$DOCKER build \
  --build-arg LAZYMC_VERSION="$LAZYMC_VERSION" \
  --build-arg RCONCLI_VERSION="$RCONCLI_VERSION" \
  --build-arg GTNH_VERSION="$GTNH_VERSION" \
  --build-arg GTNH_VARIANT="$GTNH_VARIANT" \
  --build-arg GTNH_PREFIX="$GTNH_PREFIX" \
  --label org.opencontainers.image.source=https://github.com/istoleyurballs/gtnh-docker \
  -t "$IMAGE_NAME:$IMAGE_TAG" \
  -t "$IMAGE_NAME:latest" \
  -t "$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG" \
  -t "$IMAGE_REPO/$IMAGE_NAME:latest" \
  .

if [ -z "$NO_UPLOAD" ]; then
  $DOCKER push "$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG"
  $DOCKER push "$IMAGE_REPO/$IMAGE_NAME:latest"
fi
