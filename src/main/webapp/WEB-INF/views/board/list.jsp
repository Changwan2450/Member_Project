<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 형이 만든 헤더 가져오기! --%>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold m-0">📝 자유 게시판</h2>
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
            <%-- ★ 여기 핵심! 컨트롤러에서 보낸 이름 'bList' --%>
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
                        아직 올라온 글이 없네 형? 첫 글의 주인공이 되어봐!
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>

<style>
    /* 형의 커스텀 버튼 스타일 적용 */
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