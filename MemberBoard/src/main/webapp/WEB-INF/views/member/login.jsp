<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container text-center mt-5" style="border: 1px solid black; border-radius: 1rem;">
		<h2>S i g n I n</h2>
      		<form action="login" method="post">
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="m_id" name="m_id" placeholder="ID">
					<label for="ID">아이디</label>
				</div>
            	<!-- <input class="form-control mb-3" type="text" name="m_id" placeholder="아이디를 입력하세요"> -->

				<div class="form-floating mb-3">
					<input type="password" class="form-control" name="m_pw" placeholder="PW">
					<label for="PW">비밀번호</label>
				</div>
            	<!-- <input class="form-control mb-3" type="password" name="m_pw" placeholder="비밀번호를 입력하세요"> -->

            	<input type="submit" class="btn btn-outline-success mb-3" style="width: 100%;" value="L o g i n">

            	<a href="/" class="btn btn-outline-danger mb-3" style="width: 100%;">C a n c l e</a>
			</form>
			
	</div>
</body>
</html>