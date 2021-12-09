<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	label {
		display: block;
	}
</style>
</head>
<body>
    <div class="container text-center mt-5" style="border: 1px solid black; border-radius: 1rem;">
        <table class="table table-hover text-center">
            <tr>
                <th>번호</th>
                <th>작성자</th>
                <th>제목</th>
                <th>내용</th>
                <th>조회수</th>
                <th>작성시간</th>
                <c:if test="${sessionScope.loginId eq board.b_writer}">
                <th>수정</th>
                <th>삭제</th>
                </c:if>
            </tr>
                <tr>
                    <td>${board.b_number}</td>
                    <td>${board.b_writer}</td>
                    <td>${board.b_title}</td>
                    <td>${board.b_contents}</td>
                    <td>${board.b_hits}</td>
                    <td>${board.b_date}</td>
                    <c:if test="${sessionScope.loginId eq board.b_writer}">
                    <td><a class="btn btn-outline-success" href="updateForm?b_number=${board.b_number}&page=${page}">U p d a t e</a></td>
                    <td><a class="btn btn-outline-dark" href="delete?b_number=${board.b_number}">D e l e t e</a></td>
                    </c:if>
                </tr>
        </table>
            <img src="/resources/upload/${board.b_filename}" class="mb-3" style="border-radius: 1rem;"> <br>
        <!-- 댓글 작성 -->
        <div id="comment-writer">
        	<label for="">댓글 작성</label>
            <input class="form-control mb-3" type="text" id="c_writer" value="${sessionScope.loginId}" readonly>
            <input class="form-control mb-3" type="text" id="c_contents" placeholder="댓글 내용">
         <button class="btn btn-outline-dark mb-3" id="comment-write-btn">C o m m e n t !</button>
        </div>

        <!-- 댓글목록 출력 -->
        <div id="comment-list">
            <table class="table">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                    <th>작성시간</th>
                </tr>
                <c:forEach items="${commentList}" var="comment">
                    <tr>
                        <td>${comment.c_writer}</td>
                        <td>${comment.c_contents}</td>
                        <td>${comment.c_date}</td>
                        <c:if test="${sessionScope.loginId eq comment.c_writer}">
                        <td><a class="btn btn-outline-dark" href="/comment/delete?b_number=${board.b_number}&page=${page}&c_number=${comment.c_number}">D e l e t e</a></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>

            <a class="btn btn-outline-danger mb-3 mt-3" href="/board/paging?page=${page}">P o s t L i s t</a>
            
        </div>
        
        
        
</body>

<script>
//     const commentBtn = document.getElementById("comment-write-btn")
//     commentBtn.addEventListener("click", function() {
//         console.log('함수 호출')
//     })

$("#comment-write-btn").click(function(){
    console.log('함수 호출(jQuary)')
    /* 
    	ajax 문법을 이용하여 댓글 작성자, 작성 내용을 comment/save 주소로 post 방식으로 전송하는 내용을 작성
    */
 /*    const c_writer = document.getElementById('c_writer').value
    // console.log(id)
    const c_contents = document.getElementById('c_contents').value */
    
    const commentWriter = $("#c_writer").val();
    const commentContents = $("#c_contents").val();
    const boardNumber = '${board.b_number}';
   	console.log(commentWriter, commentContents, boardNumber);
// 	const comment = document.getElementById('comment-list')
	const comment = $("#comment-List")
	

/*     console.log(c_writer)
    console.log(c_contents) */
    
    // jQuery ajax 시작 문법
    $.ajax({
        type: 'post', // 전송방식(get, post, delete, put 등)
        url: '/comment/save', // 요청 주소 (컨트롤러로 요청하는 주소)
        data: {'c_writer': commentWriter, 'c_contents':commentContents, 'b_number': boardNumber}, // 전송할 데이터 {'key': value, 'key': value}
        dataType: 'json', // 요청 후 리턴받을 때의 데이터 형식
        success: function(result) { // 요청 후 성공적으로 처리됐을 때 실행할 함수
            console.log('ajax 성공')
            console.log(result)
//          comment.innerHTML=result
			console.log(result);
			let output = "<table class='table'>";
			output += "<th>작성자</th>";
			output += "<th>내용</th>";
			output += "<th>작성시간</th></tr>";
			for(let i in result){
				output += "<tr>";
				output += "<td>"+result[i].c_writer+"</td>";
				output += "<td>"+result[i].c_contents+"</td>";
				output += "<td>"+result[i].c_date+"</td>";
				output += "</tr>";
			}
			output += "</table>";
			// id가 comment-list인 div에 출력
			document.getElementById('comment-list').innerHTML = output;
			document.getElementById('c_contents').value='';
			location.reload();
        },
        error: function(result) { // 요청이 실패했을 때 실행할 함수
            console.log('오타 찾으세요')
        }
    })
})

</script>

</html>
