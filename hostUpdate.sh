#!/bin/bash

# 定义文件名和标记行
hosts_file="/etc/hosts"
start_marker="# fetch-github-hosts begin"
end_marker="# fetch-github-hosts end"
github_hosts_url="https://hosts.gitcdn.top/hosts.txt"

# 检查hosts文件是否存在标记行，如果不存在则追加
if ! grep -q "$start_marker" "$hosts_file" && ! grep -q "$end_marker" "$hosts_file"; then
  echo "标记行不存在，将追加到文件末尾..."
  curl $github_hosts_url >> "$hosts_file"
else
  # 如果标记行存在，则替换它们之间的内容
  echo "标记行存在，将替换之间的内容..."
  sed -i "/$start_marker/,/$end_marker/d" "$hosts_file"
  sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$hosts_file"
  # 追加新内容
  curl $github_hosts_url >> "$hosts_file"
fi

echo "已更新hosts文件。"

