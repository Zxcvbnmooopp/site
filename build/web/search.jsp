<%@page import="java.sql.*"%>
<%@include file="db.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>Search</title>

<style>
body{
font-family:Arial;
background:#FAEBD7;
}

.container{
width:750px;
margin:auto;
background:#E0FFFF;
padding:30px;
margin-top:30px;
border-radius:10px;
box-shadow:0px 0px 10px gray;
}

h1{
text-align:center;
color:#1e3c72;
}

input{
padding:10px;
width:45%;
margin-top:10px;
border:1px solid gray;
border-radius:5px;
}

button{
padding:12px;
background:#D3D3D3;
color:#FF4500;
border:none;
border-radius:5px;
margin-top:10px;
}

button:hover{
background:#2a5298;
}

table{
width:100%;
margin-top:20px;
border-collapse:collapse;
}

th,td{
border:1px solid black;
padding:10px;
text-align:center;
}

th{
background:#1e3c72;
color:white;
}
</style>

</head>

<body>

<div class="container">

<h1>Search Material (Date Wise)</h1>

<form method="post">

<input type="date" name="from_date" required>
<input type="date" name="to_date" required>

<button type="submit" name="search">Search</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Date</th>
<th>Supplier</th>
<th>Vehicle</th>
<th>Rate</th>
</tr>

<%
try{

if(request.getParameter("search")!=null){

String from=request.getParameter("from_date");
String to=request.getParameter("to_date");

if(con!=null){

PreparedStatement ps=con.prepareStatement(
"select * from material where date1 between ? and ?"
);

ps.setString(1,from);
ps.setString(2,to);

ResultSet rs=ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("date1")%></td>
<td><%=rs.getString("supplier_name")%></td>
<td><%=rs.getString("vehicle_number")%></td>
<td><%=rs.getString("rate_amount")%></td>
</tr>

<%
}
}

}
}
catch(Exception e){
out.println("Error: " + e);
}
%>

</table>

</div>

</body>
</html>