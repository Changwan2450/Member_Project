<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    .navbar {
        background-color: #f8f9fa;
        border-bottom: 2px solid #dee2e6;
        padding: 15px 0;
    }

    .navbar-brand {
        font-weight: bold;
        color: #333;
        font-size: 1.5rem;
        text-decoration: none;
    }

    .custom-btn {
        text-decoration: none;
        color: #555;
        font-weight: 500;
        padding: 8px 15px;
        margin-right: 5px;
        border-radius: 5px;
        transition: 0.3s;
    }

    .custom-btn:hover {
        background-color: #e9ecef;
        color: #000;
    }

    .admin-underline {
        border-bottom: 2px solid #dc3545;
        color: #dc3545 !important;
    }

    .user-info {
        margin-right: 10px;
        font-weight: bold;
        color: #0d6efd;
    }

    .logout-link {
        text-decoration: none;
        color: #6c757d;
        font-size: 0.9rem;
        margin-left: 10px;
    }
</style>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="/food/list">🛠️ 가게메뉴 관리시스템</a>

        <div class="nav-group ms-auto d-flex align-items-center">
            <a href="/food/list" class="custom-btn">음식목록</a>

            <c:choose>
                <%-- 로그인 했을 때 --%>
                <c:when test="${not empty sessionScope.loginUser}">
                    <a href="/order/list" class="custom-btn">주문내역</a>
                    <a href="/board/list" class="custom-btn">자유게시판</a>

                    <a href="/food/register" class="custom-btn">음식등록</a>

                    <c:if test="${sessionScope.loginUser.id eq 'admin' || sessionScope.loginUser.id eq 'ADMIN'}">
                        <a href="/member/list" class="custom-btn admin-underline">Member 관리</a>
                    </c:if>

                    <span class="user-info ms-3">👤 ${sessionScope.loginUser.name}님</span>
                    <a href="/member/logout" class="logout-link">로그아웃</a>
                </c:when>

                <%-- 로그인 안 했을 때 --%>
                <c:otherwise>
                    <a href="/member/login" class="custom-btn">로그인</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</nav>