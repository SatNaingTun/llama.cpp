#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODEL_PATH="$SCRIPT_DIR/models/qwen2.5-coder-1.5b-fim.gguf"
PORT="8012"
CTX_SIZE="4096"
GPU_LAYERS="99"

# Resolve real path if it is still a broken/relative symlink
REAL_MODEL_PATH=$(readlink -f "$MODEL_PATH" 2>/dev/null || echo "$MODEL_PATH")

if [ ! -f "$REAL_MODEL_PATH" ]; then
    echo "Error: Model file not found at $MODEL_PATH"
    exit 1
fi

echo "Starting llama.cpp server with Qwen 1.5B FIM..."
echo "Model: $REAL_MODEL_PATH"

llama serve \
    -m "$REAL_MODEL_PATH" \
    -c "$CTX_SIZE" \
    -ngl "$GPU_LAYERS" \
    --port "$PORT" \
    --host "127.0.0.1"
