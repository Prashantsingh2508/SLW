import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.*;

public class insert extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		PrintWriter out = response.getWriter();
		
		
		//Here we get data from Html
		String name=request.getParameter("Name");
		String mail=request.getParameter("email");
		String password=request.getParameter("psw");
		String pass=request.getParameter("repeat");
	
if(password.equals(pass))
{
	
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Driver is loaded");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");  
		Statement st=con.createStatement();
		String strQuery = "SELECT COUNT(*) FROM cust where mail='"+mail+"'";
		ResultSet rs = st.executeQuery(strQuery);
		rs.next();
		String Countrow = rs.getString(1);
		if(Countrow.equals("0"))
		{
			PreparedStatement ps=con.prepareStatement("insert into cust values(?,?,?)");	
			ps.setString(1,name);
			ps.setString(2,mail);
			ps.setString(3,password);
			int i=ps.executeUpdate();
			if(i>0)
							//out.print("<button><span style='color:blue'>registerd</span></button>");
							//hs.setAttribute("password",pass);
			out.println("<script>alert(\"you are done\")</script>");
			rd.include(request,response);
		}
		else{
			
				out.println("<script>alert(\"you are already registered\")</script>  <a href='index.html'>    ok   </a>");
				response.sendRedirect("index.html");
			
		}
	}
		catch (Exception e2) {System.out.println(e2);}
		out.close();
}
		
		else
		{
			out.println("password error please enter right password<a href='index.html'>TRY ONCE AGAIN!</a>");
		}
			
	}
}

