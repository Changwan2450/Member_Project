# 🚀 Member Full-Stack Service

## Tech Stack
| ![Java](https://img.shields.io/badge/Java-007396?style=flat-square&logo=java&logoColor=white) | ![Spring](https://img.shields.io/badge/Spring-6DB33F?style=flat-square&logo=spring&logoColor=white) | ![MyBatis](https://img.shields.io/badge/MyBatis-4D9D57?style=flat-square&logo=mybatis&logoColor=white) | ![Oracle](https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white) | ![JSP](https://img.shields.io/badge/JSP-6DB33F?style=flat-square&logo=java&logoColor=white) |
|:-------------------------------------------------------:|:-------------------------------------------------|:---------------------------------------------------:|:--------------------------------------------------:|:------------------------------------------------:|

## Controller Types

| Type            | Purpose                                  | Example Controllers                                   |
|------------------|------------------------------------------|------------------------------------------------------|
| 일반 Controller  | JSP 페이지 포워딩                       | `OrderController`, `BoardController`, `FoodController`, `MemberController` |
| RestController    | JSON 응답 처리                           | `RestOrderController`, `RestBoardController`, `RestFoodController`, `RestMemberController` | 

## Project Structure
```
./src
├── main
│   ├── java
│   │   └── com
│   │       └── kh
│   │           └── member_project
│   │               ├── controller
│   │               ├── domain
│   │               ├── service
│   │               └── mapper
│   └── resources
│       └── mapper
└── test
```

## Maven Configuration
- **Spring Boot Version**: 3.4.1
- **Java Version**: 17
- **Packaging**: WAR
- **Dependencies**: Spring Boot, MyBatis, Oracle JDBC, Lombok 등

이 프로젝트는 Spring Boot와 MyBatis를 기반으로 한 멤버 서비스입니다. REST API와 JSP 포워딩을 활용해 다양한 기능을 제공합니다.
