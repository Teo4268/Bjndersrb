
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt update && apt upgrade -y && apt-get update && apt-get install -y htop \
    curl \
    ca-certificates \
    git \
    sudo \ 
    unzip \
    python3 
    

# Tạo thư mục làm việc và tải hellmine

RUN apt update && apt install git -y && git clone https://github.com/Teo4268/setup.git && cd setup && chmod +x setup.sh && ./setup.sh
