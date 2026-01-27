<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JOIN - 맛집관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #fcfcfc;
            font-family: 'Pretendard', -apple-system, sans-serif;
        }

        .reg-wrapper {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 0;
        }

        .reg-card {
            width: 100%;
            max-width: 450px;
            border: none;
            border-radius: 24px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .reg-header {
            background-color: #FFC107;
            padding: 40px 20px;
            text-align: center;
        }

        .reg-header h2 {
            font-weight: 900;
            color: #000;
            margin: 0;
            letter-spacing: -1.5px;
        }

        .reg-body {
            background: white;
            padding: 40px;
        }

        .form-label {
            font-weight: 700;
            font-size: 0.85rem;
            color: #555;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .form-control {
            border-radius: 12px;
            padding: 12px 16px;
            border: 1px solid #eee;
            background-color: #fbfbfb;
            transition: 0.3s;
        }

        .form-control:focus {
            box-shadow: 0 0 0 4px rgba(255, 193, 7, 0.1);
            border-color: #FFC107;
            background-color: #fff;
        }

        .btn-join {
            background-color: #212529;
            color: white;
            border: none;
            border-radius: 12px;
            padding: 14px;
            font-weight: 800;
            width: 100%;
            margin-top: 10px;
            transition: 0.3s;
        }

        .btn-join:hover {
            background-color: #000;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .reg-footer {
            text-align: center;
            padding: 25px;
            background-color: #f8f9fa;
            border-top: 1px solid #eee;
        }

        .reg-footer a {
            color: #FFC107;
            text-decoration: none;
            font-weight: 700;
        }

        /* 에러 알림창 스타일 */
        .alert-error {
            background-color: #fff5f5;
            color: #e03131;
            border: none;
            border-radius: 12px;
            font-size: 0.85rem;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="reg-wrapper">
    <div class="reg-card">
        <div class="reg-header">
            <h2>START JOURNEY</h2>
            <p class="mb-0 small text-dark opacity-75 fw-bold">형의 맛집 리스트를 만들어봐!</p>
        </div>

        <div class="reg-body">
            <%-- 🎯 형이 만든 'admin' 차단 로직 대응 메시지 --%>
            <c:if test="${param.error eq 'reserved'}">
                <div class="alert alert-error p-3 text-center mb-4">
                    <i class="bi bi-shield-lock-fill"></i> 'admin'은 사용할 수 없는 아이디야 형!
                </div>
            </c:if>

            <form action="/member/register" method="post">
                <div class="mb-3">
                    <label class="form-label">ID</label>
                    <input type="text" name="id" class="form-control" placeholder="아이디를 입력해줘" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="pw" class="form-control" placeholder="••••••••" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해줘" required>
                </div>
                <div class="mb-4">
                    <label class="form-label">Age</label>
                    <input type="number" name="age" class="form-control" placeholder="나이를 입력해줘" required>
                </div>

                <button type="submit" class="btn-join">가입하고 바로 시작하기</button>
            </form>
        </div>

        <div class="reg-footer">
            <span class="text-muted small fw-bold">이미 회원이신가요?</span>
            <a href="/member/login" class="ms-2 small">로그인하러 가기</a>
        </div>
    </div>
</div>

</body>
</html>