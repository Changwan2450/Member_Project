<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="card shadow border-2 border-dark">
        <div class="card-header bg-warning py-3">
            <h3 class="fw-bold mb-0 text-center">✏️ 게시글 수정하기</h3>
        </div>
        <div class="card-body p-4">
            <%-- 1. 데이터를 서버로 쏠 폼 태그! --%>
            <form action="/board/modify" method="post">

                <%-- 2. ★제일 중요! 글 번호를 숨겨서 보내야 함 --%>
                <input type="hidden" name="bno" value="${rbn.bno}">

                <div class="mb-3">
                    <label class="form-label fw-bold">제목</label>
                    <%-- readonly 빼고 name="title" 확인! --%>
                    <input type="text" name="title" class="form-control border-2" value="${rbn.title}">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold text-muted">작성자</label>
                    <input type="text" class="form-control border-0 bg-light" value="${rbn.writer}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">내용</label>
                    <%-- name="content" 확인! --%>
                    <textarea name="content" class="form-control border-2" rows="10">${rbn.content}</textarea>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <button type="submit" class="btn btn-dark px-5 fw-bold">수정 완료</button>
                    <a href="/board/read?bno=${rbn.bno}" class="btn btn-outline-secondary px-4">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>