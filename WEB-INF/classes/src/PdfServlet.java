import java.io.*;

import java.nio.file.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import java.sql.*;

public class PdfServlet extends HttpServlet {

	Connection con = null;
	Statement st=null;
	ResultSet rs=null;

	String dbName = "modif_eru_acad";
	String user="root";
	String pass="root";
	
	String path="";		//it will contain the complete path of the pdf file
	String fileName="";	//the name of the file to be opened
	String c_id="";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		fileName = request.getParameter("fileName");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			rs = st.executeQuery("Select * from content where filename='"+fileName+"'");
			if(rs.next())
			{
				c_id = rs.getString("courseid");
				path = rs.getString("path");
			}			
		}
		catch(Exception e)
		{
			response.sendRedirect("error.jsp");
		}
		if(c_id==null||c_id.equals("")||c_id.equals("null"))
			response.sendRedirect("servlet_error.jsp");

		File file = new File(path);
		response.setHeader("Content-Type",    getServletContext().getMimeType(file.getName()));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename="+fileName);
		Files.copy(file.toPath(), response.getOutputStream());
	}
}
