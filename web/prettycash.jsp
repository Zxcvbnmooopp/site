<%@page import="java.sql.*"%>
<%@include file="db.jsp"%>

<%
try{

// SAVE DATA
if(request.getParameter("save")!=null){

PreparedStatement ps=con.prepareStatement(
"insert into prettycash(material_name,supplier_name,date1,rate1,amount,cash1,remark) values(?,?,?,?,?,?,?)"
);

ps.setString(1,request.getParameter("material_name"));
ps.setString(2,request.getParameter("supplier_name"));
ps.setString(3,request.getParameter("date1"));
ps.setString(4,request.getParameter("rate1"));
ps.setString(5,request.getParameter("amount"));
ps.setString(6,request.getParameter("cash1"));
ps.setString(7,request.getParameter("remark"));

ps.executeUpdate();
out.println("<script>alert('Saved Successfully');</script>");
}

// DELETE DATA
if(request.getParameter("delete")!=null){

PreparedStatement psdel=con.prepareStatement(
"delete from prettycash where id=?"
);

psdel.setString(1,request.getParameter("delete"));
psdel.executeUpdate();

out.println("<script>alert('Deleted Successfully');</script>");
}

}
catch(Exception e){
out.println("Error: " + e);
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Pretty Cash</title>

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
cursor:pointer;
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

<h1>Pretty Cash Entry</h1>

<form method="post">

<input type="text" name="material_name" placeholder="Material Name" required>
<input type="text" name="supplier_name" placeholder="Supplier Name" required>
<input type="date" name="date1" required>
<input type="text" name="rate1" placeholder="Rate" required>
<input type="text" name="amount" placeholder="Amount" required>
<input type="text" name="cash1" placeholder="Cash" required>

<textarea name="remark" placeholder="Remark"></textarea>

<button type="submit" name="save">Save</button>

</form>

<table>

<tr>
<th>ID</th>
<th>Material</th>
<th>Supplier</th>
<th>Date</th>
<th>Amount</th>
<th>Cash</th>
<th>Delete</th>
</tr>

<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from prettycash order by id desc");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("material_name")%></td>
<td><%=rs.getString("supplier_name")%></td>
<td><%=rs.getString("date1")%></td>
<td><%=rs.getString("amount")%></td>
<td><%=rs.getString("cash1")%></td>

<td>
<a class="deletebtn"
href="prettycash.jsp?delete=<%=rs.getInt("id")%>">
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