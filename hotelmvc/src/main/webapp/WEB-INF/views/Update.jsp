<%@page import="java.util.List"%>
<%@page import="com.jspider.hotelmvc.pojo.HotelPOJO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="NavBar.jsp" />

<%
String msg = (String) request.getAttribute("msg");
List<HotelPOJO> guests = (List<HotelPOJO>) request.getAttribute("guestList");
HotelPOJO guest = (HotelPOJO) request.getAttribute("guest");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Paradise</title>
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
padding: 5px;

}
.tr td{
	font-size:23px;
	color: #111;
	background-color: white;
	font-family: 'Kanit', sans-serif;
}
td{
	padding:5px 20px;
	font-size: 20px;
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
	background-color: #FFFF8F;
}


#p{
	height:610px;
	width:1500px;
	margin:0 auto;
	padding-top:20px;
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: start;
	background-image:
		url("https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
	background-position: left;
	background-size: cover;
	background-repeat:no-repeat;
	box-shadow: 2px 2px 20px #595959;
	overflow-X:hidden;	
	overflow-Y: scroll;
	padding-bottom: 20px;
}
#c1{
	width:1400px;
	margin:0 auto;
	margin-top:-15px;
	border-bottom:2px solid #595959;
	background-image:
		url("https://images.unsplash.com/photo-1615715035999-516964e790a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
	background-position: left;
	background-size: cover;
	background-repeat:no-repeat;
	position: fixed;
	display: flex;
	justify-content: center;
	align-items: center;
}
#c2{

	margin-top: 250px;
}
thead {
	text-transform: uppercase;
	background-color: grey;
}
.id{
	width: 300px;
	padding:20px;
}
.id input{
width: 400px;}
fieldset{
	padding-bottom: 20px;
}
select {
	width: 350px;
	padding: 5px;
	font-size: 20px;
}
</style>
</head>
<body>
	<div id="p">
	
	<%
		if(guest != null){
		%>
	<div id="c1" align="center" style="border-bottom: 0px solid">
				<form action="./updateData" method="post">
		<fieldset>
      <legend>UPDATE GUEST DATA</legend>
      <table style="width: 700px;">
        <tr>
          <td>Room No</td>
          <td>
            <input
              type="number"
              name="room"
              placeholder="Enter Room No"
              contenteditable="false"
              value="<%=guest.getRoom_no() %>"
            />
          </td>
        </tr>
        <tr>
          <td>Name</td>
          <td>
            <input
              type="text"
              name="name"
              placeholder="Enter Guest Name"
              required="required"
              value="<%=guest.getGuest_name()%>"
            />
          </td>
        </tr>
        <tr>
          <td>City</td>
          <td>
            <input
              type="text"
              name="city"
              placeholder="Enter Guest City"
              required="required"
              value="<%=guest.getCity() %>"
            />
          </td>
        </tr>
        <tr>
          <td>Id Proof</td>
          <td>
            <select name="id_name" >
              <option >Aadhar Card</option>
              <option >Pan Card</option>
              <option >Voter Card</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>Id Proof Number</td>
          <td>
            <input
              type="text"
              name="id_no"
              placeholder="Enter id Proof Number"
              required="required"
              value="<%=guest.getId_proof_no() %>"
            />
          </td>
        </tr>

        <tr>
          <td>Check In Date</td>
          <td>
            <input
              type="date"
              name="date_in"
              required="required"
              value="<%=guest.getDate_in() %>"
            />
          </td>
        </tr>
        <tr>
          <td>Check Out Date</td>
          <td>
            <input
              type="date"
              name="date_out"
              required="required" 
              value="<%=guest.getDate_out()%>"
            />
          </td>
        </tr>
   
      </table>
    </fieldset>
			<button type="submit">UPDATE</button>
			</form>
			</div>
		<%
		}else{
		%>
		<div id="c1" >
		<form action="./update" method="post">
			<fieldset>
				<legend> - Update guest - </legend>
				<table style="width: 450px;">
					<tr>
						<td class="id">Enter ID</td>
						<td ><input type="number" name="id" required="required"></td>
					</tr>
				</table>
			<button type="submit">SELECT</button>
			<%
			if (msg != null){
			%>
		<h2>
			<%=msg%>
		</h2>
		<%
		}
		%>
		<%
		if (guests != null) {
		%>
			</fieldset>
		</form>
		
		</div>
		
		<div id="c2">
		<table border="2px solid black" class="table">
			<thead>
				<tr>
					<td>Room No</td>
					<td>Guest Name</td>
					<td>City</td>
					<td>Id Proof</td>
					<td>Id Proof No</td>
					<td>Check In</td>
					<td>Check Out</td>
				</tr>
			</thead>
			<%
			for (HotelPOJO pojo : guests) {
			%>
			<tr class="tr">
				<td><%=pojo.getRoom_no()%></td>
				<td><%=pojo.getGuest_name() %></td>
				<td><%=pojo.getCity()%></td>
				<td><%=pojo.getId_proof_name()%></td>
				<td><%=pojo.getId_proof_no()%></td>
				<td><%=pojo.getDate_in()%></td>
				<td><%=pojo.getDate_out()%></td>
			</tr>
			<%
			}
			%>
		</table>
		</div>
		<%
		}
		%>
		
		<%
		}
		%>
		
		
</div>
</body>
</html>