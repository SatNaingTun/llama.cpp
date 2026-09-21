#!/usr/bin/env bash

# Set Vulkan device and start Gemma 3 llama-server
GGML_VK_VISIBLE_DEVICES=1 \
/media/sat-naing-tun/Data2/OnlineProjects/llama.cpp/build/bin/llama-server \
  -m /media/sat-naing-tun/Data2/OnlineProjects/llama.cpp/models/gemma/gemma-3-1b-it-Q4_K_M.gguf \
  -ngl 33 \
  --port 8013
