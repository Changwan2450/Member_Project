# 🚀 Member Full-Stack Service

## Tech Stack
![Java](https://img.shields.io/badge/Java-007396?style=flat&logo=java&logoColor=white) 
![Spring](https://img.shields.io/badge/Spring-6DB33F?style=flat&logo=spring&logoColor=white) 
![MyBatis](https://img.shields.io/badge/MyBatis-3E8EB8?style=flat&logo=python&logoColor=white) 
![Oracle](https://img.shields.io/badge/Oracle-F80000?style=flat&logo=oracle&logoColor=white) 
![JSP](https://img.shields.io/badge/JSP-2CA5E0?style=flat&logo=apache&logoColor=white) 

## Controller 역할 구분

| 유형           | 설명                             | 예제                          |
|----------------|----------------------------------|-------------------------------|
| 일반 Controller | JSP로 화면을 렌더링하는 역할       | `OrderController.java`        |
| RestController   | JSON 형식으로 데이터 응답하는 역할 | `RestOrderController.java`    |

## 프로젝트 구조
```
./src                           # 소스 코드
├── main                       # 메인 소스
│   ├── java                   # 자바 소스
│   │   └── com                # 패키지
│   │       └── kh             # 프로젝트 하위
│   │           └── member_project
│   │               ├── controller
│   │               ├── domain
│   │               ├── mapper
│   │               └── service
│   └── resources              # 리소스 파일
└── test                       # 테스트 코드
```

## 설정 (pom.xml)
- Spring Boot 3.4.1
- Java 17
- WAR 패키징 방식으로 배포

## Dependencies
- Spring Boot Starter Web
- MyBatis Spring Boot Starter
- Oracle JDBC Driver
- Lombok, DevTools, Tomcat, JSP API 등

테스트 할 준비 완료!
