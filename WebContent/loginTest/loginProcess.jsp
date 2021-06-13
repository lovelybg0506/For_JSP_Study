<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginProcess</title>
</head>
<body>

<!-- loginProcess : 입력된 정보를 DB와 연결해주는 창 -->
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdvc/OracleDB"); // 아래에서 저장한 connection name값을 불러옴
		conn = ds.getConnection();
		
		pstmt=conn.prepareStatement("select * from member5 where id=?"); // prepareStatement는 Statement와 다르게 ?로 지정된 값을 필요 할 때 마다 이용 가능
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("password"))){
				session.setAttribute("id",id);
				out.println("<script>");
				out.println("location.href='main.jsp'"); // 저장된 정보와 아이디와 비밀번호가 일치하면 main.jsp로 보낸다
				out.println("</script>");
			}
		}
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>

</body>
</html>