<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
    <div class="container mt-5" style="border: 1px solid black; border-radius: 1rem;">

        <div class="d-flex bd-highlight">
			<div class="p-2 flex-grow-1 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link active text-dark" aria-current="page" href="/board/paging">P o s t L i s t</a>
			</div>
			<div class="p-2 bd-highlight" style="font-size:1.5em;">
                <form action="/member/myPageForm" method="post">
                    <input type="hidden" name="m_id" value="${sessionScope.loginId}">
                    <input type="submit" class="btn btn-outline-success" value="M y P a g e">
				<!-- <a class="nav-link text-dark" href="/member/join">Sign Up</a> -->
                </form>
			</div>
			<div class="p-2 bd-highlight" style="font-size:1.5em;">
		        <a href="/member/logout" class="btn btn-outline-danger">L o g O u t</a>
				<!-- <a class="nav-link text-dark" href="/member/login">Sign In</a> -->
			</div>
		  </div>


        <div class="mb-3">
            <form action="/board/search" method="get" class="d-flex mb-3">
                <select class="form-select" name="searchtype" style="width: 30%">
                	<option>검색 종류 선택</option>
                    <option value="b_title">T i t l e</option>
                    <option value="b_writer">W r i t e r</option>
                </select>
                <input class="form-control" style="width:55%;" type="text" name="keyword" placeholder="검색어 입력">
                <input class="btn btn-outline-dark" style="width:15%;" type="submit" value="S e a r c h">
            </form>
            <!-- <form action="/board/choice" class="d-flex mb-3" method="get">
                <select class="form-select" style="width:85%" name="choice">
                	<option>한 페이지당 게시글 갯수</option>
                	<option value="five">5 개</option>
                	<option value="ten">10 개</option>
                </select>
                <input class="btn btn-outline-dark" style="width:15%" type="submit" value="C h a n g e">
            </form> -->
        </div>
        
        <div class="text-center">
        <table class="table table-hover text-center">
            <tr>
                <th>글번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성시간</th>
                <!-- <th>상세조회</th> -->
                <!-- <th>수정</th> -->
                <c:if test="${sessionScope.loginId eq 'admin'}">
                <th>삭제</th>
                </c:if>
                <!-- <th>수정(비밀번호)</th> -->
            </tr>
            <c:forEach items="${bList}" var="b">
                <tr>
                    <td>${b.b_number}</td>
                    <td>${b.b_writer}</td>
                    <td><a class="text-dark" style="text-decoration-line: none;" href="/board/detail?b_number=${b.b_number}&page=${paging.page}">${b.b_title}</a></td>
                    <!-- <td>${b.b_title}</td> -->
                    <td>${b.b_hits}</td>
                    <td>${b.b_date}</td>
                    <!-- <td><a class="btn btn-outline-warning text-dark" href="update?b_number=${b.b_number}">수정</a></td> -->
                    <c:if test="${sessionScope.loginId eq 'admin'}">
                    <td><a class="btn btn-outline-dark" href="delete?b_number=${b.b_number}">D e l e t e</a></td>
                    </c:if>
                    <!-- <td><button class="btn btn-outline-warning text-dark" onclick="updateAjax()">수정(비밀번호)</button></td> -->
                    <!-- <td><button class="btn btn-outline-warning text-dark" onclick="detailAjax('${m.m_number}')">조회(ajax)</button></td> -->
                    <!-- <td>
                    	<form action="update" method="post">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" placeholder="비밀번호 입력" name="b_password">
                                <a class="btn btn-outline-warning" type="submit" href="update">수정(비밀번호)</a>
                            </div>
                        </form>
                    </td> -->
                </tr>
            </c:forEach>
        </table>
            <a href="/board/save" class="btn btn-outline-success mb-3">W r i t i n g</a>
            <c:if test="${sessionScope.loginId eq 'admin'}">
            <a href="/member/main" class="btn btn-outline-danger mb-3">A d m i n P a g e</a>
            </c:if>
        	<div>
		<c:choose>
			<c:when test="${paging.page<=1}">
				<&nbsp;
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page-1}"><</a>&nbsp;
			</c:otherwise>
		</c:choose>
		
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
			<c:choose>
				<c:when test="${i eq paging.page}">
					${i}
				</c:when>
				<c:otherwise>
					<a href="/board/paging?page=${i}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
				>
			</c:when>
			<c:otherwise>
				<a href="/board/paging?page=${paging.page+1}">></a>
			</c:otherwise>
		</c:choose>
	</div>
        </div>
	
	</div>
        
        
</body>
</html>
