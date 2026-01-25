<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow border-0">
        <div class="card-body">
            <h2 class="mb-4">회원 목록</h2>
            <table class="table table-hover align-middle">
                <thead class="table-dark">
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>나이</th>
                    <th class="text-center">관리</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="m">
                    <tr>
                        <td><a href="/member/read?id=${m.id}" class="fw-bold text-decoration-none">${m.id}</a></td>
                        <td>${m.name}</td>
                        <td><span class="badge bg-secondary">${m.age}세</span></td>
                        <td class="text-center"><a href="/member/read?id=${m.id}"
                                                   class="btn btn-outline-warning btn-sm me-1">수정</a>

                            <form action="/member/delete" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${m.id}">
                                <button type="submit" class="btn btn-outline-danger btn-sm"
                                        onclick="return confirm('진짜 삭제함?')">삭제
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="/member/register" class="btn btn-outline-primary">추가 등록</a>
        </div>
    </div>
</div>
</body>
</html>