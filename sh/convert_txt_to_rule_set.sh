#!/bin/bash

# 检查是否提供了文件路径
if [ -z "$1" ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

# 获取输入文件路径
input_file="$1"

# 获取输入文件目录和文件名（不包括扩展名）
input_dir=$(dirname "$input_file")
input_filename=$(basename "$input_file")
input_basename="${input_filename%.*}"

# 创建输出目录
output_dir="${input_dir}/list"
mkdir -p "$output_dir"

# 生成新的文件路径，保留原文件名但后缀改为 .list
output_file="${output_dir}/${input_basename}.list"

# 处理文件，在每行开头插入 "DOMAIN-SUFFIX," 并保存到新文件
sed 's/^/DOMAIN-SUFFIX,/' "$input_file" > "$output_file"

echo "Processed file saved to: $output_file"
