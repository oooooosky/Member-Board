<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
    label {
        display: block;
    }
</style>
</head>
<body>
    <div class="container mt-5 form-control" style="border: 1px solid black; border-radius: 1rem;">
        <h2 class="text-center">W r i t i n g</h2>
        <form action="/board/savefile" method="post" enctype="multipart/form-data">
        
        	<div class="form-floating mb-3">
  				<input type="text" class="form-control" id="BW" name="b_writer" placeholder="작성자" value="${sessionScope.loginId}" readonly>
 				<label for="BW">작성자</label>
			</div>
            
            <div class="form-floating mb-3">
  				<input type="text" class="form-control" id="BT" name="b_title" placeholder="제목">
 				<label for="BT">제목</label>
			</div>
            
			<div class="form-floating mb-1">
  				<textarea class="form-control" id="BC" placeholder="내용" name="b_contents" style="height: 100px"></textarea>
 				<label for="BC">내용</label>
			</div>
                        
            <div class="mb-3">
  				<label for="formFileMultiple" class="form-label">사진을 올려보세요!</label>
  				<input class="form-control" type="file" name="b_file" multiple>
			</div>
			
            <input class="btn btn-outline-success mb-3" style="width: 100%;" type="submit" value="S u c c e s s">
            
        </form>
            <a class="btn btn-outline-danger mb-3" style="width: 100%;" href="/board/paging">C a n c l e</a>
    </div>
    
</body>
</html>
