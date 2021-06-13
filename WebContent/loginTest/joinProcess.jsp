<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Connection conn=null; // DB연결
	PreparedStatement pstmt=null; // SQL문
	ResultSet re = null; // 해제
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn=ds.getConnection();
		
		pstmt=conn.prepareStatement("Insert into member5 values(?,?,?,?,?,?)"); // 커넥션 풀 방식
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,name);
		pstmt.setInt(4,age);
		pstmt.setString(5,gender);
		pstmt.setString(6,email);
		System.out.println("--------------------result------------------");
		int result = pstmt.executeUpdate();
		
		if(result!=0){
			out.println("<script>");
			out.println("location.href='loginForm.jsp'");
			out.println("</script>");
		} else{
			out.println("<script>");
			out.println("location.href='join.Form.jsp'");
			out.println("</script>");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	session.setAttribute("id",id); // 세션으로 받아와야 함.
	response.sendRedirect("main.jsp");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinProcess</title>
</head>
<body>

</body>
</html>