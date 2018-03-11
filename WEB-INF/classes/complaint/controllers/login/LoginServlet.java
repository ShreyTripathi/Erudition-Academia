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
		String Id=req.getParameter("id");
		String pass=req.getParameter("pass");
		UserBean userBean = new UserBean();
		userBean.setId(Integer.parseInt(Id));
		userBean.setPass(pass);
		Login_Auth LA=new Login_Auth();
		int option=LA.validate();
		if(option==0)
		{
			req.setAttribute("np","not present");		
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req,res);
		}
		else 
		{
			//Session sess= new Session();
			//sess.setAttribute("id",Integer.parseInt(Id));				
			if(option==1)
			{
				res.sendRedirect("login_admin.jsp");
			}
			else
			{
				res.sendRedirect("login_user.jsp");
			}
		}
	}
}
