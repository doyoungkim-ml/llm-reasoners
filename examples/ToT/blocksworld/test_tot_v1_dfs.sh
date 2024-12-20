
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
export llama_path="meta-llama/Meta-Llama-3-8B" # or "your/path/to/llama2"
export llama_size="8B" # or "7B" of llama2
export base_lm="llama3" # or "llama2"
export VAL="LLMs-Planning/planner_tools/VAL"

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_2_data.json'  --depth_limit 2 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step2_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_4_data.json'  --depth_limit 4 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step4_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_6_data.json'  --depth_limit 6 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step6_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_8_data.json'  --depth_limit 8 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step8_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_10_data.json' --depth_limit 10 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step10_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size

python -m torch.distributed.run --nproc_per_node 8 examples/ToT/blocksworld/tot_inference.py --base_lm $base_lm --data_path 'examples/CoT/blocksworld/data/split_v1/split_v1_step_12_data.json' --depth_limit 12 --model_dir $llama_path --prompt_path examples/CoT/blocksworld/prompts/pool_prompt_v1.json --log_dir logs/dfs_v1_step12_r --temperature 0.8 --search_algo dfs --total_states 10 --max_per_state 3 --llama_size $llama_size


