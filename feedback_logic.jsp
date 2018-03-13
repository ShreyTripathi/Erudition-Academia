<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<jsp:include page="navbar_public.jsp" />
<%
	if(!session.getAttribute("type").toString().equals("student"))
	{
%>		<div class="alert alert-info">Only Students are allowed to give feedbacks.</div>
		<a href="logout.jsp">Go Back</a>	
<%	}

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";

	String coursename = request.getParameter("courseName");
	String courseRate=request.getParameter("course_rate");
	String contentRate=request.getParameter("content_rate");
	String understand=request.getParameter("understand");
	String uId = session.getAttribute("uId").toString();
	String improve = request.getParameter("improve");

	int i=0;	

	try{	
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();
		i = st.executeUpdate("insert into feedback(coursename,courserate,contentrate,understand,improve,suserid) values('"+coursename+"','"+courseRate+"','"+contentRate+"','"+understand+"','"+improve+"','"+uId+"')");
		response.sendRedirect("stud_dash.jsp");
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
</div>
</body>
</html>
