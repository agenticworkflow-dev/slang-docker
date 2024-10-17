REPO := agenticworkflow/sglang
VERSION := v0.3.3.post1


.PHONY: tests


build:
	docker build -t $(REPO):$(VERSION) \
	-f Dockerfile \
	.


test-local:
	docker run -it --rm \
	-v /media/hf_cache:/root/.cache/huggingface/ \
	--gpus all \
	$(REPO):$(VERSION) \
	bash


run-minicpm:
	docker run -it --rm \
	-p 30000:30000 \
	-v /media/hf_cache:/root/.cache/huggingface/ \
	--gpus all \
	$(REPO):$(VERSION) \
	python3 -m sglang.launch_server \
	  --trust-remote-code \
	  --mem-fraction-static=0.7 \
	  --model-path openbmb/MiniCPM-1B-sft-bf16 \
	  --port 30000 \
	  --host 0.0.0.0


run-llavaone:
	docker run -it --rm \
	-p 30000:30000 \
	-v /media/hf_cache:/root/.cache/huggingface/ \
	--gpus all \
	$(REPO):$(VERSION) \
	python3 -m sglang.launch_server \
	  --trust-remote-code \
	  --mem-fraction-static=0.9 \
	  --model-path lmms-lab/llava-onevision-qwen2-7b-ov \
	  --chat-template=chatml-llava \
	  --port 30000 \
	  --host 0.0.0.0
