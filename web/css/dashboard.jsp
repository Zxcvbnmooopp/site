<%@page import="java.sql.*"%>
<%@include file="db.jsp"%>

<!DOCTYPE html>
<html>

<head>

<title>Construction Dashboard</title>

<style>

body{
font-family:Arial;
background:#FAEBD7;
}

.container{
width:90%;
margin:auto;
background:#E0FFFF;
padding:20px;
margin-top:20px;
border-radius:10px;
box-shadow:0px 0px 10px gray;
}

h1{
text-align:center;
color:#1e3c72;
}

h2{
background:#1e3c72;
color:white;
padding:10px;
margin-top:30px;
border-radius:5px;
}

table{
width:100%;
border-collapse:collapse;
margin-top:10px;
}

th,td{
border:1px solid black;
padding:8px;
text-align:center;
}

th{
background:#1e3c72;
color:white;
}

.btn{
background:#D3D3D3;
color:#FF4500;
padding:10px 20px;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<div class="container">

<h1>Construction Site Full Dashboard</h1>

<a href="index.jsp" class="btn">Back Home</a>

<!-- MATERIAL -->
<h2>Material Records</h2>

<table>
<tr>
<th>Date</th>
<th>Supplier</th>
<th>Vehicle</th>
<th>Type</th>
<th>Unit</th>
<th>Rate</th>
<th>Remark</th>
</tr>

<%
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from material order by id desc");

while(rs1.next()){
%>

<tr>
<td><%=rs1.getString("date1")%></td>
<td><%=rs1.getString("supplier_name")%></td>
<td><%=rs1.getString("vehicle_number")%></td>
<td><%=rs1.getString("type_vehicle")%></td>
<td><%=rs1.getString("unit1")%></td>
<td><%=rs1.getString("rate_amount")%></td>
<td><%=rs1.getString("remark")%></td>
</tr>

<%
}
%>
</table>

<!-- MACHINERY -->
<h2>Machinery Hire Records</h2>

<table>
<tr>
<th>Machinery</th>
<th>Supplier</th>
<th>Date</th>
<th>Total HR</th>
<th>Rate</th>
<th>Remark</th>
</tr>

<%
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from machinery order by id desc");

while(rs2.next()){
%>

<tr>
<td><%=rs2.getString("machinery_name")%></td>
<td><%=rs2.getString("supplier_name")%></td>
<td><%=rs2.getString("date1")%></td>
<td><%=rs2.getString("total_hr")%></td>
<td><%=rs2.getString("rate_amount")%></td>
<td><%=rs2.getString("remark")%></td>
</tr>

<%
}
%>
</table>

<!-- LABOUR -->
<h2>Labour Records</h2>

<table>
<tr>
<th>Date</th>
<th>Supplier</th>
<th>Total Labour</th>
<th>Rate</th>
<th>Remark</th>
</tr>

<%
Statement st3=con.createStatement();
ResultSet rs3=st3.executeQuery("select * from labour order by id desc");

while(rs3.next()){
%>

<tr>
<td><%=rs3.getString("date1")%></td>
<td><%=rs3.getString("supplier_name")%></td>
<td><%=rs3.getString("total_labour")%></td>
<td><%=rs3.getString("rate_amount")%></td>
<td><%=rs3.getString("remark")%></td>
</tr>

<%
}
%>
</table>

<!-- PRETTY CASH -->
<h2>Pretty Cash Records</h2>

<table>
<tr>
<th>Material</th>
<th>Supplier</th>
<th>Date</th>
<th>Amount</th>
<th>Cash</th>
<th>Remark</th>
</tr>

<%
Statement st4=con.createStatement();
ResultSet rs4=st4.executeQuery("select * from prettycash order by id desc");

while(rs4.next()){
%>

<tr>
<td><%=rs4.getString("material_name")%></td>
<td><%=rs4.getString("supplier_name")%></td>
<td><%=rs4.getString("date1")%></td>
<td><%=rs4.getString("amount")%></td>
<td><%=rs4.getString("cash1")%></td>
<td><%=rs4.getString("remark")%></td>
</tr>

<%
}
%>
</table>

<!-- RMC -->
<h2>RMC Records</h2>

<table>
<tr>
<th>Date</th>
<th>Grade</th>
<th>Vehicle</th>
<th>Qty</th>
<th>Location</th>
<th>Remark</th>
</tr>

<%
Statement st5=con.createStatement();
ResultSet rs5=st5.executeQuery("select * from rmc order by id desc");

while(rs5.next()){
%>

<tr>
<td><%=rs5.getString("date1")%></td>
<td><%=rs5.getString("grade1")%></td>
<td><%=rs5.getString("vehicle_number")%></td>
<td><%=rs5.getString("qty")%></td>
<td><%=rs5.getString("location1")%></td>
<td><%=rs5.getString("remark")%></td>
</tr>

<%
}
%>
</table>

</div>

</body>
</html>