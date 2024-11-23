# split_json.py
import json
import sys
import math

def split_json_file(input_file, num_splits):
    with open(input_file, 'r') as f:
        data = json.load(f)
    
    items_per_split = math.ceil(len(data) / num_splits)
    
    for i in range(num_splits):
        start_idx = i * items_per_split
        end_idx = min((i + 1) * items_per_split, len(data))
        split_data = data[start_idx:end_idx]
        
        with open(f'split_data_{i}.json', 'w') as f:
            json.dump(split_data, f)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: split_json.py <input_file> <num_splits>')
        sys.exit(1)
    
    input_file = sys.argv[1]
    num_splits = int(sys.argv[2])
    
    split_json_file(input_file, num_splits)