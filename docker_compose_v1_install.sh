# docker-compose 설치
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# docker-compose 권한변경
sudo chmod +x /usr/local/bin/docker-compose

# 선택 사항 : PermissionError: [Errno 13] Permission denied 발생하면 적어주세요.
sudo chmod 666 /var/run/docker.sock
