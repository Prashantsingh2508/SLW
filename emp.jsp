<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>


<%String ans1=(String)session.getAttribute("username");
if(ans1==null)
{
	response.sendRedirect("index.html");
	
}
%>

<%


try {
Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
 <meta name="author" content="Prashant" >
 </head>
<style>
body {margin:0;}

.navbar {
  overflow: hidden;
	background-color:   #d9e6e6;  
  position: fixed;
  bottom: 0;
  width: 100%;
}

.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background-color: #ff1744;
  color: black;
}

.navbar a.active {
  background-color: #ff1744;
  color: white;
}

.navbar .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .navbar a:not(:first-child) {display: none;}
  .navbar a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .navbar.responsive .icon {
    position: absolute;
    right: 0;
    bottom:0;
  }
  .navbar.responsive a {
    float: none;
    display: block;
    text-align: left;
  }

}
.m{
	position: absolute;
    left: 0;
    top: 180px;
    width: 100%;
    text-align: center;
    font-size: 18px;
	position: relative;
	 
	 
 }
.t{
	  border-radius: 100px;
	   background: skyblue;
	
	
}
<!--/// differce from bottom Navigation and distributed -->
.c{
position: -webkit-sticky;
  position: sticky;
  top: 0;
  padding: 5px;
  background-color: #ff1744;
  border: 2px solid #4CAF50;}
body {margin: 0;}

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:  #ff4081;
}

ul.topnav li {float: left;}

ul.topnav li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
ul li a {
	margin-right:2px;
	
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #4CAF50;}

ul.topnav li.right {float: right;background-color: #111;}

@media screen and (max-width: 600px){
    ul.topnav li.right, 
    ul.topnav li {float: none;}
}
</style>
</head>
<body>
	<form  action="Empdata.jsp">
		<div class="c">
			<ul class="topnav">
				<li><a href="index.html"><image src="SLW.jpg" height="50px" width="60px"></a></li>
				<li><a class="active" href="home.jsp">Home</a></li>
				<li><a href="#" class="active">News</a></li>
				<li class="right"><a href=""></a></li>
				<li class="right"><a href="logout.jsp">Logout</a></li>
				<li class="right"><a href="#"><%String ans=(String)session.getAttribute("username");out.println(ans);%>&#9989;</a></li>
			</ul>
		</div>
	<div class="m">
		<input type="text" placeholder="Enter city" style="border-color:green" name="addr" required height="20px">
		<input type="text" placeholder="Enter Category" style="border-color:green" name="cat" required height="20px">
		<button type="submit">Search</button>

<div class="navbar" id="myNavbar">
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
</form>
 <%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);



%> 
</body>

<script>
    function getStatus(){
        $.get("session.jsp", function(data){
            if(!data) {
                window.location = "logout.jsp";
            }
            setTimeout(function(){
                checkLoginStatus();
            }, 3000);
        });
    }
    $(document).ready(function(){
        gettatus();
    });
</script>
</html>