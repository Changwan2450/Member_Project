# 🚀 Member Full-Stack Service

## Tech Stack
![Java](https://img.shields.io/badge/java-007396?style=flat-square&logo=java&logoColor=white) 
![Spring](https://img.shields.io/badge/spring-6DB33F?style=flat-square&logo=spring&logoColor=white) 
![MyBatis](https://img.shields.io/badge/mybatis-119B54?style=flat-square&logo=mybatis&logoColor=white) 
![Oracle](https://img.shields.io/badge/oracle-F80000?style=flat-square&logo=oracle&logoColor=white) 
![JSP](https://img.shields.io/badge/jsp-FB5C5C?style=flat-square&logo=java&logoColor=white) 

## 주요 역할 구분

| Controller             | 역할                                         |
|------------------------|--------------------------------------------|
| OrderController        | 주문 관련 JSP 포워딩 처리                 |
| BoardController        | 게시판 관련 JSP 포워딩 처리                |
| FoodController         | 음식 관련 JSP 포워딩 처리                  |
| MemberController       | 회원 관련 JSP 포워딩 처리                  |
| RestOrderController     | 주문 관련 JSON 응답 처리                  |
| RestBoardController      | 게시판 관련 JSON 응답 처리                |
| RestFoodController       | 음식 관련 JSON 응답 처리                  |
| RestMemberController     | 회원 관련 JSON 응답 처리                   |

## 프로젝트 빌드 및 실행
- **Maven**을 사용하여 프로젝트 관리. 
- `mvnw` 또는 `mvn` 명령어로 빌드 및 실행 가능.
- 필요 시 `pom.xml`에서 의존성 추가하거나 수정하여 기능 확장 가능.

## 디렉토리 구조
```
.
├── mvnw.cmd
├── target
├── pom.xml
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── kh
│   │   │           └── member_project
│   │   ├── resources
│   │   └── webapp
└── README.md
``` 

### 프로젝트 설정
- Spring Boot 3.4.1 기반.
- Java 17 사용.
- MyBatis와 JDBC로 데이터베이스 연동 가능.
