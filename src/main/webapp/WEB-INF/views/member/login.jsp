<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>LOGIN - 맛집뿌셔</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Pretendard', -apple-system, sans-serif;
        }

        /* 중앙 정렬용 컨테이너 */
        .login-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            width: 100%;
            max-width: 400px;
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        /* 형의 메인 컬러: 머스타드 옐로우 */
        .login-header {
            background-color: #FFC107;
            padding: 40px 20px;
            text-align: center;
        }

        .login-header h2 {
            font-weight: 800;
            color: #000;
            margin: 0;
            letter-spacing: -1px;
        }

        .login-body {
            background: white;
            padding: 40px 30px;
        }

        .form-label {
            font-weight: 600;
            font-size: 0.85rem;
            color: #666;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            border: 1px solid #eee;
            background-color: #fbfbfb;
            transition: 0.2s;
        }

        .form-control:focus {
            box-shadow: 0 0 0 4px rgba(255, 193, 7, 0.15);
            border-color: #FFC107;
            background-color: #fff;
        }

        .btn-login {
            background-color: #212529;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 14px;
            font-weight: 700;
            margin-top: 10px;
            transition: 0.3s;
        }

        .btn-login:hover {
            background-color: #000;
            transform: translateY(-2px);
        }

        .login-footer {
            text-align: center;
            padding: 20px;
            font-size: 0.9rem;
        }

        .login-footer a {
            color: #FFC107;
            text-decoration: none;
            font-weight: 700;
        }

        /* 에러 메시지 스타일 */
        .alert-custom {
            background-color: #fff5f5;
            color: #e03131;
            border: none;
            border-radius: 10px;
            font-size: 0.85rem;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="login-wrapper">
    <div class="login-card">
        <div class="login-header">
            <h2>Welcome Back!</h2>
            <p class="mb-0 small text-dark opacity-75">형의 맛집 리스트를 확인해봐</p>
        </div>

        <div class="login-body">
            <form action="/member/login" method="post">
                <div class="mb-3">
                    <label class="form-label text-uppercase">ID</label>
                    <input type="text" name="id" class="form-control" placeholder="아이디를 입력해줘" required>
                </div>
                <div class="mb-4">
                    <label class="form-label text-uppercase">Password</label>
                    <input type="password" name="pw" class="form-control" placeholder="••••••••" required>
                </div>

                <c:if test="${param.error eq 'y'}">
                    <div class="alert alert-custom p-3 text-center mb-4">
                        <i class="bi bi-exclamation-circle-fill"></i> 아이디나 비번이 틀렸어 형!
                    </div>
                </c:if>

                <div class="d-grid">
                    <button type="submit" class="btn btn-login">로그인 하기</button>
                </div>
            </form>
        </div>

        <div class="login-footer bg-light">
            <span class="text-muted">계정이 없으신가요?</span>
            <a href="/member/register" class="ms-2">회원가입</a>
        </div>
    </div>
</div>

</body>
</html>