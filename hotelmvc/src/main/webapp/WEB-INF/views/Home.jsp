<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jspider.hotelmvc.pojo.HotelPOJO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="NavBar.jsp" />
<%
String msg = (String) request.getAttribute("msg");
List<HotelPOJO> guests = (List<HotelPOJO>) request.getAttribute("guestList");
HotelPOJO guest = (HotelPOJO) request.getAttribute("guest");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Paradise</title>
<style type="text/css">
body {
	
	background-image:
		url('https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg');
	background-size: 100%;
	background-size: cover;
	background-repeat:no-repeat;
		overflow: hidden;
	
	
}
#p{
	position:absolute;
	width: 1520px;
	height: 1000px;
	margin-top: -10px;
	
}
img{
	background-size: cover;
	background-position:bottom;
	background-repeat:no-repeat;
	width: 1600px;
	height: 1000px;
	filter:blur(4px);
	
	
}
#booked{
	top:20px;
	left:50px;
	position:absolute;
	height:550px;
	width:1000px;
	text-align: center;
	color: white;
	text-transform: uppercase;
	font-size: 28px;
	text-shadow: 1px 2px 3px #4a4646;
}
.c1{

	background-color: rgba(251, 238, 245, 0.7);
	top:100px;
	left:50px;
	position:absolute;
	height:550px;
	width:1000px;
	padding:0px;
	display: flex;
	flex-flow:column;
	justify-content: top;
	overflow-X:hidden;	
	overflow-Y: scroll;
	
}
thead {
	text-transform: uppercase;
	background-color: grey;
}
.table{
border: 2px solid black;
border-collapse: collapse;
padding: 5px;

}
.tr td{
	font-size:23px;
	color: #111;
	background-color: transparent	;
	font-family: 'Kanit', sans-serif;
}
td{
	padding:5px 20px;
	font-size: 20px;
}
#empty{
	top:20px;
	right:40px;
	position:absolute;
	height:550px;
	width:400px;
	color: white;
	text-transform: uppercase;
	font-size: 28px;
	text-shadow: 1px 2px 3px #4a4646;
}
#empty h1{
	width: 400px;
	text-align: center;
}
.c2{
	background-color: rgba(251, 238, 245, 0.7);
	top:100px;
	right:40px;
	position:absolute;
	height:550px;
	width:400px;
	padding:0px;
	display: flex;
	flex-flow:column;
	justify-content: top;
	overflow-X:hidden;	
	overflow-Y: scroll;
}
button {
padding:2px 5px;
	font-size: 18px;
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
</style>
</head>
<body>
<div id="p">
	<img alt="" src="https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg">
	<div id="booked">
	<h1 >Booked Rooms </h1>
	</div>
	<div class="c1">
		<%if(guests !=null) {%>
		<table border="2px solid black" class="table">
			<thead>
				<tr>
					<td style="width: 100px; text-align: center;">RO.NO</td>
					<td style="width: 400px;">Guest Name</td>
					<td style="width: 150px; text-align: center;">Check Out</td>
					<td style="width: 150px; text-align: center;">Details</td>
				</tr>
			</thead>
			<%
			for (HotelPOJO pojo : guests) {
			%>
			<tr class="tr">
				<td style="text-align: center;"><%=pojo.getRoom_no()%></td>
				<td><%=pojo.getGuest_name() %></td>
				<td style="text-align: center;"><%=pojo.getDate_out() %></td>
				<td style="display: flex; justify-content: center; align-items: center;">
				<form action="./search" method="post">
					<input type="text" name="id" value="<%=pojo.getRoom_no()%>" hidden="true">
				<button type="submit">MORE</button></td>
				</form>
			</tr>
			<%
			}
			%>
		</table>
		<%} %>
		</div>
		<div id="empty">
	<h1>Empty Room</h1>
	</div>
	<div class="c2">
		<%if(guests !=null) {%>
		<table border="2px solid black" class="table">
			<thead>
				<tr>
					<td style="text-align: center;">ROOM .NO</td>
				</tr>
			</thead>
			<%
			List<Integer> rooms=new ArrayList();
			for (HotelPOJO pojo : guests) {
					rooms.add(pojo.getRoom_no());
					
			}
			for(int i=1;i<=20;i++){
				if(!rooms.contains(i)){
					%>
					<tr class="tr">
						<td style="text-align: center; background-color: transparent;"><%= i %></td>
					</tr>	
				<% }
			}
			%>
			
		</table>
		<%}%>
	</div>
</div>


</body>
</html>