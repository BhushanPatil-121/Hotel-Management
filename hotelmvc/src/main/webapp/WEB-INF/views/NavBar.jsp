<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Arvo:wght@400;700&family=Kanit&family=Source+Sans+Pro:wght@900&display=swap" rel="stylesheet">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
body{
font-family: 'Arvo', serif;
font-family: 'Kanit', sans-serif;
font-family: 'Source Sans Pro', sans-serif;
}
fieldset table {
	margin: auto;
	text-align: left;
} 
fieldset {
	margin: 15px 520px;
	text-align: center;
}
legend {
	color: white;
	background-color: #333;
}
ul {
	list-style-type: none;
	background-color: black;
	overflow: hidden;
	background-color: #333;
	height: 80px;
	display:flex;
	justify-content: end;
	align-items: center; 
	margin-bottom: 10px;
}
li {
	float: right;
	text-transform: uppercase;
}
li a {
	width:100px;
	border: 1px solid;
	display: block;
	margin: 6px;
	padding: 10px 16px;
	display:flex;
	justify-content: center;
	align-items: center; 
	font-size: 18px;
	background-color: #595959;
	border-radius: 20px;
	text-align: center;
}
li a:hover {
	background-color: #111;
	border-radius: 20px;
	box-shadow: 2px 2px 20px #595959;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>
	<ul>
		<li><a style="color: white;" href="./home">Home</a></li>
		<li><a style="color: white;" href="./add">Add</a></li>
		<li><a style="color: white;" href="./update">Update </a></li>
		<li><a style="color: white;" href="./remove">DElete</a></li>
		<li><a style="color: white;" href="./searchHistory">History</a></li>
		<li><a style="color: white; margin-right: 20px;" href="./logout">Logout</a></li>
	</ul>
</body>
</html>