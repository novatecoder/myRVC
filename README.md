# myRVC

## 프로젝트 설명
myRVC 프로젝트는 노래 파일에서 MR을 제거하고, RVC 모델을 사용하여 AI 커버곡을 생성하는 기능을 포함합니다.

## 디렉토리 구조
```
myRVC/
│
├── resources/          # 리소스 파일을 저장하는 폴더
│
├── tests/              # 테스트 파일을 저장하는 폴더
│   ├── __init__.py     # 패키지 초기화 파일
│   └── test_mr_removal.py  # MR 제거 기능 테스트 코드
│   └── test_ai_cover.py    # AI 커버곡 생성 기능 테스트 코드
│
├── src/                # 소스 코드 폴더
│   ├── __init__.py     # 패키지 초기화 파일
│   ├── mr_removal.py   # MR 제거 기능 구현 코드
│   ├── ai_cover.py     # RVC 모델을 사용한 AI 커버곡 생성 코드
│   └── utils/          # 유틸리티 함수 폴더
│       ├── __init__.py # 패키지 초기화 파일
│       ├── rvc_utils.py    # RVC 관련 유틸리티 함수 구현 코드
│       └── mr_removal_utils.py # MR 제거 관련 유틸리티 함수 구현 코드
│
├── README.md           # 프로젝트 설명 파일
│
├── requirements.txt    # 필요한 패키지 목록
│
└── setup.py            # 패키지 및 배포 설정 (필요시)
```

## 설치 방법
```bash
pip install -r requirements.txt
```

## 사용 방법
### MR 제거 기능
```python
from src.mr_removal import remove_mr

# 사용 예시
remove_mr('input_file_path', 'output_file_path')
```

### AI 커버곡 생성 기능
```python
from src.ai_cover import generate_cover

# 사용 예시
generate_cover('input_song_path', 'output_cover_path')
```

## 테스트
```bash
pytest tests/
```
