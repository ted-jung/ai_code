#!/bin/bash
set -e

echo "==> [1/3] Pytest 단위 테스트 실행 중..."
pytest

echo "==> [2/3] Docker Compose 빌드 및 실행 중..."
docker compose down --volumes --remove-orphans
docker compose build --no-cache
docker compose up -d

echo "==> [3/3] 서비스 헬스체크(Health Check) 수행 중..."
sleep 3 # 서버 기동 대기
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000/docs)

if [ "$STATUS_CODE" -eq 200 ]; then
    echo "==> 성공: 애플리케이션이 정상적으로 배포 및 작동 중입니다!"
    docker compose down
    exit 0
else
    echo "==> 실패: 서비스 응답 코드가 비정상입니다 ($STATUS_CODE)."
    docker compose down
    exit 1
fi