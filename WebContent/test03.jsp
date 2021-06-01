<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test03</title>
</head>
<body>
<form action="test04.jsp" method="post"> <!-- form action 이부분에서 '전송'을 눌렀을때 어떤 페이지로 넘어갈지 설정  -->
이름 : <input type="text" name="name"><br> <!-- form의 method를 get방식으로하면 보안에 취약하나 한글 인코딩을 하지않아도되고 -->
나이 : <input type="text" name="age"><br> <!-- method를 post로 하면 보안에 좋으나 test04에 써둔것 처럼 인코딩을 utf-8로 설정 해주어야한다 -->
<input type="submit" value="전송">
<input type="reset" value="취소"> 
</form>
</body>
</html>