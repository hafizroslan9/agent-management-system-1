<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String image = request.getParameter("image");
String id = request.getParameter("pid");
String name = request.getParameter("pname");
String description= request.getParameter("description");
int quantity= Integer.parseInt(request.getParameter("pquantity"));
double price = Double.parseDouble(request.getParameter("price"));
String category = request.getParameter("category");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_5e9f153ed6f0b20", "b45c552be3803d", "4fa79fab");
Statement st = conn.createStatement();
st.executeUpdate("insert into product (productid, productimage, productname, productdescription, productquantity, productprice,productype) values ('"+id+"','"+image+"','"+name+"','"+description+"', '"+quantity+"', '"+price+"','"+category+"')");
response.sendRedirect("index.jsp");
}


catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>