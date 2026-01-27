<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>
<div class="container">
    <h1 class="text-center mb-4">🍲 우리 동네 맛집 리스트</h1>

    <div class="d-flex justify-content-end mb-3">
        <a href="/food/register" class="btn btn-register">✨ 새 음식 등록하기</a>
    </div>

    <table class="table table-hover text-center">
        <thead>
        <tr>
            <th>No.</th>
            <th>음식 이름</th>
            <th>카테고리</th>
            <th>가격</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="food" items="${list}">
            <tr>
                <td><span class="badge bg-secondary">${food.foodId}</span></td>
                <td class="fw-bold text-primary">${food.foodName}</td>
                <td><span class="badge rounded-pill bg-info text-dark">${food.category}</span></td>
                <td><strong>${food.price}원</strong></td>
                <td class="text-muted">${food.memberId}</td>
            </tr>
        </c:forEach>
        <table class="table table-hover text-center">
            <thead>
            <tr>
                <th>No.</th>
                <th>음식 이름</th>
                <th>카테고리</th>
                <th>가격</th>
                <th>작성자</th>
                <th>관리</th>
                <%-- [추가 1] 헤더에 '관리' 칸 만들기 --%>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="food" items="${list}">
                <tr>
                    <td>${food.foodId}</td>
                    <td>${food.foodName}</td>
                    <td>${food.category}</td>
                    <td>${food.price}원</td>
                    <td>${food.memberId}</td>

                        <%-- [추가 2] 데이터 행에 버튼 세트 넣기 --%>
                    <td>
                        <div class="btn-group">
                                <%-- 수정: foodId를 들고 컨트롤러의 GetMapping("/update")로 이동 --%>
                            <a href="/food/update?foodId=${food.foodId}" class="btn btn-sm btn-outline-primary">수정</a>

                                <%-- 삭제: foodId를 들고 컨트롤러의 GetMapping("/delete")로 이동 --%>
                            <a href="/food/delete?foodId=${food.foodId}"
                               class="btn btn-sm btn-outline-danger"
                               onclick="return confirm('진짜 삭제할 거야, 형?')">삭제</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </tbody>
    </table>

    <c:if test="${empty list}">
        <p class="text-center text-muted">아직 등록된 맛집이 없어요. 첫 맛집을 등록해보세요!</p>
    </c:if>
</div>
<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>