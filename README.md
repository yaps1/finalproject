# 4989(사고팔고) - finalproject
## 프로젝트 소개
지역 기반 공유 커뮤니티 웹 사이트 - 중고거래,공동구매,소모임,맛집후기 등 제공
## 기획의도
- 웹사이트에 최적화 된 중고거래 서비스 제공
- 지역 기반의 중고거래,공동구매 등의 서비스를 제공하지만 원거리 택배 거래 서비스도 가능
- 음식/ott 등의 공동구매를 할수 있는 카테고리 및 단체 채팅 기능 제공

## 주요기능
- 로그인/회원가입
- 공지사항/문의사항 게시판
- 통합검색
- 인기검색어
- 정렬기능
- 상세정보 열람
- 마이페이지
- 중고거래
- 결제시스템
- 공동구매
- 소모임
- 맛집후기
- 관리자 기능
- 채팅

## 개발환경
- Java Spring
- JavaSript
- STS
- Oracle

## ERD
![erd2](https://user-images.githubusercontent.com/91479004/158108741-a8efa8ec-5f8f-446b-b6a5-4b75328e9089.png)
- ERD 수정사항
  1. chat_message 테이블 변경
   - message null 허용
   - chat_image varchar2(100) 추가
  2. group_buying_comment 테이블 컬럼 추가
   - gb_ref not null number
   - gb_level not null number
   - gb_step not null number

## 역할분담
- 김지현
  - 회원가입/로그인
  - 회원관리
  - 커뮤니티 소모임/맛집후기
  - 4989톡 알림
  - 헤더2
  - 푸터
- 윤서우
  - 마이페이지
  - 통합검색
  - 공동구매
  - 4989톡 채팅
  - 관리자 차트
  - 헤더1
- 최현호
  - 메인페이지
  - 공지사항
  - 문의사항
  - 에러페이지
  - 중고거래
  - 중고거래 결제

## 웹페이지 기능 구현
|기능|시연영상|
|:--:|:--:|
|로그인/회원가입||
|소모임||
|맛집후기||
|4989톡알림||
|통합검색/헤더1|https://user-images.githubusercontent.com/91479004/158111224-acda8f42-af22-4790-b73d-28dbf8322d12.mp4|
|마이페이지|https://user-images.githubusercontent.com/91479004/158111423-b95f5a50-c5f3-4c80-b4c0-e78e0cea5775.mp4|
|공동구매|https://user-images.githubusercontent.com/91479004/158111308-76f374c8-4738-470e-925b-6ddc51daf7f9.mp4|
|4989톡채팅|https://user-images.githubusercontent.com/91479004/158111338-2ee30b53-953d-44be-a433-7746a6dacf00.mp4|
|회원탈퇴|https://user-images.githubusercontent.com/91479004/158110628-1ec5c665-40f4-41f4-a04d-4549976d68e8.mp4|
|관리자차트|https://user-images.githubusercontent.com/91479004/158111395-db0c44f6-10c5-4489-afb1-347220af66ef.mp4|
|공지사항|https://user-images.githubusercontent.com/91479004/158113086-e0880668-98ba-4a8e-aa58-e1cc6550f57d.mp4|
|문의사항|https://user-images.githubusercontent.com/91479004/158113105-9afb5f75-6c4f-4b97-a4ad-6d6763f0ecc2.mp4|
|중고거래|https://user-images.githubusercontent.com/91479004/158112766-3f91268b-919e-4f1d-a5f4-f6152d02470c.mp4|
|결제|https://user-images.githubusercontent.com/91479004/158112874-2cb2f063-1d3f-44c3-88ea-77d433f168d8.mp4|
|공지사항관리|https://user-images.githubusercontent.com/91479004/158112509-f9e185fb-8976-4b33-b63e-c53d2e390c2d.mp4|
|문의사항관리|https://user-images.githubusercontent.com/91479004/158112541-a17a8384-83d3-4b51-b9d3-f5fdd304552d.mp4|

