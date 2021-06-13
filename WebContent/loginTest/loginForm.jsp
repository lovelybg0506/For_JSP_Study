<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>

	<form name="loginForm" action="loginProcess.jsp" method="post">
		<center>
			<table border=1>
				<tr>
					<td colspan="2" align=center bgcolor="pink"><b><font
							size=6>로그인페이지</font></b></td>
				</tr>
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="pass"></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="로그인">
						<a href="joinForm.jsp">회원가입</a>
			</table>
		</center>
	</form>

</body>
</html>