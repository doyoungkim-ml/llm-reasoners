#!/bin/bash

export llama_path="meta-llama/Meta-Llama-3-8B"
export llama_size="8B"
export base_lm="llama3"
export VAL="LLMs-Planning/planner_tools/VAL"

# Convert comma-separated GPU list to array
IFS=',' read -ra GPU_ARRAY <<< "0,1,2,3,4,5,6,7"
NUM_GPUS=${#GPU_ARRAY[@]}

# Split input JSON
python split_json.py examples/CoT/blocksworld/data/split_v1/split_v1_step_2_data.json $NUM_GPUS
# Launch process on each GPU in parallel
for i in "${!GPU_ARRAY[@]}"; do
    CUDA_VISIBLE_DEVICES=${GPU_ARRAY[$i]} python examples/ToT/blocksworld/tot_inference.py \
        --base_lm $base_lm \
        --data_path "split_data_${i}.json" \
        --depth_limit 2 \
        --model_dir $llama_path \
        --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json \
        --log_dir logs/bfs_v1_step2_r_$i \
        --beam_size 10 \
        --temperature 0.8 \
        --search_algo beam \
        --reward_aggregator mean \
        --llama_size $llama_size &
done

# Wait for all background processes to complete
wait

# Combine logs
cat logs/bfs_v1_step2_r_*/ > logs/bfs_v1_step2_combined.log

# Cleanup split files
rm split_data_*.json




# Split input JSON
python split_json.py examples/CoT/blocksworld/data/split_v1/split_v1_step_4_data.json $NUM_GPUS
# Launch process on each GPU in parallel
for i in "${!GPU_ARRAY[@]}"; do
    CUDA_VISIBLE_DEVICES=${GPU_ARRAY[$i]} python examples/ToT/blocksworld/tot_inference.py \
        --base_lm $base_lm \
        --data_path "split_data_${i}.json" \
        --depth_limit 2 \
        --model_dir $llama_path \
        --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json \
        --log_dir logs/bfs_v1_step4_r_$i \
        --beam_size 10 \
        --temperature 0.8 \
        --search_algo beam \
        --reward_aggregator mean \
        --llama_size $llama_size &
done

# Wait for all background processes to complete
wait

# Combine logs
cat logs/bfs_v1_step4_r_* > logs/bfs_v1_step4_combined.log

# Cleanup split files
rm split_data_*.json


# Split input JSON
python split_json.py examples/CoT/blocksworld/data/split_v1/split_v1_step_6_data.json $NUM_GPUS
# Launch process on each GPU in parallel
for i in "${!GPU_ARRAY[@]}"; do
    CUDA_VISIBLE_DEVICES=${GPU_ARRAY[$i]} python examples/ToT/blocksworld/tot_inference.py \
        --base_lm $base_lm \
        --data_path "split_data_${i}.json" \
        --depth_limit 2 \
        --model_dir $llama_path \
        --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json \
        --log_dir logs/bfs_v1_step6_r_$i \
        --beam_size 10 \
        --temperature 0.8 \
        --search_algo beam \
        --reward_aggregator mean \
        --llama_size $llama_size &
done

# Wait for all background processes to complete
wait

# Combine logs
cat logs/bfs_v1_step6_r_* > logs/bfs_v1_step6_combined.log

# Cleanup split files
rm split_data_*.json