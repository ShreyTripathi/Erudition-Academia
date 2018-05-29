<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="jquery-3.3.1.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>

  <title>Add Announcements</title>
</head>
<style>
#mynav{
  background-color: #f00;
}
#navright li a{
  color: #fff;
  font-size: 1.4em;
}
#mylogo{
  color: #fff;
  font-size:1.4em;
}
</style>
<body>
<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

    String heading = request.getParameter("heading");
    String courseId = request.getParameter("courseId");
    String dated = request.getParameter("dated");
    String content = request.getParameter("content");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			int i = st.executeUpdate("insert into announcement(courseid,heading,content,dated) values('"+courseId+"','"+heading+"','"+content+"','"+dated+"')");
			response.sendRedirect("announcement_ops.jsp?courseId="+courseId);
		}catch(Exception e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		%>
			<div> <a href="add_course.jsp">Go Back</a></div>
		<%
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
