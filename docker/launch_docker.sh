#!/bin/bash

set -e  # exit on error

# Get the absolute path of the project directory
PROJECT_DIR=$(realpath "$(dirname "$(pwd)")")
DOCKER_IMAGE="slimerl/slime:latest"

# -v ~/.cache/huggingface:/root/.cache/huggingface passes the HF auth token if you are logged in outside the container.
# ${PROJECT_DIR}/models and ${PROJECT_DIR}/datasets will persist models/datasets downloaded by slime.
# -e NCCL_P2P_LEVEL=NVL \
docker run \
    --gpus all \
    --name slime \
    --rm \
    --shm-size=16g \
    --ipc=host \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    -v "${PROJECT_DIR}/:/workspace" \
    -v "$HOME/.cache/huggingface:/root/.cache/huggingface" \
    -v "${PROJECT_DIR}/models:/root/models" \
    -v "${PROJECT_DIR}/datasets:/root/datasets" \
    -w /workspace \
    -it "${DOCKER_IMAGE}" /bin/bash