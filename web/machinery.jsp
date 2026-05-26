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
"insert into machinery(machinery_name,supplier_name,date1,reading_start,reading_stop,clock_start,clock_stop,total_hr,rate_amount,remark) values(?,?,?,?,?,?,?,?,?,?)"
);

ps.setString(1,request.getParameter("machinery_name"));
ps.setString(2,request.getParameter("supplier_name"));
ps.setString(3,request.getParameter("date1"));
ps.setString(4,request.getParameter("reading_start"));
ps.setString(5,request.getParameter("reading_stop"));
ps.setString(6,request.getParameter("clock_start"));
ps.setString(7,request.getParameter("clock_stop"));
ps.setString(8,request.getParameter("total_hr"));
ps.setString(9,request.getParameter("rate_amount"));
ps.setString(10,request.getParameter("remark"));

ps.executeUpdate();
}

if(request.getParameter("delete")!=null){

PreparedStatement psdel=con.prepareStatement(
"delete from machinery where id=?"
);

psdel.setString(1,request.getParameter("delete"));
psdel.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Machinery Hire</title>

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
padding:6px 10px;
text-decoration:none;
border-radius:5px;
}

</style>
</head>

<body>

<div class="container">

<h1>Machinery Hire</h1>

<form method="post">

<input type="text" name="machinery_name" placeholder="Machinery Name">
<input type="text" name="supplier_name" placeholder="Supplier Name">
<input type="date" name="date1">

<input type="text" name="reading_start" placeholder="Reading Start">
<input type="text" name="reading_stop" placeholder="Reading Stop">

<input type="time" name="clock_start">
<input type="time" name="clock_stop">

<input type="text" name="total_hr" placeholder="Total Hours">
<input type="text" name="rate_amount" placeholder="Rate Amount">

<textarea name="remark" placeholder="Remark"></textarea>

<button type="submit" name="save">Save Machinery</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Machinery</th>
<th>Supplier</th>
<th>Date</th>
<th>Total HR</th>
<th>Rate</th>
<th>Remark</th>
<th>Delete</th>
</tr>

<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from machinery order by id desc");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("machinery_name")%></td>
<td><%=rs.getString("supplier_name")%></td>
<td><%=rs.getString("date1")%></td>
<td><%=rs.getString("total_hr")%></td>
<td><%=rs.getString("rate_amount")%></td>
<td><%=rs.getString("remark")%></td>

<td>
<a class="deletebtn"
href="machinery.jsp?delete=<%=rs.getInt("id")%>">
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