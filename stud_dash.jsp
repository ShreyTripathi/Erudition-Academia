<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="nav_css.css">
    <style>
    .mytable{
      width: 50%;
      margin-left: auto;
      margin-right: auto;
      font-size: 1.2em;
      border: 1px solid;
      padding: 10px;
      //box-shadow: 3px 4px #666666;
    }
    .main_text{
      font-size: 1.4em;
    }
    .grey_color{
        background: rgb(238,238,238);
        background: rgba(238, 238, 238, .5);
      }
    body {
     background: url('my.jpg') no-repeat center center fixed;
     -webkit-background-size: cover;
     -moz-background-size: cover;
     -o-background-size: cover;
     background-size: cover;
      }
    </style>
<title>DashBoard</title>
<body>
</head>
  <div class="container-fluid">
  	<jsp:include page="navbar_public.jsp" />
</div>
<div class="container text-center grey_color main_text" style="font-size:1.4em;">
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
		<h1 style="background-color:#eee;box-shadow:6px 3px #888888;margin-bottom:1.3em">Student Dashboard</h1>
<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		Statement st1 = null,enrolledSt=null;
		ResultSet rs = null,enrolledRs=null;
		ResultSet rs1 = null;
		try{

			String uType = session.getAttribute("type").toString();
			String uId = session.getAttribute("uId").toString();

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
      enrolledSt = con.createStatement();
			rs= st.executeQuery("Select sfname,slname,sdob,gender,graduate,street,city,state,country from "+uType+" where suserid='"+uId+"'");
      enrolledRs = enrolledSt.executeQuery("Select enrolled.courseId,coursename from enrolled,course where enrolled.userid='"+session.getAttribute("uId").toString()+"' and course.courseid=enrolled.courseid");
			if(rs.next())
			{%>
				<table class="table table-bordered mytable">
        <tr><th>Parameter</th><th>Value</th></tr>
				<tr><td><strong>User Name:</strong></td><td><%=rs.getString("sfname")%> <%=rs.getString("slname")%></td></tr>
				<tr><td><strong>D.O.B. :</strong></td><td><%=rs.getString("sdob")%></td></tr>
				<tr><td><strong>Gender :</strong></td><td><%=rs.getString("gender")%></td></tr>
				<tr><td><strong>Graduate :</strong></td><td><%=rs.getString("graduate")%></td></tr>
				<tr><td><strong>Address :</strong></td><td><%=rs.getString("street")%>, <%=rs.getString("city")%> <%=rs.getString("state")%></td></tr>
				<tr><td><strong>Country:</strong></td><td><%=rs.getString("country")%></td></tr>

				</table>

			<%}
			%>
			<hr>
      <h2 style="background-color:#eee;box-shadow:6px 3px #888888;margin-bottom:1.3em">Enrolled Courses</h2><%
      if(enrolledRs.next())
      {%>
        <table class="table table-bordered mytable">
        <tr><th>Course Id</th><th>Course Name</th><th>Go To</th></tr>
        <%
        do{ String courseId=enrolledRs.getString("courseid");
          %>
            <tr><td><%=courseId%></td><td><%=enrolledRs.getString("coursename")%></td><td><div class="dropdown"><button class="btn btn-primary dropdown-toggle" style="font-size:1.1em" type="button" data-toggle="dropdown">Select Operation<span class="caret"></span></button><ul style="font-size:1.1em" class="dropdown-menu"><li><a href="doubt_stud.jsp?courseId=<%=courseId%>">Ask Doubts</a></li><li><a href="course_det_view1.jsp?courseId=<%=courseId%>">Go to Course</a></li><li><a href="see_announcements.jsp?courseId=<%=courseId%>">View Announcements</a></li><li><a href="download_pdf.jsp?courseId=<%=courseId%>">Download Content</a></li></ul></div>
            </td></tr>

        <%}while(enrolledRs.next());
        %>
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
				<h2 style="background-color:#eee;box-shadow:6px 3px #888888;margin-bottom:1.3em">Feed Backs Given to</h2>
				<table class="table table-bordered mytable">
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
