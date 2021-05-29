<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test01</title>
  </head>
  <body>
<%
	request.setAttribute("name", "Kang");
	request.setAttribute("rank", "10");
%>

	forward 해주는 파일의 내용은 확인할 수 없다~
	
	<jsp:forward page="test02.jsp"></jsp:forward>
	
  </body>
</html>
