<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar {
            background-color: #ffc107;
            margin-bottom: 30px;
        }

        footer {
            background: #f8f9fa;
            padding: 20px 0;
            margin-top: 50px;
            border-top: 1px solid #dee2e6;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container">
        <a class="navbar-brand fw-bold" href="/food/list">🍲 맛집뿌셔</a>
        <div class="navbar-nav">
            <a class="nav-link" href="/food/list">음식목록</a>
            <a class="nav-link" href="/food/register">음식등록</a>
            <a class="nav-link text-primary fw-bold" href="#">로그인</a>
        </div>
    </div>
</nav>