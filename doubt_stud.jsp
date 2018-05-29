<%@ page import="java.sql.ResultSet, java.sql.Connection, java.sql.Statement,java.sql.DriverManager, java.util.Date,java.text.SimpleDateFormat"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="jquery-3.3.1.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>

<style>
.main_text{
  font-size: 1.4em;
}
body {
 background: url('table.jpg') no-repeat center center fixed;
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}
</style>
<link rel="stylesheet" href="nav_css.css">
<title>Ask Doubts</title>
</head>
<body>
<jsp:include page="navbar_public.jsp" />
<div class="container main_text text-center">
<%
  String courseId = request.getParameter("courseId");
	if(session.getAttribute("uId")==null||!session.getAttribute("type").toString().equals("student"))
	{
		response.sendRedirect("login.jsp");
	}
		String uId = session.getAttribute("uId").toString();
		String uType= session.getAttribute("type").toString();

		Connection con = null;
		Statement st = null,checkCourseSt=null;
		ResultSet rs = null,checkCourseRs=null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
      checkCourseSt = con.createStatement();
      checkCourseRs = checkCourseSt.executeQuery("select coursename from course where courseid='"+courseId+"'");
			rs = st.executeQuery("select * from doubt where courseid = '"+courseId+"' order by dated desc");
      if(!checkCourseRs.next()){out.println("<div class='alert-warning'>Wrong Course Id Passed. Make Sure Course Id is correct.</div>");}
      else{ String courseName = checkCourseRs.getString("coursename");
      if(rs.next())
      { int i=1;
        %>

        <h1>Announcements Table</h1>
        <p style="font-size:1.2em">CourseId: <%=courseId%></p>
        <table class="table table-bordered">
        <thead><tr><th>Doubt No.</th><th>Topic</th><th>Content</th><th>Date</th><th>Answer</th></tr></thead>
        <tbody>
      <%
        do{ String answer = rs.getString("doubtanswer");
          %>
            <tr><td><%=i%></td><td><%=rs.getString("doubtheading")%></td><td><%=rs.getString("content")%></td><td><%=rs.getString("dated")%></td><td><%if(answer.equals("null")){out.print("Yet to be answered");}else{out.print(answer);}%></td></tr>
        <%i++;
      }while(rs.next());
        %>
        </tbody>
        </table>
      <%}else{out.println("<div class='alert alert-info'>Always Happy to Help.</div>");}
      Date dateObj = new Date();
      String dateStr = (new SimpleDateFormat("yyyy-MM-dd").format(dateObj)).toString();
  %>
    <h2>Add Doubt:<%=courseName%></h2>
    <form action="add_doubt.jsp" method="post">
    <table class="table ">
      <tr><td><label for="heading">Doubt Heading:</label></td><td><input type="text" name="heading" size="45" required/></td></tr>
      <input type="hidden" name="dated" value="<%=dateStr%>" />
      <input type="hidden" name="courseId" value="<%=courseId%>" />
      <tr><td><label for="content">Doubt Details:</label></td><td><textarea cols="55" rows="3" name="content" required></textarea></td></tr>
      <tr><td><input type="submit" value="I have correctly entered my Doubt"></td></tr>
      </table>
    </form>
    <%
      }//end of else which tells that course is registered

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
