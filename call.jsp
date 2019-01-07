 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@page import="java.util.ArrayList" %>

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
body {margin:0;
   
	 min-height: 500px;
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
		background-color:   #d9e6e6;

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

.navbar {
  overflow: hidden;
  background-color: #333;  
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
  background-color: #ddd;
  color: black;
}

.navbar a.active {
  background-color: #4CAF50;
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
<!--/// differce from bottom Navigation and distributed -->
.c{
position: -webkit-sticky;
  position: sticky;
  top: 0;
  padding: 5px;
  background-color: #cae8ca;
  border: 2px solid #4CAF50;}
body {margin: 0;}

ul.topnav {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
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

<!--    table css -->
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body >
<div class="c">
<ul class="topnav">
<li><a href="index.html"><image src="SLW.jpg" height="70px" width="60px"></a></li>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="bbcnews.com" class="active">SLWNews</a></li>
    <li><a href="emp.jsp" class="active">search labour and add</a></li>
	<li><a href="#" class="active">Total Expendeture</a></li>
	
	<%String ans1=(String)session.getAttribute("username");
if(ans1==null)
{
	response.sendRedirect("index.html");
	
}
else{
%>
  <li class="right"><a href="">
  <%String ans=(String)session.getAttribute("username");
  out.println(ans);
}%>&#9989;</a></li>
  <li class="right"><a href="logout.jsp">Logout</a></li>
</ul>
</div>

<div>
<%

String id=request.getParameter("userid");
	
	String ans2=(String)session.getAttribute("username");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");  
		PreparedStatement ps=con.prepareStatement("insert into userselection values(?,?)");	
			ps.setString(1,id);
			ps.setString(2,ans2);
			int i=ps.executeUpdate();
			if(i>0)
			{
				out.println("<script>alert(\"you are done\")</script>");
				
				
			}
			
	}catch(Exception e)
	{
		out.println(e);
		
	}
	
%>

</div>
<div>
<center>
<table border=""  id="customers">
   <tr>
      <!--<th>Uid</th>-->
        <th>name</th>
        <th>place</th>
        <th>Category</th>
		<th>mno</th>
		<th>action</th>
		
   </tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");  
PreparedStatement ps1=conn.prepareStatement("select  eid,ename,eplace,ecat,emno from empcat   where eid='"+id+"'");	
    ResultSet rs1 = ps1.executeQuery();
	while(rs1.next())
	{
%>
	<tr>
				
                    <td><%=rs1.getString("ename")%></td>
                    <td><%=rs1.getString("eplace")%></td>
                    <td><%=rs1.getString("ecat")%></td>
					<td><%=rs1.getLong("emno")%></td>
				<td><a href="message.jsp?empno=<%=rs1.getLong("emno")%>"> &#9993;</a></td>
                    
	</tr>
<%
}





%>
</div>


<!--<marquee   scrolldelay="30"><image src="work.jpg" height="350px" width="660px"><image src="job.jpg" height="350px" width="660px"></marquee>-->

<!-- set search bar in website -->
<!--<div class="m">
<input type="text" placeholder="Enter city" style="border-color:green" name="addr" required height="20px">
  <a href="emp.jsp"><button>Search</button></a>
</div>-->
<!--   bottom navigation  -->
<div class="navbar" id="myNavbar">
  <a href="contact.jsp">Contact</a>
  <a href="#about">About</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
<!-- it is for location purpose  -->
<!--<div id="map" style="width:200px;height:200px;background:pink"></div>
<button onclick="getLocation()">Location</button>
-->



 <%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

%> 
<script>

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } 
}

function showPosition(position) {
   var a= position.coords.latitude; 
 var b= position.coords.longitude;
var mapOptions = {
    center: new google.maps.LatLng(a, b),
    zoom: 10,
    mapTypeId: google.maps.MapTypeId.HYBRID
}
var map = new google.maps.Map(document.getElementById("map"), mapOptions);
}
</script>

<script src="AIzaSyAQxm_cAdEILZMZa-D3FY2N46T31EPPFlY=showPosition"></script>

<script>
function myFunction() {
    var x = document.getElementById("myNavbar");
    if (x.className === "navbar") {
        x.className += " responsive";
    } else {
        x.className = "navbar";
    }
}
</script>

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
</body>
</html>
