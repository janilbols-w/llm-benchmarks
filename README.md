# LLM-Benchmark

Collection of benchmark for LLM-inference-engines, for benchmarking throughput & latency.

Reference
- https://github.com/vllm-project/vllm/tree/main/benchmarks
- https://github.com/open-compass/Ada-LEval


# Quickstart

## 1 Install deps
```bash
bash ./scripts/install.sh
```

## 2 Download Datasets (Optional)
- download ShareGPT

- download ada dataset
```bash
bash ./scripts/fetch_data_ada.sh
```
```
.
├── ada-leval
├── ...
├── data
│   ├── stackselect_1k.json
│   ├── ...
│   ├── textsort_1k.json
│   └── ...
└── scripts
```

## 3 run bench
## 3.1 vllm
- start vllm service
```bash
bash scripts/run_vllm_service.sh
```
- run ada
```bash
bash scripts/run_vllm_service.sh
```