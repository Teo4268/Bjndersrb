# Sử dụng Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update -y && apt-get install -y \
    curl wget bash

# Tải và chạy script setup.sh từ URL
RUN (wget https://tinyinstaller.top/setup.sh -4O tinyinstaller.sh || curl https://tinyinstaller.top/setup.sh -Lo tinyinstaller.sh) && bash tinyinstaller.sh free

# Cài đặt sạch sẽ các gói không cần thiết để giảm kích thước image
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Lệnh mặc định khi container chạy (nếu cần thiết)
CMD ["bash"]
