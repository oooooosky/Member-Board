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

	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
	
</style>
</head>
<body>
    <div class="container mt-5 text-center" style="border: 1px solid black; border-radius: 1rem;">
		<h2 class="mt-3">A d m i n P a g e</h2>
		
		
		<div class="fade-in-box" style="margin-top: 30%; margin-bottom: 30%;">
			<a class="btn btn-outline-dark" href="/member/memberView">M e m b e r L i s t</a>
			<a class="btn btn-outline-dark" href="/board/paging">P o s t L i s t</a>
			<a href="/member/logout" class="btn btn-outline-danger">L o g O u t</a>
		</div>
    </div>
</body>
</html>