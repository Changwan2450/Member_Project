<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-2 border-dark">
                <div class="card-header bg-dark text-white py-3">
                    <h3 class="fw-bold mb-0 text-center">📄 게시글 상세보기</h3>
                </div>
                <div class="card-body p-4">
                    <div class="mb-3">
                        <label class="form-label fw-bold text-muted small">글 번호</label>
                        <input type="text" class="form-control border-0 bg-light" value="${board.bno}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-muted small">제목</label>
                        <input type="text" class="form-control border-2" value="${board.title}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-muted small">작성자</label>
                        <input type="text" class="form-control border-2 bg-light" value="${board.writer}" readonly>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold text-muted small">내용</label>
                        <textarea class="form-control border-2 bg-white" rows="10" readonly>${board.content}</textarea>
                    </div>

                    <div class="d-flex justify-content-between mt-4">
                        <a href="/board/list" class="btn btn-outline-dark px-4 fw-bold">목록으로</a>

                        <%-- 본인 글일 때만 수정/삭제 버튼 보이게 하고 싶으면 나중에 c:if 써보자! --%>
                        <div>
                            <a href="/board/modify?bno=${board.bno}"
                               class="btn btn-warning border-2 border-dark fw-bold px-4">수정하기</a>
                            <button type="button" class="btn btn-danger border-2 border-dark fw-bold px-4"
                                    onclick="if(confirm('진짜 지울 거야 형?')) location.href='/board/delete?bno=${board.bno}'">
                                삭제
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>