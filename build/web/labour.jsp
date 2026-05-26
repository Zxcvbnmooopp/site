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
out.println("DB Error: " + e);
}

// INSERT DATA
if(request.getParameter("save")!=null){

PreparedStatement ps=con.prepareStatement(
"insert into labour(date1,supplier_name,labour_mf,total_labour,rate_amount,remark) values(?,?,?,?,?,?)"
);

ps.setString(1,request.getParameter("date1"));
ps.setString(2,request.getParameter("supplier_name"));
ps.setString(3,request.getParameter("labour_mf"));
ps.setString(4,request.getParameter("total_labour"));
ps.setString(5,request.getParameter("rate_amount"));
ps.setString(6,request.getParameter("remark"));

ps.executeUpdate();
}

// DELETE DATA
if(request.getParameter("delete")!=null){

PreparedStatement psdel=con.prepareStatement(
"delete from labour where id=?"
);

psdel.setString(1,request.getParameter("delete"));
psdel.executeUpdate();
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Labour Entry</title>

<style>
body{
font-family:Arial;
background:#FAEBD7;
}

.container{
width:700px;
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
margin-top:15px;
border-radius:5px;
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

<h1>Labour Entry</h1>

<form method="post">

<input type="date" name="date1" required>
<input type="text" name="supplier_name" placeholder="Supplier Name" required>
<input type="text" name="labour_mf" placeholder="Labour M/F" required>
<input type="text" name="total_labour" placeholder="Total Labour" required>
<input type="text" name="rate_amount" placeholder="Rate Amount" required>
<textarea name="remark" placeholder="Remark"></textarea>

<button type="submit" name="save">Save Labour</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Date</th>
<th>Supplier</th>
<th>Total Labour</th>
<th>Rate</th>
<th>Delete</th>
</tr>

<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from labour order by id desc");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("date1")%></td>
<td><%=rs.getString("supplier_name")%></td>
<td><%=rs.getString("total_labour")%></td>
<td><%=rs.getString("rate_amount")%></td>

<td>
<a class="deletebtn"
href="labour.jsp?delete=<%=rs.getInt("id")%>">
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