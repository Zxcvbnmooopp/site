<%@page import="java.sql.*"%>
<%@include file="db.jsp"%>

<%
if(request.getParameter("save")!=null){

PreparedStatement ps=con.prepareStatement(
"insert into rmc(date1,grade1,vehicle_number,qty,remark,location1) values(?,?,?,?,?,?)"
);

ps.setString(1,request.getParameter("date1"));
ps.setString(2,request.getParameter("grade1"));
ps.setString(3,request.getParameter("vehicle_number"));
ps.setString(4,request.getParameter("qty"));
ps.setString(5,request.getParameter("remark"));
ps.setString(6,request.getParameter("location1"));

ps.executeUpdate();
}

// DELETE FUNCTION
if(request.getParameter("delete")!=null){

PreparedStatement psdel=con.prepareStatement(
"delete from rmc where id=?"
);

psdel.setString(1,request.getParameter("delete"));
psdel.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>RMC Entry</title>

<style>
body{
font-family:Arial;
background:#FAEBD7;
}

.container{
width:800px;
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

input,textarea{
width:100%;
padding:10px;
margin-top:10px;
border:1px solid gray;
border-radius:5px;
}

button{
width:100%;
padding:15px;
background:#D3D3D3;
color:#FF4500;
border:none;
margin-top:15px;
border-radius:5px;
}

button:hover{
background:#D3D3D3;
}

table{
width:100%;
margin-top:30px;
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

.deletebtn{
background:red;
color:white;
padding:6px 10px;
text-decoration:none;
border-radius:5px;
}
</style>

</head>

<body>

<div class="container">

<h1>RMC Entry</h1>

<form method="post">

<input type="date" name="date1">
<input type="text" name="grade1" placeholder="Grade">
<input type="text" name="vehicle_number" placeholder="Vehicle Number">
<input type="text" name="qty" placeholder="Quantity">
<textarea name="remark" placeholder="Remark"></textarea>
<input type="text" name="location1" placeholder="Location">

<button type="submit" name="save">Save RMC</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Date</th>
<th>Grade</th>
<th>Vehicle</th>
<th>Qty</th>
<th>Location</th>
<th>Delete</th>
</tr>

<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from rmc order by id desc");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("date1")%></td>
<td><%=rs.getString("grade1")%></td>
<td><%=rs.getString("vehicle_number")%></td>
<td><%=rs.getString("qty")%></td>
<td><%=rs.getString("location1")%></td>

<td>
<a class="deletebtn"
href="rmc.jsp?delete=<%=rs.getInt("id")%>">
Delete
</a>
</td>

</tr>

<%
}
%>

</table>

</div>

</body>
</html>