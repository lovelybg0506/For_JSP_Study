<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>

<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id"); // 로그인을 성공적으로 수행하면 메인창으로 입장.
	} else {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'"); // 로그인 실패시 다시 loginForm.jsp로 돌아감.
		out.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Main</title>
</head>
<body>
	<h3 align="center">
		"<%=id%>" 로 로그인 하셨습니다 !
	</h3>

	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); // 커넥션풀 여기도 등장
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("select * from member5 where id=?"); // sql문 똑같이 적어줌
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) { // DB를 일일이 확인 할 필요 없이 바로 자신의 회원정보를 열람 할 수 있도록 해줌
	%>
	<center>
		<h2>나의 회원정보</h2>
		<table border="1" align="center">
			<tr>
				<td>아이디 :</td>
				<td><%=id%></td>
			</tr>
			<tr>
				<td>이름 :</td>
				<td><%=rs.getString("name")%></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><%=rs.getString("password")%></td>
			</tr>
			<tr>
				<td>나이 :</td>
				<td><%=rs.getString("age")%></td>
			</tr>
			<tr>
				<td>성별 :</td>
				<td><%=rs.getString("gender")%></td>
			</tr>
			<tr>
				<td>이메일 :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
		</table>

		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<br>
		<a href="modifyForm.jsp" align="center">정보수정</a>
		
		<%
			if (id.equals("admin")){ // 관리자가 로그인 했을 때
				
		%>
		<!-- //관리자 (admin) 접속시 -->
		<a href="member_list.jsp" align="center">관리자모드 접속(목록 보기 가능)</a>
		<%
			}
		%>
		
		<form action="loginForm.jsp"><input type="submit" value="로그인창으로"></form>
	</center>
</body>
</html>










