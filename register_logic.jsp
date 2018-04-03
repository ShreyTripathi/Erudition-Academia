<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
		String utype = request.getParameter("utype").toLowerCase();
		String uid = request.getParameter("userid");
		String pass = request.getParameter("pass");
		String ufName = request.getParameter("ufName");
		String ulName = request.getParameter("ulName");
		String dob = request.getParameter("udob");
		String gender = request.getParameter("gender");
		String grad = request.getParameter("graduate");
		String post_g = request.getParameter("postgrad");
		String street  = request.getParameter("street");
		String city  = request.getParameter("city");
		String state  = request.getParameter("state");
		String country  = request.getParameter("country");
		int zipcode  = Integer.parseInt(request.getParameter("zipcode"));
		String email_id  = request.getParameter("email_id");
		String phoneno = request.getParameter("phoneno");

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int i;
		try{
			String dbName = "modif_eru_acad";
			String user= "root";
			String password= "root";

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,password);
			st = con.createStatement();
			if(utype.equals("faculty"))
			{
				rs = st.executeQuery("Select * from faculty where fuserid='"+uid+"'");
				if(rs.next()){
				%>
					<div class = "container">
					<div class="alert alert-danger">User Id already exists.</div>
					<a href="register.jsp">Register Again</a>
					</div>
				<%
				}
				else
				{
					i = st.executeUpdate("insert into faculty values('"+uid+"','"+pass+"','"+ufName+"','"+ulName+"','"+dob+"','"+gender+"','"+grad+"','"+post_g+"','"+street+"','"+city+"','"+state+"','"+country+"','"+zipcode+"','"+email_id+"','"+phoneno+"')");

					session.setAttribute("uId",uid);
					session.setAttribute("type",utype);
					response.sendRedirect("fac_dash.jsp");
				}
		  }
			else
			{
				rs = st.executeQuery("Select * from student where suserid='"+uid+"'");
				if(rs.next())
        {%>
          <div class = "container">
					<div class="alert alert-danger">User Id already exists.</div>
					<a href="register.jsp">Register Again</a>
					</div>
				<%
				}
				else{
				i = st.executeUpdate("insert into student values('"+uid+"','"+pass+"','"+ufName+"','"+ulName+"','"+dob+"','"+gender+"','"+grad+"','"+street+"','"+city+"','"+state+"','"+country+"','"+zipcode+"','"+email_id+"','"+phoneno+"')");

					session.setAttribute("uId",uid);
					session.setAttribute("type",utype);
					response.sendRedirect("stud_dash.jsp");
				}
			}
		}
		catch(Exception e){
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
</body>
</html>
