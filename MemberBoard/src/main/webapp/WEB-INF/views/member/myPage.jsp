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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	/* 비밀번호 입력창에서 일치하면 update처리 아니면 일치하지않습니다 alert 출력 */
	 function update() {
		const pw = document.getElementById('m_pw').value
        // const pw = document.querySelector("#b_password").value

		const pwDB = '${m.m_pw}'

		
		if(pw==pwDB) {
			update_form.submit();
		} else {
			alert('비밀번호가 일치하지 않습니다.')
		}

	}
</script>
<style>
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
</head>
<body>
	<div class="container form-control mt-5" style="border: 1px solid black; border-radius: 1rem;">
        <h2 class="text-center">M y P a g e</h2>
        <form action="/member/update" method="post" name="update_form" enctype="multipart/form-data">
           	
           	<div class="form-floating mb-3">
  				<input type="text" class="form-control" id="MN" name="m_number" placeholder="회원번호" value="${m.m_number}" readonly>
 				<label for="MN">회원번호</label>
			</div>
            <!-- <input class="form-control mb-3" type="text" name="m_number" value="${m.m_number}" readonly> -->
            
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="ID" name="m_id" placeholder="아이디" value="${m.m_id}" readonly>
			   <label for="ID">아이디</label>
		  	</div>
            <!-- <input class="form-control mb-3" type="text" name="m_id" value="${m.m_id}" readonly> -->

			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="m_pw" name="m_pw" placeholder="비밀번호">
			   <label for="pw">비밀번호</label>
		  	</div>
            <!-- <input class="form-control mb-3" type="password" name="m_pw" id="m_pw" placeholder="비밀번호를 입력하세요"> -->

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="NA" name="m_name" placeholder="이름" value="${m.m_name}" readonly>
			   <label for="NA">이름</label>
		  	</div>
            <!-- <input class="form-control mb-3" type="text" name="m_name" value="${m.m_name}" readonly> -->

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="EM" name="m_email" placeholder="이메일" value="${m.m_email}">
			   <label for="EM">이메일</label>
		  	</div>
            <!-- <input class="form-control mb-3" type="text" name="m_email" placeholder="이메일을 입력하세요"> -->

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="PH" name="m_phone" placeholder="전화번호" value="${m.m_phone}">
			   <label for="PH">전화번호</label>
		  	</div>
            <!-- <input class="form-control mb-3" type="text" name="m_phone" placeholder="전화번호를 입력하세요"> -->

            <div class="mb-3">
            	<label for="formFileMultiple" class="form-label">사진을 변경해보세요!</label>
  				<input class="form-control" type="file" name="m_file" multiple>
			</div>

            <button class="btn btn-outline-success mb-3" style="width: 100%;" onclick="update()">S u c c e s s</button>

            <a href="/board/paging" class="btn btn-outline-danger mb-3" style="width:100%">C a n c l e</a>
			
        </form>
    </div>
</body>
</html>