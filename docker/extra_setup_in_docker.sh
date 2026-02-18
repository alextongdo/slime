#!/usr/bin/env bash
# Additional setup script to be run inside the Docker container
# This script installs required packages and sets up the project environment

set -e  # exit on error

echo "📦 Installing Python dependencies..."
# pip install --no-cache-dir \
#     mypy \
#     astunparse \
#     sqlparse \
#     fire

echo "📦 Installing system dependencies..."
# apt-get update && apt-get install -y tzdata && apt-get clean

# Get the absolute path of the project directory
echo "🔧 Setting up project environment..."
PROJECT_DIR=$(realpath "$(dirname "$(pwd)")")
pip install -e "${PROJECT_DIR}" --no-deps

echo "✅ Setup complete!"