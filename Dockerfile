# Sử dụng Ubuntu làm base image
FROM ubuntu:20.04

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* && lscpu

# Tải xuống, giải nén và chạy miner trong quá trình build
