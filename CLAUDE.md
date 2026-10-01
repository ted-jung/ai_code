# Project Harness Configuration

## Tech Stack
- Python FastAPI (또는 Node.js / Next.js 선택)
- Docker & Docker Compose

## Core Rules for AI Agent
1. **Modularity**: 코드는 단일 책임 원칙에 따라 작게 분리할 것.
2. **Error Handling**: 모든 API 엔드포인트와 비즈니스 로직에는 명확한 예외 처리(`try-except` 또는 커스텀 에러)를 포함할 것.
3. **Verification**: 코드를 수정한 후에는 반드시 지정된 테스트 및 도커 빌드 검증 스크립트를 실행할 것.

## Available Commands
- Test: `pytest`
- Docker Build & Run: `docker compose up --build -d`
- Verification Script: `./scripts/verify.sh`