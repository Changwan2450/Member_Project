<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold m-0">📝 자유 게시판</h2>
        <%-- 검색창 영역 시작 --%>
        <div class="d-flex justify-content-center mb-4">
            <form action="/board/list" method="get" class="d-flex gap-2" style="max-width: 500px; width: 100%;">
                <%-- 검색어 입력창: value에 ${keyword}를 넣어야 검색 후에도 글자가 남음! --%>
                <input type="text" name="keyword" value="${keyword}"
                       class="form-control border-2 border-dark"
                       placeholder="제목, 내용, 작성자 검색..."
                       style="border-radius: 8px;">

                <%-- 검색 버튼 --%>
                <button type="submit" class="custom-btn"
                        style="background: #000; color: #fff !important; white-space: nowrap;">
                    검색
                </button>

                <%-- 검색어 있을 때만 나타나는 초기화 버튼 --%>
                <c:if test="${not empty keyword}">
                    <a href="/board/list" class="custom-btn"
                       style="background: #eee; color: #000 !important; white-space: nowrap;">
                        초기화
                    </a>
                </c:if>
            </form>
        </div>
        <%-- 검색창 영역 끝 --%>
        <%-- 글쓰기 버튼 --%>
        <a href="/board/register" class="custom-btn" style="background: #FFC107; color: #000 !important;">
            글쓰기
        </a>
    </div>

    <div class="card shadow-sm border-2 border-dark overflow-hidden">
        <table class="table table-hover text-center mb-0">
            <thead class="table-warning">
            <tr>
                <th style="width: 10%">번호</th>
                <th style="width: 50%">제목</th>
                <th style="width: 15%">작성자</th>
                <th style="width: 25%">작성일</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${bList}" var="board">
                <tr>
                    <td>${board.bno}</td>
                    <td class="text-start px-4">
                            <%-- 제목 누르면 상세보기로 이동! --%>
                        <a href="/board/read?bno=${board.bno}" class="text-decoration-none text-dark fw-bold">
                                ${board.title}
                        </a>
                    </td>
                    <td><span class="badge bg-light text-dark border">${board.writer}</span></td>
                    <td class="small text-secondary">${board.regdate}</td>
                </tr>
            </c:forEach>

            <%-- 글이 하나도 없을 때 처리 --%>
            <c:if test="${empty bList}">
                <tr>
                    <td colspan="4" class="py-5 text-muted">
                        아직 올라온 글이 없네 첫 글의 주인공이 되어봐!
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>

<style>
    .custom-btn {
        height: 40px;
        display: inline-flex;
        align-items: center;
        padding: 0 20px;
        border: 2px solid #000;
        border-radius: 8px;
        font-weight: 800;
        text-decoration: none !important;
        transition: 0.2s;
    }

    .custom-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>