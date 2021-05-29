<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
</head>
<title>AGENT MANAGEMENT SYSTEM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

<body>

<!-- Sidenav/menu -->
<nav class="w3-sidenav w3-pale-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidenav"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-padding-xlarge w3-hide-large w3-display-topleft w3-hover-white" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
      <img height="180px" src="../pictures/liberty.png"/>
    <h3 class="w3-padding-64"><b><u>AGENT MANAGEMENT SYSTEM</u></b></h3>
  </div>
 
  <a onclick="w3_close()" class="w3-padding w3-hover-white">Home</a>
  <div class="w3-padding w3-hover-white" onclick="myAccFunc()" style="cursor:pointer">
  Product <i class="fa fa-caret-down"></i></div>
  <div id="demoAcc" class="w3-hide w3-blue-pale w3-card-4">
    <a class="w3-padding w3-hover-white" href="index.jsp" >View Product</a>
    <a class="w3-padding w3-hover-white" href="addProduct.jsp" >Add Product</a>
	<a class="w3-padding w3-hover-white" href="updateProduct.jsp" >Update Product</a>
  </div>
	<div class="w3-padding w3-hover-white" onclick="myAccFunc()" style="cursor:pointer">
	Agent <i class="fa fa-caret-down"></i></div>
		<div  class="w3-hide w3-blue-pale w3-card-4">
			<a class="w3-padding w3-hover-white" >View Agent</a>
			<a class="w3-padding w3-hover-white">Add Agent</a>
			<a class="w3-padding w3-hover-white" >Update Product</a>
		</div>
		<a href="../logout.php" class="w3-padding w3-hover-white">Order</a>
		<a onclick='confirmationLogout(this);return false;' href="../logout.php" class="w3-padding w3-hover-white">Logout</a>
  <?php }
        ?>
</nav>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-pale-blue w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-pale-blue w3-margin-right" onclick="w3_open()">☰</a>
  <span>AGENT MANAGEMENT SYSTEM</span>
</header>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">



  <!-- Header -->
  <div class="w3-container" style="margin-top:20px" id="home">
    <h1 class="w3-jumbo"><b>View Product</b></h1>
    <h1 class="w3-xxxlarge w3-text-black">Supplier : Hafiz</u></b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>

<table>
  <tr>
    <th>Product ID</th>
	<th>Product Image</th>
    <th>Product Name</th>
    <th>Product Quantity</th>
    <th>Product Price</th>
    <th>Product Description</th>
	<th>Product Type</th>
	<th colspan="2" style="text-align:center">Action</th>
	
  </tr>
  		<%
			try {
				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
			"jdbc:mysql://us-cdbr-east-04.cleardb.com:3306/heroku_5e9f153ed6f0b20", "b45c552be3803d", "4fa79fab");
			Statement st = conn.createStatement();

			String sql = "select * from product";
			resultSet = st.executeQuery(sql);
			int i=0;
			while (resultSet.next()) {
		%>
		<tr>
			<td><%=resultSet.getString("productid")%></td>
			<td><%=resultSet.getString("productimage")%></td>
			<td><%=resultSet.getString("productname")%></td>
			<td><%=resultSet.getString("productdescription")%></td>
			<td><%=resultSet.getInt("productquantity")%></td>
			<td><%=resultSet.getDouble("productprice")%></td>
			<td><%=resultSet.getString("productype")%></td>
				<td><a href="updateProduct.jsp"><button type="button">Update</button></a></td>
				<td>
				<button><a href="delete.jsp?productid=<%=resultSet.getString("productid") %>"onclick="return confirm('Are you sure?')">Delete</button></td></a>
				</td>
		</tr>
		<% 
				i++;
			}
		} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
		}
		%>
<!-- W3.CSS Container -->
<div class="w3-light-grey w3-container w3-padding-8" style="margin-top:45px;padding-right:58px"><p class="w3-right"><p align="center">© 2020 Agent Management System</p>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Accordion
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-white";
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-white", "");
    }
}
function confirmationLogout(anchor)
{
	var conf = confirm('Are you sure want to Logout?');
	if(conf)
	window.location=anchor.attr("href");
}
</script>

</body>
</html>