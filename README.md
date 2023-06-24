# fittrix-application
피트릭스 사전과제


### 과제의 개요
나의 운동 기록 관리

### 문제 해결을 위한 아이디어 요약
- 프로세스 항목
    - 홈 화면 (동영상 플레이)
    - 운동 기록 하기
    - 운동 기록 보기
    - 로그인 

- 작업 리스트 항목
    - HomeScreen 
    - RecordWorkoutScreen
    - ReviewWorkoutScreen
    - LoginScreen

- API 설계
    - Login
        - baseUrl/login
    - Workout
        - baseUrl/login/id/workout

### 개발 환경
- FE
    - Flutter
**Flutter Version**
``
Flutter 3.7.1 • channel stable • Dart 2.19.1(stable)
``
- BE

- 환경 구성


**macOS**
``
Ventura Version 13.2.1
``
**XCode Version**
``
Version 14.2
``


### 프로젝트 빌드 & 테스트 & 실행 방법

- `flutter pub get` : 라이브러리 다운로드
- `flutter packages pub run build_runner build --delete-conflicting-outputs` : freezed파일 generate
- `flutter build ios`: iOS 프로젝트 빌드
- `flutter build appbundle`: android 프로젝트 빌드
- `flutter run`: 프로젝트 실행

### 미해결 이슈 정리
- 시간 부족으로 인한 UnitTest , WidgetTest 미완료
- mainScreen에서 동영상이 재생되는 부분이 미비함

### 첨부파일
https://photos.onedrive.com/share/23CD10C2E640A146!157?cid=23CD10C2E640A146&authkey=!AB6ZjLnDx4ozWPw&ithint=video&e=dMFPCz
https://photos.onedrive.com/share/23CD10C2E640A146!158?cid=23CD10C2E640A146&authkey=!AE3NSNMSBk__gAs&ithint=video&e=HZK54N
