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
%>