#!/bin/bash
set -e
set -x
# REQ_RATE=inf ./scripts/run_sharegpt.sh /vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B

MODEL_PATH=${MODEL_PATH:-'/vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B'}
SERVED_NAME=${SERVED_NAME:-'mymodel'}
BACKEND=${BACKEND:-'openai-chat-full'}
DATAPATH=${DATAPATH:-'./data/ShareGPT_V3_unfiltered_cleaned_split.json'}
DATANAME=${DATANAME:-'sharegpt_chat'}
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
        --endpoint "/v1/chat/completions" \
        --port ${PORT} \
	$@


        # --profile \
