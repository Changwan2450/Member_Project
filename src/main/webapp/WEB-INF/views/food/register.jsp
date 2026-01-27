<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container" style="margin-top: 50px;">
    <div style="max-width: 500px; background: white; padding: 40px; border-radius: 15px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); margin: auto;">
        <h2 class="text-center mb-4">✨ 새 맛집 등록</h2>
        <form action="/food/register" method="post">
            <div class="mb-3">
                <label class="form-label fw-bold">음식 이름</label>
                <input type="text" name="foodName" class="form-control" placeholder="예: 김치찌개" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">카테고리</label>
                <select name="category" class="form-select">
                    <option value="한식">한식</option>
                    <option value="중식">중식</option>
                    <option value="일식">일식</option>
                    <option value="양식">양식</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">가격</label>
                <input type="number" name="price" class="form-control" placeholder="숫자만 입력" required>
            </div>

            <div class="d-grid gap-2">
                <button type="submit" class="btn btn-warning fw-bold">등록하기</button>
                <a href="/food/list" class="btn btn-outline-secondary">취소</a>
            </div>
        </form>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>