## Run
For llama2
```bash
CUDA_VISIBLE_DEVICES=0 python examples/cot/AQuA_cot/inference.py --base_lm llama2 --model_dir your/path/to/llama --llama_size "7B"   --batch_size 1  --temperature 0   #| tee cot_log.log
```
For exllama
```bash
CUDA_VISIBLE_DEVICES=0,1 python examples/cot/AQuA_cot/inference.py --base_lm exllama --model_dir your/path/to/llama --lora_dir None --mem_map '[16,22]' --temperature 0  #| tee cot_log.log
```
