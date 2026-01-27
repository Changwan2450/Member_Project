<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-4">
    <h2 class="text-center fw-bold mb-4">🍱 우리 동네 황금 메뉴판</h2>

    <div class="card shadow-sm border-0">
        <table class="table table-hover align-middle mb-0 text-center">
            <thead class="table-dark">
            <tr>
                <th style="width: 8%">No.</th>
                <th style="width: 35%">음식명</th>
                <th style="width: 15%">카테고리</th>
                <th style="width: 15%">가격</th>
                <th style="width: 12%">작성자</th>
                <th style="width: 15%">관리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="food" items="${foodList}">
                <tr>
                    <td>${food.foodId}</td>
                    <td class="text-start ps-4">
                        <a href="/food/read?foodId=${food.foodId}"
                           class="text-decoration-none fw-bold text-dark">${food.foodName}</a>
                    </td>
                    <td><span class="badge bg-warning text-dark">${food.category}</span></td>
                    <td class="fw-bold">${food.price}원</td>
                    <td class="small text-secondary">${food.memberId}</td>
                    <td>
                            <%-- 수정/삭제 버튼: 형의 컨트롤러 경로와 100% 일치 --%>
                        <div class="btn-group">
                            <a href="/food/update?foodId=${food.foodId}"
                               class="btn btn-sm btn-outline-primary px-2">수정</a>
                            <a href="/food/delete?foodId=${food.foodId}" class="btn btn-sm btn-outline-danger px-2"
                               onclick="return confirm('진짜 삭제 하시겠습니까?')">삭제</a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>