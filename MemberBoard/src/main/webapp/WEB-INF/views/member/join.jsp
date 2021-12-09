<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    function idDuplicate() {
        const id = document.getElementById('m_id').value
        const checkResult = document.getElementById('id-dup-check')

        $.ajax({
            type: 'post',
            url: 'idDuplicate',
            data: {'m_id': id},
            dataType: 'text',
            success: function(result) {
                if(result=="ok") {
                    checkResult.style.color="green"
                    checkResult.innerHTML="멋진 아이디네요!"
                } else {
                    checkResult.style.color="red"
                    checkResult.innerHTML="이미 사용중인 아이디입니다."
                }
            },
            error: function(result) {
            	
            }
        })

    }
</script>
<style>
    span {
        display: block;
        text-align: left;
    }
</style>
</head>
<body>
	<div class="container text-center mt-5" style="border: 1px solid black; border-radius: 1rem;">
        <h2>S i g n U p</h2>
        <form action="join" method="post" enctype="multipart/form-data">
           	<span id="id-dup-check"></span>

            <div class="form-floating mb-3">
                <input type="text" class="form-control" id="m_id" name="m_id" placeholder="ID" onkeyup="idDuplicate()">
                <label for="ID">아이디</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_id" id="m_id" placeholder="아이디를 입력하세요" onkeyup="idDuplicate()"> -->

            <div class="form-floating mb-3">
                <input type="password" class="form-control" name="m_pw" placeholder="PW">
                <label for="PW">비밀번호</label>
            </div>
            <!-- <input class="form-control mb-3" type="password" name="m_pw" placeholder="비밀번호를 입력하세요"> -->

            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="m_name" placeholder="NA">
                <label for="NA">이름</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_name" placeholder="이름을 입력하세요"> -->

            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="m_email" placeholder="EM">
                <label for="EM">이메일</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_email" placeholder="이메일을 입력하세요"> -->

            <div class="form-floating mb-3">
                <input type="text" class="form-control" name="m_phone" placeholder="PH">
                <label for="PH">전화번호</label>
            </div>
            <!-- <input class="form-control mb-3" type="text" name="m_phone" placeholder="전화번호를 입력하세요"> -->

            <div class="mb-3">
  				<input class="form-control" type="file" name="m_file" multiple>
			</div>

            <input type="submit" class="btn btn-outline-success mb-3" style="width:100%" value="S u c c e s s">

            <a href="/" class="btn btn-outline-danger mb-3" style="width:100%">C a n c l e</a>

        </form>
    </div>
</body>
</html>