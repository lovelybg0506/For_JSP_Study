<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>test02</title>
  </head>
  <body>
    <%
    String name=(String)request.getAttribute("name");
    String rank=(String)request.getAttribute("rank");
    %>
    forwardTo_eun.jsp 페이지 입니다.<br>
    forwardTo_eun.jsp 페이지는 포워딩 페이지로<br>
    forwardForm_eun.jsp 페이지와 같은 request 객체를 공유한다<br>

    이름:
    <b><%=name%></b><br>
    랭크:
    <b><%=rank%></b><br>
  </body>
</html>
