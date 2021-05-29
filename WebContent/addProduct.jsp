<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

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
    <a class="w3-padding w3-hover-white" href="index.jsp">View Product</a>
    <a class="w3-padding w3-hover-white" href="../addProduct.jsp">Add Product</a>
	<a class="w3-padding w3-hover-white" >Update Product</a>
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
    <h1 class="w3-jumbo"><b>Add Product</b></h1>
    <h1 class="w3-xxxlarge w3-text-black">Supplier : Hafiz</u></b></h1>
    <hr style="width:50px;border:5px solid black" class="w3-round">
  </div>
   <fieldset>
  <legend>Please fill all the field</legend>
<form  action="addProductAction.jsp" method="post" >
<label for="pic">Upload picture:</label><br>
  <input type="file" id="myFile" name="image" size="1000000"><br>
  <label for="sname">Product id:</label><br>
  <input type="text" id="fname" name="pid"><br>
  <label for="sname">Product name:</label><br>
  <input type="text" id="fname" name="pname"><br>
  <label for="sdesc">Product Description:</label><br>
  <textarea id="w3review" name="description" rows="4" cols="50"></textarea><br>
  <label for="squantity">Product Quantity:</label><br>
  <input type="text" id="lname" name="pquantity"><br>
  <label for="squantity">Product Price:</label><br>
  <input type="text" id="lname" name="price"><br>
  <label for="scategory">Product Category:</label><br>
  <select id="category" name="category" onChange="productCheck(this)">
    <option value="default">-</option>
    <option value="wet">Wet</option>
    <option value="dry">Dry</option>
    </select>
    <input type="submit" value="submit">
</form>
</fieldset>
 <!-- Photo grid (modal) 
	<div class="w3-row-padding">
		<div class="w3-half">
		<img src="../pictures/group.jpg" style="width:100%" onclick="onClick(this)" alt="Signature Liberty Hotel">
		<img src="../pictures/hotel.gif" style="width:100%" onclick="onClick(this)" alt="Hotel.gif">
		</div>
    <div class="w3-half">
		<img src="../pictures/bed.jpg" style="width:100%" onclick="onClick(this)" alt="Bed">
		<img src="../pictures/toilet.jpg" style="width:100%" onclick="onClick(this)" alt="Kids.jpg">
    </div></div>
	
Modal for full size images on click
  <div id="modal01" class="w3-modal w3-black w3-padding-0" onclick="this.style.display='none'">
    <span class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright">×</span>
    <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
      <img id="img01" class="w3-image">
      <p id="caption"></p>
    </div>
  </div> -->

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
function productCheck(that) {
    if (that.value == "wet") {
		document.getElementById("sflavour").style.display = "block";
		document.getElementById("svolume").style.display = "block";
		document.getElementById("sweight").style.display = "none";
		document.getElementById("stype").style.display = "none";
    } 
	else if (that.value == "dry") {
		document.getElementById("sflavour").style.display = "none";
		document.getElementById("svolume").style.display = "none";
		document.getElementById("sweight").style.display = "block";
		document.getElementById("stype").style.display = "block";
    }
	else{
		document.getElementById("sflavour").style.display = "none";
		document.getElementById("svolume").style.display = "none";
		document.getElementById("sweight").style.display = "none";
		document.getElementById("stype").style.display = "none";
	}
}
</script>

</body>
</html>