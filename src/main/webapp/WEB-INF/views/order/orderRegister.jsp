<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
                <%-- 헤더: 옐로우 배경 --%>
                <div class="card-header border-0 py-3 text-center" style="background-color: #FFC107;">
                    <h3 class="fw-black mb-0" style="color: #000;">🛒 주문서 작성</h3>
                </div>

                <div class="card-body p-4 bg-white">
                    <form action="/order/orderRegister" method="post"
                          onsubmit="return confirm('진짜 주문하시겠어요? 당신의 지갑은 소중하니까! 💸')">

                        <%-- 상품 번호 (읽기 전용이라 은은하게 처리) --%>
                        <div class="mb-4">
                            <label class="form-label fw-bold small text-muted">선택한 음식 번호</label>
                            <input type="text" name="fno" value="${fno}"
                                   class="form-control bg-light border-0 fw-bold text-center fs-5" readonly>
                        </div>

                        <%-- 주문자 ID --%>
                        <div class="mb-4">
                            <label class="form-label fw-bold">주문자 ID</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-2 border-dark">👤</span>
                                <input type="text" name="id" value="${loginUser.id}"
                                       class="form-control border-2 border-dark fw-bold bg-light" readonly>
                            </div>
                        </div>

                        <%-- 수량 입력 (여기가 포인트!) --%>
                        <div class="mb-4">
                            <label class="form-label fw-bold">얼마나 시킬까요?</label>
                            <div class="input-group border-2 border-dark rounded-2 overflow-hidden">
                                <span class="input-group-text bg-white border-0">📦</span>
                                <input type="number" name="amount"
                                       class="form-control border-0 text-center fw-bold fs-5"
                                       min="1" value="1" required>
                                <span class="input-group-text bg-white border-0">개</span>
                            </div>
                            <div class="form-text text-end mt-1">※ 최소 1개부터 주문 가능합니다.</div>
                        </div>

                        <hr class="my-4 border-2 opacity-100">

                        <%-- 하단 버튼 세트 --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="custom-btn w-100 py-3 fs-5"
                                    style="background-color: #000; color: #FFC107 !important; border: none; cursor: pointer;">
                                🔥 지금 바로 주문하기
                            </button>
                            <a href="/food/list" class="btn btn-link text-decoration-none text-muted fw-bold">
                                나중에 시킬게요 (취소)
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 푸터 포함 --%>
<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>

<style>
    /* 폰트 두께 조절용 클래스 */
    .fw-black {
        font-weight: 900;
    }

    /* 인풋 박스 포커스 시 테두리 색깔 변경 */
    .form-control:focus {
        border-color: #FFC107;
        box-shadow: 0 0 0 0.25rem rgba(255, 193, 7, 0.25);
    }
</style>