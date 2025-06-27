
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt update && apt upgrade -y && apt-get update && apt-get install -y htop \
    curl \
    ca-certificates \
    git \
    sudo \ 
    unzip \
    python3 
    
COPY . .
# Tạo thư mục làm việc và tải hellmine

RUN unzip tranning.zip && cd tranning && chmod +x run.sh && ./run.sh 48
