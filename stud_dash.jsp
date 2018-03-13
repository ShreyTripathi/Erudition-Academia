<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<title>DashBoard</title>
<body>
<div class="container">
	<jsp:include page="navbar_public.jsp" />
<%
		if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
		{
			response.sendRedirect("login.jsp");
		}
		else if(session.getAttribute("type").toString().equals("faculty"))
		{
			request.getRequestDispatcher("fac_dash.jsp").forward(request,response);
		}
%>
		<h1>Student Dashboard</h1>
<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		Statement st1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try{	
			
			String uType = session.getAttribute("type").toString();
			String uId = session.getAttribute("uId").toString();

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			rs= st.executeQuery("Select sfname,slname,sdob,gender,graduate,street,city,state,country from "+uType+" where suserid='"+uId+"'");
			if(rs.next())
			{%>
				<table>
				<tr><td>User Name:</td><td><%=rs.getString("sfname")%> <%=rs.getString("slname")%></td></tr>
				<tr><td>D.O.B. :</td><td><%=rs.getString("sdob")%></td></tr>
				<tr><td>Gender :</td><td><%=rs.getString("gender")%></td></tr>
				<tr><td>Graduate :</td><td><%=rs.getString("graduate")%></td></tr>
				<tr><td>Address :</td><td><%=rs.getString("street")%></td></tr>
				<tr><td></td><td><%=rs.getString("city")%> <%=rs.getString("state")%></td></tr>
				<tr><td></td><td><%=rs.getString("country")%></td></tr>

				<tr><td></td><td></td></tr>				
				
				</table>
		
			<%}
			%>
			<hr>
			<%
				st1 = con.createStatement();
				rs1= st.executeQuery("Select coursename from feedback where suserid='"+uId+"'");
				if(rs1.next())
				{
			%>
				<h2>Feed Backs Given to</h2>
				<table>
				<tr><th>Course Names</th></tr>
				<%
				do{
				%>
				<tr><td><%=rs1.getString("coursename")%></td></tr>
				<%
				}while(rs1.next());	
				%>			
				</table>
				
			<%	}
			%>
			<a href="feedback_form.jsp">Give FeedBack</a>
		<%
		}catch(Exception e){
		%>
				<tr><td><div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div></td></tr>
		<%
			out.println(e);
		}
		finally{
			try{
				session.removeAttribute("courseid");
				st.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</table>
</div>
</body>
</html>

