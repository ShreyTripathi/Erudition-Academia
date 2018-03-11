<%@page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
		jQuery.each($(".selected"),function()
		{
			$(this).on("click",function(){
				$("#topic").val($(this).html());
				$("#form1").submit();		
			});
		});
});
</script>
</head>
<body>
<div class="container">
<jsp:include page="navbar_public.jsp" />

<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	try{	
			
		String uType = session.getAttribute("type").toString();
		String uId = session.getAttribute("uId").toString();

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();
		rs= st.executeQuery("Select distinct topic_name from question");
		if(rs.next())
		{
		%>
			<form action="quiz.jsp" method="get" id="form1">
			<table>		
			<tr><td>Topics for Quiz:</td></tr>	
			<tr><td></td><td class="selected"><%=rs.getString("topic_name")%></td></tr>
			<%
			while(rs.next())
			{%>
				<tr><td></td><td class="selected"><%=rs.getString("topic_name")%></td></tr>
		
			<%}%>
			<tr><td></td><td><input type="hidden" id="topic" name="topic"></td></tr>
			<!--<tr><td></td><td><input type="submit" value="Enter Quiz" ></td></tr>-->
			</table>
			</form>
	<%	}
		else{%>
			<div class="alert alert-warning">There are no quizzes uploaded yet.</div>
		<%}
		if(session.getAttribute("uId")!=null)
		{
		%>
		<a href="stud_dash.jsp">Go Back</a>
		<%}
		else
		{%>
		<a href="login.jsp">Go Back</a>
		<%}
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
</div>
</body>
</html>
