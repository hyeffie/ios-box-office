# 박스 오피스 iOS 앱 개발

> 2024.02 - 2024.03 (5주)
> 
- SeSAC x 맛있는코드 부트캠프 토이 프로젝트 (2인 1조)
- Repository: https://github.com/earths-voluble/ios-box-office

## 🍄‍🟫 스크린샷

![screenshot-2024-07-25.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/c1fc0342-5097-4f91-9792-88ded7b2afed/a2434cce-7fd2-44f0-a1db-c7251e66f696/screenshot-2024-07-25.png)

## 🍄‍🟫 개요

- 영화진흥위원회 `open API`를 사용해 일별 박스 오피스 및 영화 상세 정보를 조회하는 앱
- `Clean Architecture`의 계층 구조 아이디어와 `MVVM + Input / Output` 패턴을 적용한 설계
- 네트워킹 등 비동기 상황에 Swift Concurrecy(`async-await`) 적용한 이벤트 흐름 구현

## 🍄‍🟫 사용 기술

- UIKit
- Clean Architecture
- Swift Concurrency (async-await)

## 🍄‍🟫 프로젝트 구조

### 주요 계층 및 이벤트 처리 흐름

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/c1fc0342-5097-4f91-9792-88ded7b2afed/dd2628c1-bcf3-49c9-b840-badb56d98aed/Untitled.png)

- `View - ViewController - UseCase - Repository - Network` 의 계층으로 구성
- async-await 도입으로 호출 후 결과를 `리턴`받을 수 있도록 구현
- ViewModel이 결과를 리턴받으면 delegte 형태로 view controller(BoxOfficeOutput)를 참조해서 호출

## 🍄‍🟫 주요 문제 해결 경험

### Swift Concurrency 도입

- 문제와 원인
    - 이전 프로젝트에서 네트워킹 등 비동기 코드를 구현할 때 GCD 등 call back closure를 사용하는 방식의 문제점을 경험
- 대안 비교와 도입
    - 비동기 호출의 결과를 리턴 받아 처리할 수 있는 단순한 처리 흐름을 구현하기 위해 swift concurrency 도입 결정
    - 비동기 코드를 트리거 하는 ViewModel 부터 실제 API 호출 계층까지의 호출 체인에 도입
- 평가
    - await으로 호출한 코드에 대한 결과를 대기 후 리턴받을 수 있어 단방향으로 참조할 수 있어 비교적 단순한 구조를 구성할 수 있었음

## 🍄‍🟫 구현 단계별 기록

### 스텝별 현업자 코드 리뷰

| 스텝 | PR |
| --- | --- |
| Step 1 | https://github.com/tasty-code/ios-box-office/pull/26 |
| Step 2 | https://github.com/tasty-code/ios-box-office/pull/41 |
| Step 3 | https://github.com/tasty-code/ios-box-office/pull/47 |