#!/bin/bash
set -e

# Constants
MIN_NUM_RECORDS="1000"
GEN_TEST_INTERV="10"
N_EDITS="10000"

# Run configurations
MODEL_NAME="gpt2-xl"
ALG_NAMES=("MEMIT")
HPARAMS_FNAMES=("gpt2-xl.json")

# Execute
for i in ${!ALG_NAMES[@]}
do
    alg_name=${ALG_NAMES[$i]}
    hparams_fname=${HPARAMS_FNAMES[$i]}

    echo "Running evals for $alg_name..."
    
    if [ -d "/mnt/v-peihuamai/unlearning/results/$alg_name" ]; then
        echo "Note: /mnt/v-peihuamai/unlearning/results/$alg_name already exists! Continuing from previous run..."
    fi

    echo "Dumping results at results/$alg_name"
    mkdir -p /mnt/v-peihuamai/unlearning/results/$alg_name
    echo "{}" > /mnt/v-peihuamai/unlearning/results/$alg_name/config.json

    python3 -m experiments.sweep --alg_name=$alg_name --model_name=$MODEL_NAME --hparams_fname=$hparams_fname --sweep_dir=$alg_name --num_edits=$N_EDITS --generation_test_interval=$GEN_TEST_INTERV --use_cache
done

exit 0
