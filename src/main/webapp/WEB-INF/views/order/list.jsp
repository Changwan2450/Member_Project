<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 헤더 포함 --%>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-4">
    <h2 class="text-center fw-bold mb-4">📦 우리 가게 주문 내역</h2>

    <div class="card shadow-sm border-0">
        <table class="table table-hover align-middle mb-0 text-center">
            <thead class="table-dark">
            <tr>
                <th style="width: 15%">주문번호</th>
                <th style="width: 15%">메뉴번호</th>
                <th style="width: 25%">주문자ID</th>
                <th style="width: 15%">수량</th>
                <th style="width: 30%">주문시간</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ol}" var="o">
                <tr>
                    <td><span class="badge bg-light text-dark border">${o.ono}</span></td>
                    <td class="fw-bold text-primary">${o.fno}</td>
                    <td>${o.id}</td>
                    <td class="fw-bold">${o.amount}개</td>
                    <td class="small text-secondary">${o.regdate}</td>
                </tr>
            </c:forEach>

            <%-- 주문 내역이 비어있을 때 --%>
            <c:if test="${empty ol}">
                <tr>
                    <td colspan="5" class="py-5 text-muted">
                        <div class="fs-4">😅 아직 주문 내역이 없습니다.</div>
                        <a href="/food/list" class="btn btn-sm btn-outline-warning mt-3">첫 주문하러 가기</a>
                    </td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>

    <%-- 하단 버튼 그룹 --%>
    <div class="d-flex justify-content-center gap-3 mt-5">
        <a href="/food/list" class="custom-btn" style="background: #FFC107; color: #000 !important;">
            🏠 메뉴판으로 돌아가기
        </a>
        <a href="/" class="custom-btn">
            메인 페이지
        </a>
    </div>
</div>

<%-- 푸터 포함 --%>
<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>

<style>
    /* 테이블 행에 마우스 올렸을 때 효과 */
    .table-hover tbody tr:hover {
        background-color: rgba(255, 193, 7, 0.05);
    }

    .custom-btn {
        height: 45px;
        padding: 0 30px;
        border: 2px solid #000;
        border-radius: 8px;
        font-weight: 800;
        text-decoration: none !important;
        display: inline-flex;
        align-items: center;
        transition: 0.2s;
    }

    .custom-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>