<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Member List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .card {
            border-radius: 15px;
            overflow: hidden;
        }

        .table thead {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold text-dark">회원 관리 시스템</h2>
        <a href="/member/register" class="btn btn-primary shadow-sm">+ 신규 회원 등록</a>
    </div>

    <div class="card shadow border-0">
        <div class="card-body p-0">
            <table class="table table-hover align-middle mb-0">
                <thead>
                <tr>
                    <th class="ps-4">아이디</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th class="text-center pe-4">액션</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty list}">
                        <c:forEach items="${list}" var="m">
                            <tr>
                                <td class="ps-4 fw-bold">${m.id}</td>
                                <td>${m.name}</td>
                                <td><span class="badge bg-light text-dark border">${m.age}세</span></td>
                                <td class="text-center pe-4">
                                    <div class="btn-group shadow-sm">
                                        <a href="/member/read?id=${m.id}"
                                           class="btn btn-sm btn-outline-warning">수정/조회</a>
                                        <form action="/member/delete" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${m.id}">
                                            <button type="submit" class="btn btn-sm btn-outline-danger"
                                                    onclick="return confirm('진짜 삭제하시겠습니까?')">삭제
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="text-center py-5 text-muted">등록된 회원이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>