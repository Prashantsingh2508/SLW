 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
 <meta name="author" content="Prashant" >
 </head>
<style>
body {margin:0;
    <!--background-image: url("empg.jpg");-->
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

</style>
<link rel="stylesheet" type="text/css" href="slider/engine1/style.css" />
<script type="text/javascript" src="slider/engine1/jquery.js"></script>
</head>
<body >
<div class="c">
<ul class="topnav">
<li><a href="index.html"><image src="SLW.jpg" height="70px" width="60px"></a></li>
  <li><a class="active" href="#home">Payment</a></li>
  <li><a href="bbcnews.com" class="active">SLWNews</a></li>
    <li><a href="#" class="active">Profile</a></li>

	
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
  <li class="right"><a href="index.html">Logout</a></li>
  
</ul>
</div>


<!--<marquee   scrolldelay="30"><image src="work.jpg" height="350px" width="660px"><image src="job.jpg" height="350px" width="660px"></marquee>-->
<div>
<!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<li><a href="www.errtg.cmo"><img src="slider/data1/images/pic1.jpg" alt="easy farming" title="easy farming" id="wows1_0"/></a></li>
		<li><img src="slider/data1/images/pic2.jpg" alt="pic2" title="pic2" id="wows1_1"/></li>
		<li><img src="slider/data1/images/pic3.jpg" alt="pic3" title="pic3" id="wows1_2"/></li>
		<li><a href="http://wowslider.net"><img src="slider/data1/images/pic4.jpg" alt="bootstrap carousel" title="pic4" id="wows1_3"/></a></li>
		<li><img src="slider/data1/images/slw.jpg" alt="slw" title="slw" id="wows1_4"/></li>
	</ul></div>
	<div class="ws_bullets"><div>
		<a href="#" title="easy farming"><span><img src="slider/data1/tooltips/pic1.jpg" alt="easy farming"/>1</span></a>
		<a href="#" title="pic2"><span><img src="slider/data1/tooltips/pic2.jpg" alt="pic2"/>2</span></a>
		<a href="#" title="pic3"><span><img src="slider/data1/tooltips/pic3.jpg" alt="pic3"/>3</span></a>
		<a href="#" title="pic4"><span><img src="slider/data1/tooltips/pic4.jpg" alt="pic4"/>4</span></a>
		<a href="#" title="slw"><span><img src="slider/data1/tooltips/slw.jpg" alt="slw"/>5</span></a>
	</div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.net">jquery slider</a> by WOWSlider.com v8.8</div>
<div class="ws_shadow"></div>
</div>	
<script type="text/javascript" src="slider/engine1/wowslider.js"></script>
<script type="text/javascript" src="slider/engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->

</div>

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
