<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04 with test03</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); // 본문에 넘어오는 인코딩 형식을 utf-8로 바꿔라.
String name = request.getParameter("name");//request = 앞에서 전달한 파라메터를 가져올수있다
int age = Integer.parseInt(request.getParameter("age")); // age는 text타입으로 만들었기때문에 Integer.parseInt를 통해 정수로 변경
%>

<%=name %>님의 만 나이는 <%=age-1 %>세 입니다.
</body>
</html>