<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%if(session.getAttribute("errorFromEnroll")!=null){
  session.removeAttribute("errorFromEnroll");}
		String uId = session.getAttribute("uId").toString();
    String courseId = request.getParameter("courseId");
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int i=-100;
		try{
			String dbName = "modif_eru_acad";
			String user= "root";
			String password= "root";

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,password);
			st = con.createStatement();
			i = st.executeUpdate("insert into enrolled(userid,courseid) values('"+uId+"','"+courseId+"')");
      response.sendRedirect("stud_dash.jsp");
		}
		catch(Exception e){

      //out.println(courseId);
			response.sendRedirect("error.jsp");
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
