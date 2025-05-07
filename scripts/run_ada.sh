#!/bin/bash
# REQ_RATE=inf DATANAME=textsort DATAPATH=./data/textsort_1k.json ./scripts/run_ada.sh /vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B
set -e
set -x
MODEL_PATH=${1:-'./model'}
SERVED_NAME=${2:-'mymodel'}
BACKEND=${3:-'vllm'}
DATANAME=${DATANAME:-'stackselect'} # textsort
DATAPATH=${DATAPATH:-'./data/stackselect_1k.json'} # data/textsort_1k.json
REQ_RATE=${REQ_RATE:-'1'}
NUM_PROMPTS=${NUM_PROMPTS:-'100'}
ADD_CMD=${ADD_CMD}
PORT=${PORT:-'12358'} # default vllm with port 8000

python benchmark_serving.py \
	--backend ${BACKEND} \
	--model ${MODEL_PATH} \
	--served_model_name $SERVED_NAME \
	--dataset-name $DATANAME \
	--dataset-path $DATAPATH \
	--request-rate $REQ_RATE \
	--num-prompts $NUM_PROMPTS \
	--port $PORT \
	$ADD_CMD
