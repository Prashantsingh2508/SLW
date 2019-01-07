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

<!DOCTYPE html>
<html>
<head>
	<title>SLW</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
 <meta name="author" content="Prashant" >
 </head>
<style>
body {margin:0;
	background-color:   #d9e6e6;}

.navbar {
  overflow: hidden;
  background-color: #ff1744;  
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



<!--  table  -->
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
<body>
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
String add=request.getParameter("addr");
String cat=request.getParameter("cat");
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
   Statement statement=con.createStatement();
 ResultSet rs = statement.executeQuery("select  eid,ename,eplace,ecat,emno from empcat   where eplace='"+add+"' and ecat='"+cat+"'");
	while(rs.next())
	{
%>
	<tr>
					<!--<td><%=rs.getString("eid")%></td>-->
                    <td><%=rs.getString("ename")%></td>
                    <td><%=rs.getString("eplace")%></td>
                    <td><%=rs.getString("ecat")%></td>
					<td><%=rs.getLong("emno")%></td>
				<td><a href="call.jsp?userid=<%=rs.getString("eid")%>">select</a></td>
                    
	</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>

</table>
</center>
</div>




<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);



%> 
<div class="navbar" id="myNavbar">
  <a href="contact.jsp">Contact</a>
  <a href="#about">About</a>
  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
</div>
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