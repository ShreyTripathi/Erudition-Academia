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
	if(session.getAttribute("uId")==null){%>
		<div class= "container"><div class="alert alert-danger">Sorry, you need to <a href="login.jsp">login</a> or <a href="register.jsp">register</a> first.</div>
		</div>
	<%
	}	
	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";

	String choice = request.getParameter("answer");

	int qId = Integer.parseInt(session.getAttribute("qId").toString());
	
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	try{	
		if(session.getAttribute("score")==null)
		{
			session.setAttribute("score",0);
			session.setAttribute("right",0);
			session.setAttribute("wrong",0);			
		}
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();
		rs = st.executeQuery("select correct_answer,"+choice+" from question where id="+qId+"");
		if(rs.next())
		{
			if(rs.getString("correct_answer").equals(rs.getString(choice)))
			{
				session.setAttribute("ans_st","correct");
				session.setAttribute("score",Integer.parseInt(session.getAttribute("score").toString())+1);
				session.setAttribute("right",Integer.parseInt(session.getAttribute("right").toString())+1);
			}
			else{
				session.setAttribute("ans_st","incorrect");
				session.setAttribute("wrong",Integer.parseInt(session.getAttribute("wrong").toString())+1);
			}
			request.getRequestDispatcher("quiz.jsp").forward(request,response);
		}
		
	}catch(Exception e){

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
