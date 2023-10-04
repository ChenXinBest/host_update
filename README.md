# host_update
从网上获取github的ddns记录，并写入到hosts文件

# 运行脚本
```bash
bash /path/to/hostUpdate.sh
```

# 设置定时脚本
```bash
crontab -e

# 每小时运行一次
0 * * * * bash /path/to/hostUpdate.sh
```
