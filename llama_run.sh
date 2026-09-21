#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODEL_PATH="$SCRIPT_DIR/models/llama/llama-3.2-3b-instruct-q4_k_m.gguf"
PORT="8012"
CTX_SIZE="16384"
GPU_LAYERS="33"

if [ ! -f "$MODEL_PATH" ]; then
    echo "Error: Model file not found at $MODEL_PATH"
    exit 1
fi

if [ -f "./build/bin/llama-server" ]; then
    SERVER_BIN="./build/bin/llama-server"
elif command -v llama-server &> /dev/null; then
    SERVER_BIN="llama-server"
else
    SERVER_BIN="./llama-server"
fi

echo "Starting llama-server optimized for Continue extension..."
echo "Model: $MODEL_PATH"

"$SERVER_BIN" \
    -m "$MODEL_PATH" \
    -ngl "$GPU_LAYERS" \
    --port "$PORT" 
