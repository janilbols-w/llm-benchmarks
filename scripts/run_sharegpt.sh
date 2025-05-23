#!/bin/bash
set -e
set -x
# REQ_RATE=inf ./scripts/run_sharegpt.sh /vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B

MODEL_PATH=${1:-'/vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B'}
SERVED_NAME=${2:-'mymodel'}
BACKEND=${BACKEND:-'vllm'}
DATAPATH=${DATAPATH:-'./data/ShareGPT_V3_unfiltered_cleaned_split.json'}
DATANAME=${DATANAME:-'sharegpt'}
REQ_RATE=${REQ_RATE:-'1'}
NUM_PROMPTS=${NUM_PROMPTS:-'100'}
PORT=${PORT:-'12358'}

python3 benchmark_serving.py \
        --backend ${BACKEND} \
        --model ${MODEL_PATH} \
        --served_model_name $SERVED_NAME \
        --dataset-name $DATANAME \
        --dataset-path $DATAPATH \
        --request-rate $REQ_RATE \
        --num-prompts $NUM_PROMPTS \
        --profile \
        --port ${PORT}
