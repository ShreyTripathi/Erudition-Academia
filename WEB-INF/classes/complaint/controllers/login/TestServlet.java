package complaint.controllers.login;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.io.*;
import complaint.models.login.*;
public class LoginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException,ServletException
	{
		out.println("<html><body>");
		out.println("<h1>This is Test Servlet</h1>");
		out.println("<p>Random Paragraph</p>");
		out.println("</body></html>");		
	}
}
