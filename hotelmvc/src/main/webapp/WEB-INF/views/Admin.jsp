<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Portal</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Arvo:wght@400;700&family=Kanit&family=Source+Sans+Pro:wght@900&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Arvo', serif;
	font-family: 'Kanit', sans-serif;
	font-family: 'Source Sans Pro', sans-serif;
	background-image:
		url('https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80');
	background-size: 100%;
	overflow: hidden;
}

legend {
	font-size: 28px;
	text-transform: uppercase;
	color: white;
	background-color: #333;
}

fieldset table {
	margin: auto;
	text-align: left;
}

fieldset {
	margin: 15px 520px;
	text-align: center;
}

table {
	padding: 10px;
	width: 500px;
}

td {
	padding: 10px;
	font-size: 23px;
}

input {
	width: 300px;
	padding: 5px;
	font-size: 20px;
}

button {
	margin-top: 20px;
	padding: 8px 16px;
	font-size: 20px;
	color: white;
	background-color: #333;
	border-radius: 5px;
	display: block;
}

button:hover {
	background-color: #111;
	border-radius: 5px;
	box-shadow: 2px 2px 20px #595959;
}

h1 {
	margin-top: 35px;
	text-align: center;
	font-size: 35px;
}

#p {
	height: 530px;
	width: 700px;
	margin: 0 auto;
	margin-top: 50px;
	padding-top: 50px;
	display: flex;
	justify-content: center;
	align-items: start;
	background-image:
		url("https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
	background-position: left;
	background-size: cover;
	background-repeat:no-repeat;
	box-shadow: 2px 2px 20px #595959;
}

h2 {
	margin-top: 35px;
	text-align: center;
	font-size: 30px;
	background-color: #FFFF8F;
}
}
</style>
</head>
<body>
	<h1 align="center" style="margin-top: 30px; text-transform: uppercase;">Hotel Paradise Admin Portal</h1>
	<div id="p">
		<div align="center">
			<form action="./create" method="post">
				<fieldset>
					<legend>- CREATE ADMIN -</legend>
					<table style="width: 600px;">
						<tr>
							<td>User Name</td>
							<td><input type="text" name="username"
								placeholder="Enter User Name" ></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="password" name="password"
								placeholder="Enter Password" ></td>
						</tr>
						<tr>
							<td>Database User</td>
							<td><input type="password" name="user"
								placeholder="Enter Password" ></td>
						</tr>
						<tr>
							<td>Database Password</td>
							<td><input type="password" name="pass"
								placeholder="Enter Password" ></td>
						</tr>
					</table>
				</fieldset>
				<button type="submit">CREATE ADMIN</button>
				<%
				if (msg != null) {
				%>
				<h2>
					<%=msg%>
				</h2>
				<%
				}
				%>
			</form>
		</div>
	</div>
</body>
</html>