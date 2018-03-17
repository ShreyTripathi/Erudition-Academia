<%@ page import="java.io.*"%>
<html>
	<%
		if(session !=null)
			session.invalidate();
		request.getRequestDispatcher("login.jsp").forward(request,response);
	%>
</html>
