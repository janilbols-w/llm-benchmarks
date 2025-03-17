#!/bin/bash
# e.g. SERVED_NAME=qwen1.5b TP=1 PP=2 ./scripts/run_vllm_service.sh /vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B

MODEL_PATH=${MODEL_PATH:-'/vllm-workspace/DeepSeek-R1-Distill-Qwen-1.5B'}
SERVED_NAME=${SERVED_NAME:-'mymodel'}
TP_SIZE=${TP:-'1'}
PP_SIZE=${PP:-'1'}
MAX_MODEL_LEN=${MAX_MODEL_LEN:-'32768'}
PORT=${PORT:-'12358'}

vllm serve ${MODEL_PATH} \
        --tensor-parallel-size $TP_SIZE \
        --pipeline-parallel-size $PP_SIZE \
        --trust-remote-code \
        --served-model-name ${SERVED_NAME} \
        --max_model_len=${MAX_MODEL_LEN} \
        --port=$PORT \
        --dtype=half \
        --disable-log-requests \
        $@
