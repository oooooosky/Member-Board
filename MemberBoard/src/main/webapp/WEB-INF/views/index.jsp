<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.fade-in-box {
  padding: 10px;
  animation: fadein 3s;
  -moz-animation: fadein 3s; /* Firefox */
  -webkit-animation: fadein 3s; /* Safari and Chrome */
  -o-animation: fadein 3s; /* Opera */
}
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}
</style>
</head>
<body>
	<div class="container mt-5" style="border: 1px solid black; border-radius: 1rem;">
		<div class="d-flex bd-highlight">
			<div class="p-2 flex-grow-1 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link active text-dark" aria-current="page" href="/">Home</a>
			</div>
			<div class="p-2 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link text-dark" href="/member/join">Sign Up</a>
			</div>
			<div class="p-2 bd-highlight" style="font-size:1.5em;">
				<a class="nav-link text-dark" href="/member/login">Sign In</a>
			</div>
		  </div>
		  <div class="fade-in-box">
			  <h1 class="text-center" style="margin-top: 30%; margin-bottom: 30%;">Welcome!</h1>
		  </div>
	</div>


</body>
</html>