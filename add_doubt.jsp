<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    if(session.getAttribute("uId")==null)
      response.sendRedirect("login.jsp");
    String uId = session.getAttribute("uId").toString();
    String heading = request.getParameter("heading");
    String courseId = request.getParameter("courseId");
    String dated = request.getParameter("dated");
    String content = request.getParameter("content");
    String answer ="null";
    answer = request.getParameter("answer");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			int i = st.executeUpdate("insert into doubt(userid,courseid,doubtheading,content,dated,doubtanswer) values('"+uId+"','"+courseId+"','"+heading+"','"+content+"','"+dated+"','"+answer+"')");
			response.sendRedirect("stud_dash.jsp");
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
