# 프로젝트 구조

```
./src
./src/main
./src/main/java
./src/main/java/com
./src/main/java/com/kh
./src/main/java/com/kh/member_project
./src/main/java/com/kh/member_project/controller
./src/main/java/com/kh/member_project/controller/api
./src/main/java/com/kh/member_project/domain
./src/main/java/com/kh/member_project/mapper
./src/main/java/com/kh/member_project/service
./src/main/java/com/kh/member_project/service/BoardService
./src/main/java/com/kh/member_project/service/FoodService
./src/main/java/com/kh/member_project/service/MemberService
./src/main/java/com/kh/member_project/service/OrderService
./src/main/resources
./src/main/resources/mapper
./src/main/webapp
./src/main/webapp/WEB-INF
./src/main/webapp/WEB-INF/views
```

## 중요 파일

- `./pom.xml`: Maven 프로젝트 설정
- `./HELP.md`: 도움말
- `./README.md`: 프로젝트 설명서
- `./mvnw`, `./mvnw.cmd`: Maven Wrapper

## 컨트롤러 구조

### 일반 컨트롤러
- **OrderController**: 주문 처리 관련.
- **BoardController**: 게시판 관련.
- **FoodController**: 음식 관련.
- **MemberController**: 사용자 관련.

### REST API 컨트롤러
- **RestOrderController**: 주문 관련 JSON 응답.
- **RestBoardController**: 게시판 JSON 응답.
- **RestFoodController**: 음식 JSON 응답.
- **RestMemberController**: 사용자 JSON 응답.

## 의존성

- Jakarta Servlet
- Lombok
- Spring Framework
- MyBatis

## CORS 설정

모든 API에서 외부 접속 허용. 아이패드와 리액트 애플리케이션 통신을 위한 설정 포함.
