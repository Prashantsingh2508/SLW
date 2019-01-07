  <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.io.*" %>

<%
String ans=(String)session.getAttribute("username");
if(ans==null)
{
	
	
	String userid = request.getParameter("name");    
    String pwd = request.getParameter("psw");

	Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
   PreparedStatement ps=con.prepareStatement("select *from cust where mail='" + userid + "' and password='" + pwd + "'");
    ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
	String name=rs.getString("mail");
	String password=rs.getString("password");
	//if(name ==null)

	if(name.equals(userid) && password.equals(pwd))
	{

        session.setAttribute("username", userid);

	response.sendRedirect("home.jsp");
	}
	else{
  
	out.println("Invalid password <a href='index.html'>try again</a>");
	}
   }
}
	

else{
	response.sendRedirect("home.jsp");
	
}
%>
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
	body 
	{
		font-family: "Times New Roman",Times,Serif,30;
		<!--background-image: url("p98.png");-->
			background-color:   #d9e6e6;
	}
.form{  
  background:#ffffff;
  padding: 60px;
  max-width: 600px;
  margin: 40px auto;
  border-radius: 100px;
  box-shadow: 0 4px 10px 4px rgba(19, 35, 47, 0.3);}

.container {
    padding: 16px;
    
}
input, input {
    width: 100%;
    padding: 15px;
    margin: 2px 10px 10px ;
 
    border: none;
    background: skyblue;
}

input:focus, input:focus {
    background-color: pink;
    outline: none;
}


/* Set a style for all buttons */
.loginbean {
    background-color: green;
    color: white;
    padding: 16px 20px;
    margin: 8px 4px;
    border: 1px;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.loginbean:hover {
    opacity:1;
	background-color:red;
}

/* Add a blue text color to links */
a {
    color: darkred;
}
.signin {
    background-color: #f1f1f1;
    text-align: center;
}


</style>
<script type="text/javascript">
	function vae()
		{
			var e=document.getElementById("nam").value;
			var reg=/^([a-z0-9_\+-]+)(\.[a-z0-9_\+-]+)*@([a-z]+)(\.[a-z]+)*\.[a-z]{2,4}$/
				if(reg.test(e))
				{
					
				document.getElementById("dispr").innerHTML="Email is correct";

				}
				else
				{
		
					document.getElementById("dispr").innerHTML="Email is not correct";
					return false;
				}
		}
		
		function vde()
		{
			
			if(document.getElementById("password1").value.length<8)
			{
				document.getElementById("display").innerHTML="password must be graeter then 8";
				return false;
			}
		}

</script>
</head>

<body>
<div class="form">

<form style="border:5px solid lightgreen" action="login1.jsp">
  <div class="container">
    <h1 align="center"><span style="color:blue;">Login</span></h1>
 
	<input type="text" placeholder="Enter Email or Phone" style="border-color:green" name="name" id="nam" onkeypress="vae()" required>
	<span id="dispr"></span>
	<input type="password" placeholder="Enter Password" name="psw" id="password1" onkeypress="vde()" required>
	<span id="display"></span>
	
    <button type="submit" class="loginbean" >Login</button>
	
  </div>
  <div class="container signin">
    <p>Don't have an account? <a href="Register.html" title="Registration for new user" style="border:0;">Sign up</a>.</p>
  </div>
  


  
  
</form>
</div>
</body>
</html>
