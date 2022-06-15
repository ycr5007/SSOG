<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head><title>비활성화된 계정</title>
<style type="text/css">
body {
	font-family: Tahoma, Arial, sans-serif;
}

h1, h2, h3, b {
	color: white;
	background-color: #525D76;
}

h1 {
	font-size: 22px;
}

h2 {
	font-size: 16px;
}

h3 {
	font-size: 14px;
}

p {
	font-size: 12px;
}

a {
	color: black;
}

.line {
	height: 1px;
	background-color: #525D76;
	border: none;
}
</style>
</head>
<body>
	<h1>비활성화된 계정</h1>
	<hr class="line" />
	<p>
		<b>설명</b> 비활성화 된 계정입니다. 다른 계정으로 로그인해주세요.
	</p>
	<hr class="line" />
	<button type="button" onclick="javascript:location.href = '/member/login'">뒤로</button>
</body>
</html>








