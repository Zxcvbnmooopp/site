<%@page import="java.sql.*"%>

<%
Connection con=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/construction_site",
"root",
"yash"
);

}
catch(Exception e){
out.println(e);
}

if(request.getParameter("save")!=null){

PreparedStatement ps=con.prepareStatement(
"insert into material(date1,supplier_name,contact_number,vehicle_number,type_vehicle,unit1,rate_amount,remark) values(?,?,?,?,?,?,?,?)"
);

ps.setString(1,request.getParameter("date1"));
ps.setString(2,request.getParameter("supplier_name"));
ps.setString(3,request.getParameter("contact_number"));
ps.setString(4,request.getParameter("vehicle_number"));
ps.setString(5,request.getParameter("type_vehicle"));
ps.setString(6,request.getParameter("unit1"));
ps.setString(7,request.getParameter("rate_amount"));
ps.setString(8,request.getParameter("remark"));

ps.executeUpdate();
}

if(request.getParameter("delete")!=null){

PreparedStatement psdel=con.prepareStatement(
"delete from material where id=?"
);

psdel.setString(1,request.getParameter("delete"));

psdel.executeUpdate();
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Material</title>

<style>

body{
font-family:Arial;
background:#FAEBD7;
}

.container{
width:90%;
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
padding:12px;
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
border-radius:5px;
font-size:18px;
margin-top:15px;
}

button:hover{
background:#2a5298;
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
padding:8px 12px;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<div class="container">

<h1>Material Invoice</h1>

<form method="post">

<input type="date" name="date1">

<input type="text" name="supplier_name"
placeholder="Supplier Name">

<input type="text" name="contact_number"
placeholder="Contact Number">

<input type="text" name="vehicle_number"
placeholder="Vehicle Number">

<input type="text" name="type_vehicle"
placeholder="Type Vehicle">

<input type="text" name="unit1"
placeholder="Unit">

<input type="text" name="rate_amount"
placeholder="Rate Amount">

<textarea name="remark"
placeholder="Remark"></textarea>

<button type="submit" name="save">
Save Material
</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Date</th>
<th>Supplier</th>
<th>Contact</th>
<th>Vehicle</th>
<th>Type</th>
<th>Unit</th>
<th>Rate</th>
<th>Remark</th>
<th>Delete</th>
</tr>

<%

Statement st=con.createStatement();

ResultSet rs=st.executeQuery(
"select * from material order by id desc"
);

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("date1")%></td>

<td><%=rs.getString("supplier_name")%></td>

<td><%=rs.getString("contact_number")%></td>

<td><%=rs.getString("vehicle_number")%></td>

<td><%=rs.getString("type_vehicle")%></td>

<td><%=rs.getString("unit1")%></td>

<td><%=rs.getString("rate_amount")%></td>

<td><%=rs.getString("remark")%></td>

<td>

<a class="deletebtn"
href="material.jsp?delete=<%=rs.getInt("id")%>">

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