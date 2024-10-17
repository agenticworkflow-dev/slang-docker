curl http://localhost:30000/generate \
  -H "Content-Type: application/json" \
  -d '{
    "text": "<|im_start|>what is the highest peak in the world?<|im_end|>",
    "sampling_params": {
      "max_new_tokens": 256,
      "temperature": 0
    }
  }'
