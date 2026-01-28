<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow border-2 border-dark">
                <div class="card-header bg-warning py-3">
                    <h3 class="fw-bold mb-0 text-center">📝 새 게시글 작성</h3>
                </div>
                <div class="card-body p-4">
                    <form action="/board/register" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">제목</label>
                            <input type="text" name="title" class="form-control border-2" placeholder="제목을 입력하세요"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">작성자</label>
                            <%-- 로그인한 형의 아이디가 자동으로 박히게 세팅! --%>
                            <input type="text" name="writer" value="${loginUser.id}"
                                   class="form-control border-2 bg-light" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">내용</label>
                            <textarea name="content" class="form-control border-2" rows="10" placeholder="형의 생각을 들려줘!"
                                      required></textarea>
                        </div>

                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <button type="submit" class="btn btn-dark px-5 fw-bold">등록하기</button>
                            <a href="/board/list" class="btn btn-outline-secondary px-4">취소</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>