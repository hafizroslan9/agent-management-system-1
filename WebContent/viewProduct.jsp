<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<html>
<body>
	<table>
		<tr>
			<th>Product ID</th>
			<!--<th>Product Image</th>-->
			<th>Product Name</th>
			<th>Product Quantity</th>
			<th>Product Price</th>
			<th>Product Description</th>
			<th>Product Type</th>
			<th>Action</th>

		</tr>
		<tr>
			<td>D001</td>
			<!--<td><img src="../uploadStock/driedstrawberry.jpeg"style="width:100px;height:100px;"></td>-->
			<td>Dried Strawberry</td>
			<td>50</td>
			<td>RM6.60</td>
			<td>blablalv</td>
			<td>Dry</td>
			<td><button type="button">Update</button></td>
		</tr>
		<%
			try {
				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_5e9f153ed6f0b20", "b45c552be3803d", "4fa79fab");
				Statement st = conn.createStatement();
				String sql = "select * from product";
				resultSet = st.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getString("productid")%></td>
			<td><%=resultSet.getString("productname")%></td>
			<td><%=resultSet.getString("productdescription")%></td>
			<td><%=resultSet.getInt("productquantity")%></td>
			<td><%=resultSet.getDouble("productprice")%></td>
			<td><%=resultSet.getString("productype")%></td>
		</tr>
		<%
			}
		} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
		}
		%>
	</table>
</body>
</html>