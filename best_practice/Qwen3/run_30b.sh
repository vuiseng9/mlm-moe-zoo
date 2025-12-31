# Cluster variables
export CONTAINER_IMAGE=mcoremoe-b200:latest
export ACCOUNT=acc
export MEGATRON_PATH=/root/work/dev/mcoremoe/megatron-lm
export PARTITION=partition
export RUN_NAME="${MODEL}-benchmarking"
export CONTAINER_MOUNTS=container
export CLUSTER=template

# Model selection parameters
export MODEL=Qwen3-30B-A3B
export WANDB_PROJECT=mcoremoe
export OUTPUT_PATH=/root/work/run/todelete

# # Training parameters
export PROFILE=0 # whether to profile the model with nsys profile
export PRETRAIN=0 # whether train the model from scratch
export MBS=1
export SEQ_LEN=4096
export MOE_GROUPED_GEMM=true

export RUN_TIME=00:30:00
export COMMENT=baseline

# EP + DP solution
# PP=1 VPP=1 TP=1 EP=8 NNODES=4 bash ./sbatch_benchmarking.sh --moe-router-force-load-balancing

# EP + full recompute solution
# COMMENT="full_recompute" PP=1 VPP=1 TP=1 EP=8 MBS=4 NNODES=4 bash ./sbatch_benchmarking.sh --moe-router-force-load-balancing --recompute-granularity full --recompute-method uniform --recompute-num-layers 1

# config for 1x8 B200 nodes
DRY_RUN=1 PP=1 TP=1 EP=8 MBS=4 NNODES=1 bash ./sbatch_benchmarking.sh --moe-router-force-load-balancing --recompute-granularity selective --recompute-modules moe_act layernorm
