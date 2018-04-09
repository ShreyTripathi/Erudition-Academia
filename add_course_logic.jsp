<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #mynav{
    background-color: #00f;
  }
  #navright li a{
    color: #fff;
    font-size: 1.4em;
  }
  #mylogo{
    color: #fff;
    font-size:1.6em;
  }
  </style>
</head>
<body>
<%
    String cat = request.getParameter("category");
		String c_id = request.getParameter("course_id");
		String c_name = request.getParameter("course_name");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String duration = request.getParameter("duration");
		String fee = request.getParameter("fee");
		String fuserid = session.getAttribute("uId").toString();

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			int i = st.executeUpdate("insert into course(courseid,coursename,sdate,edate,duration,fee,fuserid,category) values('"+c_id+"','"+c_name+"','"+sdate+"','"+edate+"','"+duration+"','"+fee+"','"+fuserid+"','"+cat+"')");
				session.setAttribute("courseid",c_id);
				response.sendRedirect("add_course_det.jsp");

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
