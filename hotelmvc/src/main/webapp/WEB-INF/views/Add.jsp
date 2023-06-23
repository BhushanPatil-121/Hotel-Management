<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />
<%
String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- Hotel Paradise -</title>
<style type="text/css">
body {
	background-image:
		url('https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80');
	background-size: 100%;
	overflow: hidden;
}

legend {
	font-size: 28px;
	text-transform: uppercase;
}

table {
	padding: 5px;
	width: 700px;
}

td {
	padding: 8px;
	font-size: 23px;
}

input {
	width: 450px;
	padding: 5px;
	font-size: 20px;
}

select {
	width: 350px;
	padding: 5px;
	font-size: 20px;
}

button {
	padding: 8px 16px;
	font-size: 20px;
	color: white;
	background-color: #333;
	border-radius: 5px;
	font-family: 'Kanit', sans-serif;
}

button:hover {
	background-color: #111;
	border-radius: 5px;
	box-shadow: 2px 2px 20px #595959;
}

h2 {
	margin-top:20px;
	text-align: center;
	font-size: 30px;
	width: 500px;
	background-color: #FFFF8F;
}

#p {
	height: 640px;
	width: 800px;
	margin: 0 auto;
	padding-top: 30px;
	display: flex;
	justify-content: center;
	align-items: start;
	background-image:
		url("https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
	background-position: left;
	background-size: cover;
	background-repeat: no-repeat;
	box-shadow: 2px 2px 20px #595959;
}
</style>
</head>
<body>
	<div id="p">
		<div align="center">
			<form action="./add" method="post">
				<fieldset>
					<legend>ADD GUEST INFORMATION</legend>
					<table>
						<tr>
							<td>Room No</td>
							<td><input type="number" name="room"
								placeholder="Select Room No" max="20" min="1" required="required" /></td>
						</tr>
						<tr>
							<td>Name</td>
							<td><input type="text" name="name"
								placeholder="Enter Guest Name" required="required" /></td>
						</tr>
						<tr>
							<td>City</td>
							<td><input type="text" name="city"
								placeholder="Add Guest City" required="required" /></td>
						</tr>
						<tr>
							<td>Select Id Proof</td>
							<td><select name="id_name">
									<option  autofocus="autofocus">Aadhar
										Card</option>
									<option>Pan Card</option>
									<option>Voter Card</option>
							</select></td>
						</tr>
						<tr>
							<td>Id Proof Number</td>
							<td><input type="text" name="id_no"
								placeholder="Add Id Proof Number" required="required" /></td>
						</tr>

						<tr>
							<td>Check In Date</td>
							<td><input type="date" name="date_in" required="required" />
							</td>
						</tr>
						<tr>
							<td>Check Out Date</td>
							<td><input type="date" name="date_out" required="required"
								value="date-in" /></td>
						</tr>

					</table>
				</fieldset>
				<button type="submit">ADD</button>
				<%
				if (msg != null) {
				%>
				<h2><%=msg%></h2>
				<%
				}
				%>
			</form>
		</div>
	</div>
</body>
</html>