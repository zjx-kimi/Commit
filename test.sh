#!/bin/bash

# 指定要写入的文件名
FILE="random.txt"

# 确保文件存在
touch "$FILE"

for j in {1..20}
do
    for i in {1..1000}
    do
        echo $i
        # 生成一个1字节的随机字符串，并使用 base64 编码
        RANDOM_STRING=$(head -c 10 /dev/urandom | base64)

        # 将随机字符串追加到文件中
        echo "$RANDOM_STRING" > "$FILE"

        # 添加文件到暂存区
        git add "$FILE"

        # 提交更改，提交信息包含当前时间和随机字符串
        git commit -m "I Will AK CSP 2024!"
        # 输出提交信息
        echo "Committed: $RANDOM_STRING"
        
    done
    git push
done