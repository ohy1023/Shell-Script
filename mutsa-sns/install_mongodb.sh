#!/bin/bash

# MongoDB 설치 스크립트 for Ubuntu 22.04
# 설명: MongoDB 7.0을 설치하고 서비스 실행까지 자동화

set -e  # 오류 발생 시 즉시 종료

echo "1. MongoDB GPG 키 추가"
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg

echo "2. MongoDB 저장소 추가"
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

echo "3. 패키지 목록 업데이트"
sudo apt update

echo "4. MongoDB 패키지 설치"
sudo apt install -y mongodb-org

echo "5. MongoDB 서비스 시작 및 활성화"
sudo systemctl start mongod
sudo systemctl enable mongod

echo "6. 서비스 상태 확인"
sudo systemctl status mongod --no-pager

echo "MongoDB 설치 완료! 버전 확인:"
mongod --version
