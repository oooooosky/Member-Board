<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="container form-control mt-5">
        <h2 class="text-center">게시글 수정</h2>
        <div>
            <form action="update" method="post" enctype="multipart/form-data">
           		<input type="hidden" name="page" value="${page}">
                <input type="hidden" name="b_number" value="${board.b_number}">
            	<label for="">작성자</label>
                <input class="form-control mb-3" type="text" name="b_writer" value="${board.b_writer}" readonly>
                <label for="">제목</label>
                <input class="form-control mb-3" type="text" name="b_title" value="${board.b_title}">
                <label for="">내용</label>
                <textarea class="form-control mb-3" name="b_contents">${board.b_contents}</textarea>
                <div class="mb-3">
  					<input class="form-control" type="file" name="b_file" multiple>
				</div>
                <input type="submit" class="btn btn-outline-success mb-3" style="width: 100%;" value="수정">
            </form>
            	<a class="btn btn-outline-danger mb-3" style="width: 100%;" href="/board/paging?page=${page}">취소</a>
        </div>
    </div>
</body>
</html>