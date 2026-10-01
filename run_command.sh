#!/usr/bin/env bash
set -euo pipefail

# Run from the upstream llm-attacks/experiments directory.
export WANDB_MODE=disabled
export OMP_NUM_THREADS=1

mkdir -p results

python -u main.py \
  --config=configs/individual_vicuna.py \
  --config.attack=gcg \
  --config.train_data=../data/advbench/harmful_behaviors.csv \
  --config.result_prefix=results/vicuna7b_alg1_500steps \
  --config.n_train_data=1 \
  --config.data_offset=0 \
  --config.n_steps=500 \
  --config.test_steps=50 \
  --config.batch_size=16 \
  --config.topk=256 \
  2>&1 | tee results/vicuna7b_alg1_500steps_console.log
