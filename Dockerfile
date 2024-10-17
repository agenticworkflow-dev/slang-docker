FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04


RUN mkdir /app
WORKDIR /app


RUN apt update && apt install -y \
    git \
    python3 \
    python3-pip


RUN pip3 install -U --no-cache-dir \
    pip \
    packaging

RUN pip3 install --no-cache-dir \
    "sglang[all]"

RUN pip3 install --no-cache-dir \
    -i https://flashinfer.ai/whl/cu121/torch2.4/ \
    flashinfer

RUN pip3 install --no-cache-dir \
    datamodel_code_generator \
    lm_eval

COPY tests /app/tests
