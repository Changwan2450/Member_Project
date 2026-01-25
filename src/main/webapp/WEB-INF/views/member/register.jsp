<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .register-container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center">
    <div class="register-container">
        <h2 class="text-center mb-4">회원가입</h2>
        <form action="/member/register" method="post">
            <div class="mb-3">
                <label class="form-label">아이디</label>
                <input type="text" name="id" class="form-control" placeholder="ID를 입력하세요" required>
            </div>
            <div class="mb-3">
                <label class="form-label">비밀번호</label>
                <input type="password" name="pw" class="form-control" placeholder="Password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">이름</label>
                <input type="text" name="name" class="form-control" placeholder="이름을 입력하세요" required>
            </div>
            <div class="mb-3">
                <label class="form-label">나이</label>
                <input type="number" name="age" class="form-control" placeholder="나이">
            </div>
            <button type="submit" class="btn btn-primary w-100 py-2">가입하기</button>
        </form>
    </div>
</div>
</body>
</html>