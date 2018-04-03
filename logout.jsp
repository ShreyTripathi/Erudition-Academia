<%@ page import="java.io.*"%>
<html>
	<%
		if(session !=null)
			session.invalidate();
		response.sendRedirect("login.jsp");
	%>
</html>
