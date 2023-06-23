<%@page import="com.jspider.hotelmvc.pojo.HotelPOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />

<%
String msg = (String) request.getAttribute("msg");
HotelPOJO pojo = (HotelPOJO) request.getAttribute("guest");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest Management</title>
<style type="text/css">
body {
	
	background-image:
		url('https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80');
	background-size: 100%;
	
	
}
legend{
font-size: 28px;
text-transform: uppercase;
}
.table{
margin-top:30px;
border: 2px solid black;
border-collapse: collapse;
}
.tr td{
	font-size:23px;
	color: black;
	background-color: white;
	font-family: 'Kanit', sans-serif;
}
td{
	padding: 20px;
	font-size: 23px;
}
input{
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

h2{
	margin:10px;
	text-align: center;
	font-size: 30px;
	width: inherit;
	background-color: #FFFF8F;
}
#p{
	height:610px;
	width:1400px;
	margin:0 auto;
	padding-top:20px;
	margin-top: 20px;
	padding-bottom: 20px;
	display: flex;
	justify-content: center;
	align-items: start;
	background-image:
		url("https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
	background-position: left;
	background-size: cover;
	background-repeat:no-repeat;
	box-shadow: 2px 2px 20px #595959;
	background-repeat: no-repeat;
	background-size: cover;	
}
thead {
	text-transform: uppercase;
	background-color: grey;
}
.id{
	width: 300px;
}
fieldset{
	padding-bottom: 20px;
}
</style>
</head>
<body>
	<div id="p">
	<div align="center">
	
		<%
		if (msg != null) {
		%>
		<h2>
			<%=msg%>
		</h2>
		<%
		}
		%>
		<%
		if (pojo != null) {
		%>
		</fieldset>
			</form>
		<table border="2px solid black" class="table">
			<thead>
				<td>Room No</td>
					<td>Guest Name</td>
					<td>City</td>
					<td>Id Proof</td>
					<td>Id Proof No</td>
					<td>Check In</td>
					<td>Check Out</td>
			</thead>
			<tr class="tr">
				<td><%=pojo.getRoom_no()%></td>
				<td><%=pojo.getGuest_name() %></td>
				<td><%=pojo.getCity()%></td>
				<td><%=pojo.getId_proof_name()%></td>
				<td><%=pojo.getId_proof_no()%></td>
				<td><%=pojo.getDate_in()%></td>
				<td><%=pojo.getDate_out()%></td>
			</tr>
		</table>
		<%
		}
		%>
	</div>
</div>
</body>
</html>