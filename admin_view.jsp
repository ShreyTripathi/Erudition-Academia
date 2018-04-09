<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.main_text{
  font-size: 1.4em;
}
</style>
<link rel="stylesheet" href="nav_css.css">
</head>
<body>
<jsp:include page="navbar_public.jsp" />
<div class="container main_text text-center">
<%
	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("faculty"))
	{
		response.sendRedirect("login.jsp");
	}
		String uId = session.getAttribute("uId").toString();
		String uType= session.getAttribute("type").toString();

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";
		String choice = request.getParameter("view_choice").toLowerCase();

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			if(choice.equals("students"))
			{
				rs = st.executeQuery("select * from student");
				int i=0;
			%>
				<table class="table table-bordered">
			<%	while(rs.next())
				{
					if(i==0)
					{i++;%>
          <thead>
					<tr><th>Parameter</th><th>Value</th></tr>
          </thead>
					<%}%>

					<tr><td>User ID: </td><td><%=rs.getString("suserid")%></td></tr>
					<tr><td>User Name: </td> <td><%=rs.getString("sfname")%> <%=rs.getString("slname")%></td></tr>
					<tr><td>Date Of Birth: </td><td><%=rs.getString("sdob")%></td></tr>
					<tr><td>Gender: </td><td><%=rs.getString("gender")%></td></tr>
					<tr><td>Graduate: </td><td><%=rs.getString("graduate")%></td></tr>
					<tr><td>Address: </td><td><%=rs.getString("street")%> <%=rs.getString("city")%> <%=rs.getString("state")%> <%=rs.getString("country")%></td></tr>
					<tr><td>Email: </td><td><%=rs.getString("email_id")%></td></tr>

				<%
				}
			%>
				</table>
			<%
			}
			else if(choice.equals("faculties"))
			{
				rs = st.executeQuery("select * from faculty");
				int i=0;
			%>
				<table class="table table-bordered main_text">
			<%	while(rs.next())
				{
					if(i==0)
					{i++;%>
					<tr><th>Parameter</th><th>Value</th></tr>
					<%}%>
					<tr><td>User ID: </td><td><%=rs.getString("fuserid")%></td></tr>
					<tr><td>User Name:</td> <td><%=rs.getString("ffname")%> <%=rs.getString("flname")%></td></tr>
					<tr><td>Date Of Birth: </td><td><%=rs.getString("dob")%></td></tr>
					<tr><td>Gender: </td><td><%=rs.getString("gender")%></td></tr>
					<tr><td>Graduate: </td><td><%=rs.getString("graduate")%></td></tr>
					<tr><td>Post-Graduate: </td><td><%=rs.getString("postgrad")%></td></tr>
					<tr><td>Address: </td><td><%=rs.getString("street")%> <%=rs.getString("city")%> <%=rs.getString("state")%> <%=rs.getString("country")%></td></tr>
					<tr><td>Email: </td><td><%=rs.getString("email_id")%></td></tr>

				<%}
			%>
				</table>
			<%
			}
			else if(choice.equals("faculty_det"))
			{
				String facId = request.getParameter("id");
				rs = st.executeQuery("select * from faculty where fuserid='"+facId+"'");
				int i=0;
			%>
				<table class="table table-bordered main_text">
			<%	if(rs.next()){
        do
				{
					if(i==0)
					{i++;%>
          <thead>
					<tr><th>Parameter</th><th>Value</th></tr>
        </thead>
					<%}%>

					<tr><td>User ID: </td><td><%=rs.getString("fuserid")%></td></tr>
					<tr><td>User Name: </td> <td><%=rs.getString("ffname")%> <%=rs.getString("flname")%></td></tr>
					<tr><td>Date Of Birth: </td><td><%=rs.getString("dob")%></td></tr>
					<tr><td>Gender: </td><td><%=rs.getString("gender")%></td></tr>
					<tr><td>Graduate: </td><td><%=rs.getString("graduate")%></td></tr>
					<tr><td>Post-Graduate: </td><td><%=rs.getString("postgrad")%></td></tr>
					<tr><td>Address: </td><td><%=rs.getString("street")%> <%=rs.getString("city")%> <%=rs.getString("state")%> <%=rs.getString("country")%></td></tr>
					<tr><td>Email: </td><td><%=rs.getString("email_id")%></td></tr>

				<%}while(rs.next());
      }else{out.println("<div class='alert-info'>No Such User Exists. Make Sure the User Id is correct.</div>");}
			%>
				</table>
			<%
			}
			else if(choice.equals("stud_det"))
			{
				String stud_id = request.getParameter("id");
				rs = st.executeQuery("select * from student where suserid='"+stud_id+"'");
				int i=0;
			%>
				<table class="table table-bordered main_text">
			<%if(rs.next()){
      	do
				{
					if(i==0)
					{i++;%>
          <thead>
					<tr><th>Parameter</th><th>Value</th></tr>
        </thead>
					<%}%>

					<tr><td>User ID: </td><td><%=rs.getString("suserid")%></td></tr>
					<tr><td>User Name: </td> <td><%=rs.getString("sfname")%> <%=rs.getString("slname")%></td></tr>
					<tr><td>Date Of Birth: </td><td><%=rs.getString("sdob")%></td></tr>
					<tr><td>Gender: </td><td><%=rs.getString("gender")%></td></tr>
					<tr><td>Graduate: </td><td><%=rs.getString("graduate")%></td></tr>
					<tr><td>Address: </td><td><%=rs.getString("street")%> <%=rs.getString("city")%> <%=rs.getString("state")%> <%=rs.getString("country")%></td></tr>
					<tr><td>Email: </td><td><%=rs.getString("email_id")%></td></tr>

			<%}while(rs.next());
    }else{out.println("<div class='alert-info'>No Such User Exists. Make Sure the User Id is correct.</div>");}
			%>
				</table>
			<%
			}

		}catch(Exception e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			try{
				st.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
<br>
<div><a href="fac_dash.jsp">Go Back</a></div>
</div>
</body>
</html>
