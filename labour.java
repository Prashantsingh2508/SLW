import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.*;

public class labour extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		RequestDispatcher rd=request.getRequestDispatcher("Labour.jsp");
		PrintWriter out = response.getWriter();
		
		
		//Here we get data from Html
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String loc=request.getParameter("loc");
		String category=request.getParameter("category");
		long num= Long.parseLong(request.getParameter("mno")); 
		String pass=request.getParameter("psw");
	
	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
			PreparedStatement ps=con.prepareStatement("insert into empcat values(?,?,?,?,?,?)");
		
			ps.setString(1,id);
			ps.setString(2,name);
			ps.setString(3,loc);
			ps.setString(4,category);
			ps.setLong(5,num);
			ps.setString(6,pass);
		
			int i=ps.executeUpdate();
			if(i>0)
			out.println("<script>alert(\"you are done\")</script>");
			
			rd.include(request,response);
			
		}
			catch (Exception e2) {System.out.println(e2);}
			out.close();
		
		
		
			
	}
}

