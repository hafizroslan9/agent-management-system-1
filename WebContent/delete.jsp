<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>


<%
String id=request.getParameter("productid");

try
		{
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		PreparedStatement pst;
        ResultSet rs;

		out.println("masuk");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
		("jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_5e9f153ed6f0b20", "b45c552be3803d", "4fa79fab");
		pst = conn.prepareStatement("delete from product where productid = ?");
        pst.setString(1, id);
       	pst.executeUpdate();
       	%>  <html>
       		<body>
	       	<script>
	        alert("Form has been submitted");
	    	</script>
	    	</body>       	
	    	</html>
		<%
		response.sendRedirect("index.jsp");

		}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>