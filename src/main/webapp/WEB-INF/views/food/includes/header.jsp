<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 옐로우 & 블랙 테마 유지 */
        .navbar {
            background-color: #FFC107 !important;
            border-bottom: 3px solid #000;
            padding: 12px 0;
        }

        .navbar-brand {
            font-weight: 900;
            color: #000 !important;
            font-size: 1.5rem;
            text-decoration: none;
        }

        .nav-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        /* 모든 버튼 디자인 통일 */
        .custom-btn {
            height: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 20px;
            background: #fff;
            color: #000 !important;
            border: 2px solid #000;
            border-radius: 8px;
            font-weight: 800;
            font-size: 0.95rem;
            text-decoration: none !important;
            transition: 0.2s;
        }

        .custom-btn:hover {
            background: #000;
            color: #fff !important;
            transform: translateY(-2px);
        }

        /* 🎯 [포인트] 관리자 메뉴만 두꺼운 밑줄 추가 */
        .admin-underline {
            border-bottom: 5px solid #000 !important; /* 아래쪽 테두리만 더 두껍게 */
            background-color: #f8f9fa; /* 미세하게 다른 배경색으로 구분 */
        }

        .user-info {
            font-weight: 700;
            color: #000;
            margin-left: 15px;
            font-size: 0.9rem;
        }

        .logout-link {
            color: #d63031 !important;
            font-weight: 800;
            font-size: 0.85rem;
            margin-left: 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="/food/list">🛠️ 가게메뉴 관리시스템</a>

        <div class="nav-group ms-auto">
            <a href="/food/list" class="custom-btn">음식목록</a>
            <a href="/food/register" class="custom-btn">음식등록</a>

            <%-- 🎯 Member 관리 버튼에만 .admin-underline 클래스 적용 --%>
            <c:if test="${loginUser.id eq 'admin' || sessionScope.loginUser.id eq 'admin'}">
                <a href="/member/list" class="custom-btn admin-underline">Member 관리</a>
            </c:if>

            <c:choose>
                <c:when test="${not empty loginUser || not empty sessionScope.loginUser}">
                    <span class="user-info">👤 ${loginUser.name}님</span>
                    <a href="/member/logout" class="logout-link">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="/member/login" class="custom-btn">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>