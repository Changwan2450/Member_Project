<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/food/includes/header.jsp" %>

<div class="container mt-5">
    <div class="mb-5">
        <h1 class="fw-black" style="font-weight: 900; letter-spacing: -2px;">사장님 관리 마스터</h1>
        <p class="text-secondary fw-medium">가입된 사장님 계정 정보를 조회하고 관리합니다.</p>
    </div>

    <div class="card border-0 shadow-lg" style="border-radius: 20px; overflow: hidden;">
        <table class="table table-hover align-middle mb-0 text-center">
            <thead style="background: #212529; color: #FFC107;">
            <tr>
                <th class="py-4">아이디</th>
                <th>이름</th>
                <th>나이</th>
                <th>권한</th>
                <th>가입일</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody class="bg-white">
            <c:forEach items="${list}" var="m">
                <tr>
                    <td class="fw-bold text-dark">${m.id}</td>
                    <td>${m.name}</td>
                    <td>${m.age}세</td>
                    <td>
                            <span class="badge ${m.id eq 'admin' ? 'bg-danger' : 'bg-dark'} px-3">
                                    ${m.id eq 'admin' ? 'MASTER' : 'OWNER'}
                            </span>
                    </td>
                    <td class="text-muted small">${m.regdate}</td>
                    <td>
                        <div class="d-flex justify-content-center gap-2">
                            <a href="/member/read?id=${m.id}" class="btn btn-sm btn-outline-dark fw-bold px-3">상세/수정</a>
                                <%-- admin 본인은 삭제 못 하게 막는 센스 --%>
                            <c:if test="${m.id ne 'admin'}">
                                <form action="/member/delete" method="post"
                                      onsubmit="return confirm('이 사장님 계정을 삭제할까요?')">
                                    <input type="hidden" name="id" value="${m.id}">
                                    <button type="submit" class="btn btn-sm btn-danger fw-bold px-3">삭제</button>
                                </form>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@ include file="/WEB-INF/views/food/includes/footer.jsp" %>