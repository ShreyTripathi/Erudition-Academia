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
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try{	
			String dbName = "modif_eru_acad";
			String user= "root";
			String pass= "root";
			String uType = request.getParameter("utype").toLowerCase();
			String uId = request.getParameter("uId");
			String pwd = request.getParameter("pwd");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			if(uType.equals("faculty"))
			{
				 rs =  st.executeQuery("Select pass from faculty where fuserid='"+uId+"'");
			}
			else
			{
				 rs =  st.executeQuery("Select pass from student where suserid='"+uId+"'");
			}
			if(rs.next())			
			{
				if(rs.getString("pass").toString().equals(pwd))
				{
					session.setAttribute("uId",uId);
					session.setAttribute("type",uType);
					if(uType.equals("faculty"))
					{response.sendRedirect("fac_dash.jsp");}
					else{response.sendRedirect("stud_dash.jsp");}
				}
				else
				{%>
					<div class="alert alert-info">
						Password does not match.
					</div>
				<%
					request.getRequestDispatcher("login.jsp").forward(request,response);
				}
			}
			else{
			%>
				<div class="alert alert-info">
					The user is not registered!
				</div>
			<%
				request.getRequestDispatcher("login.jsp").forward(request,response);
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
