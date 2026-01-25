<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-primary text-white py-3">
                    <h4 class="mb-0">${member.name}님의 정보</h4>
                </div>
                <div class="card-body p-4">
                    <form action="/member/update" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">아이디</label>
                            <input type="text" name="id" class="form-control bg-light" value="${member.id}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">비밀번호</label>
                            <input type="password" name="pw" class="form-control" value="${member.pw}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">이름</label>
                            <input type="text" name="name" class="form-control" value="${member.name}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">나이</label>
                            <input type="number" name="age" class="form-control" value="${member.age}" required>
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                            <a href="/member/list" class="btn btn-outline-secondary">목록으로</a>
                            <button type="submit" class="btn btn-success">정보 수정</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>