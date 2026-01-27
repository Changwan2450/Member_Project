<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>

<div class="container" style="margin-top: 50px;">
    <div class="card mx-auto shadow-sm" style="max-width: 500px; border-radius: 15px;">
        <div class="card-body p-4">
            <h2 class="text-center mb-4 text-primary">🛠 음식 정보 수정</h2>

            <%-- action은 컨트롤러의 @PostMapping("/update")와 연결됨 --%>
            <form action="/food/update" method="post">
                <%-- [핵심] 어떤 데이터를 고칠지 서버가 알아야 하니까 ID를 숨겨서 보냄 --%>
                <input type="hidden" name="foodId" value="${update.foodId}">

                <div class="mb-3">
                    <label class="form-label fw-bold">음식 이름</label>
                    <input type="text" name="foodName" class="form-control" value="${update.foodName}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">카테고리</label>
                    <select name="category" class="form-select">
                        <option value="한식" ${update.category == '한식' ? 'selected' : ''}>한식</option>
                        <option value="중식" ${update.category == '중식' ? 'selected' : ''}>중식</option>
                        <option value="일식" ${update.category == '일식' ? 'selected' : ''}>일식</option>
                        <option value="양식" ${update.category == '양식' ? 'selected' : ''}>양식</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">가격</label>
                    <input type="number" name="price" class="form-control" value="${update.price}" required>
                </div>

                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary fw-bold">수정 완료</button>
                    <a href="/food/list" class="btn btn-outline-secondary">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- 하단 조립 --%>
<%@ include file="includes/footer.jsp" %>